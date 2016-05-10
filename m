Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0935-00042D-2u
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 14:54:12 +0000
Received: by mail-qk0-x232.google.com with SMTP id n62so7182641qkc.2
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2016 07:53:46 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mediatek@lists.infradead.org, erin.lo@mediatek.com,
 daniel.thompson@linaro.org, blogic@openwrt.org
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <5731F5F7.6000204@linaro.org>
Date: Tue, 10 May 2016 10:53:43 -0400
MIME-Version: 1.0
In-Reply-To: <20160510141335.442d3d7b@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/10/2016 08:13 AM, Boris Brezillon wrote:
>> +
>> >+void mtk_ecc_hw_init(struct mtk_ecc *ecc)
> No need to expose this function. Make it static and remove the
> prototype in your header.
>
yes, it was a leftover.
