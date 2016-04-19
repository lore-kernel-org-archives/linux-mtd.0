Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asd0v-0004Tq-1E
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2016 21:16:54 +0000
Received: by mail-qg0-x231.google.com with SMTP id f74so15738568qge.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 Apr 2016 14:16:32 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160419222446.052cfa63@bbrezillon>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 daniel.thompson@linaro.org, erin.lo@mediatek.com,
 linux-mediatek@lists.infradead.org
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Message-ID: <5716A02C.6090900@linaro.org>
Date: Tue, 19 Apr 2016 17:16:28 -0400
MIME-Version: 1.0
In-Reply-To: <20160419222446.052cfa63@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/19/2016 04:24 PM, Boris Brezillon wrote:
> On Mon, 11 Apr 2016 12:56:12 -0400
> Jorge Ramirez-Ortiz<jorge.ramirez-ortiz@linaro.org>  wrote:
>
>
>> >+static int mtk_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
>> >+				int page)
>> >+{
>> >+	u8 *buf = chip->buffers->databuf;
> You're touching ->databuf here, and the core uses this buffer for its
> internal cache. If want to use this buffer you have to invalidate the
> cache by setting chip->pagebuf to -1 first.
>

ack. we will use our private buffer instead as discussed on IRC.

  static int mtk_nfc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
                                 int page)
  {
-   u8 *data = chip->buffers->databuf;
+ struct mtk_nfc *nfc = nand_get_controller_data(chip);
         int ret;

-   memset(data, 0xff, mtd->writesize);
+ memset(nfc->buffer, 0xff, mtd->writesize);

         chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);

-   ret = mtk_nfc_write_page_hwecc(mtd, chip, data, 1, page);
+ ret = mtk_nfc_write_page_hwecc(mtd, chip, nfc->buffer, 1, page);
         if (ret < 0)
                 return -EIO;
