Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF01s-0004Uk-AV
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 14:18:21 +0000
Received: by mail-qk0-x230.google.com with SMTP id c73so163421832qkg.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jun 2016 07:17:59 -0700 (PDT)
Subject: Re: [PATCH v5 0/2] MTK Smart Device Gen1 NAND Driver
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1465919451-1891-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160620135411.2ef381e0@bbrezillon>
Cc: robh@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org,
 matthias.bgg@gmail.com, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, linux-mediatek@lists.infradead.org,
 erin.lo@mediatek.com, blogic@openwrt.org, daniel.thompson@linaro.org
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <5767FB13.5070503@linaro.org>
Date: Mon, 20 Jun 2016 10:17:55 -0400
MIME-Version: 1.0
In-Reply-To: <20160620135411.2ef381e0@bbrezillon>
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

On 06/20/2016 07:54 AM, Boris Brezillon wrote:
>> >Tests:
>> >======
>> >
>> >* UBIFS support has been validated on 512MiB device (iozone, dd)
>> >* All drivers/mtd/tests/* pass clean.
>> >* Speed tests:
>> >   eraseblock write speed:	7563 KiB/s
>> >   eraseblock read speed:	10904 KiB/s
>> >   page write speed:		7497 KiB/s
>> >   page read speed:		10864 KiB/s
>> >   2 page write speed:		7527 KiB/s
>> >   2 page read speed:		10881 KiB/s
>> >   erase speed:			103157 KiB/s
>> >   2x multi-block erase speed:	357445 KiB/s
>> >   4x multi-block erase speed:	362944 KiB/s
>> >   8x multi-block erase speed:	363805 KiB/s
>> >   16x multi-block erase speed:	364237 KiB/s
>> >   32x multi-block erase speed:	364670 KiB/s
>> >   64x multi-block erase speed:	365104 KiB/s
> Applied after fixing a few coding style issues.
>

Awesome.
Thanks for all the reviews and these additional fixes!

jorge
