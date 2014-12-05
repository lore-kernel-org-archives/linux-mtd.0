Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwwFq-0004Mc-BL
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 17:01:19 +0000
Received: by mail-oi0-f41.google.com with SMTP id a3so723463oib.14
 for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2014 09:00:57 -0800 (PST)
Received: from [10.81.16.218] (gate-tx3.freescale.com. [192.88.168.1])
 by mx.google.com with ESMTPSA id s4sm3347125oep.17.2014.12.05.09.00.56
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Dec 2014 09:00:56 -0800 (PST)
Message-ID: <5481E4C7.5010507@gmail.com>
Date: Fri, 05 Dec 2014 11:00:55 -0600
From: gmail <xhnjupt@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: MTD Read OOB Question
References: <54812742.8050407@gmail.com>
In-Reply-To: <54812742.8050407@gmail.com>
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

Hi,

Too clarify my question, test log was attached. The data in brackets are 
the first 10 bytes of OOB and the first data is for badblock pattern 
check. The log shows the inconsistency of raw read OOB data. Please 
check the block 2716 in first round and the block 4131 in second round.

The first round test:
===========================================================
nand: Micron MT29F128G08CFAABWP
nand: 8192MiB, MLC, page size: 8192, OOB size: 448
nand: 2 chips detected
gpmi-nand 1806000.gpmi-nand: enable the asynchronous EDO mode 5
Scanning device for bad blocks
Bad eraseblock 90 at 0x00000b400000    [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 91 at 0x00000b600000    [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 279 at 0x000022e00000   [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 708 at 0x000058800000   [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 805 at 0x000064a00000   [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 897 at 0x000070200000   [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 990 at 0x00007bc00000   [f7 ff ff ff ff ff ff ff ff ff]
Bad eraseblock 1217 at 0x000098200000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 1337 at 0x0000a7200000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 1671 at 0x0000d0e00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 1756 at 0x0000db800000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 1790 at 0x0000dfc00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 2432 at 0x000130000000  [ef ff ff ff ff ff ff ff ff ff]
Bad eraseblock 2463 at 0x000133e00000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 2611 at 0x000146600000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 2716 at 0x000153800000  [fb ff ff ff ff ff ff ff ff ff]  
<-- Does _NOT_ appear in other rounds
Bad eraseblock 3436 at 0x0001ad800000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 3584 at 0x0001c0000000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 3667 at 0x0001ca600000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 3772 at 0x0001d7800000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 3974 at 0x0001f0c00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4058 at 0x0001fb400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4131 at 0x000204600000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 4135 at 0x000204e00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4186 at 0x00020b400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4187 at 0x00020b600000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4871 at 0x000260e00000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 4952 at 0x00026b000000  [f7 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5010 at 0x000272400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5018 at 0x000273400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5114 at 0x00027f400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5358 at 0x00029dc00000  [bf 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5712 at 0x0002ca000000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 6017 at 0x0002f0200000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 6066 at 0x0002f6400000  [fb 00 00 00 00 00 00 00 00 00]
Bad eraseblock 6225 at 0x00030a200000  [ef ff ff ff ff ff ff ff ff ff]
Bad eraseblock 6806 at 0x000352c00000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 7105 at 0x000378200000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 7536 at 0x0003ae000000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 7906 at 0x0003dc400000  [bf 00 00 00 00 00 00 00 00 00]
Bad eraseblock 7935 at 0x0003dfe00000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 8139 at 0x0003f9600000  [bf 00 00 00 00 00 00 00 00 00]

The second round test:
===========================================================
nand: Micron MT29F128G08CFAABWP
nand: 8192MiB, MLC, page size: 8192, OOB size: 448
nand: 2 chips detected
gpmi-nand 1806000.gpmi-nand: enable the asynchronous EDO mode 5
Scanning device for bad blocks
Bad eraseblock 90 at 0x00000b400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 91 at 0x00000b600000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 279 at 0x000022e00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 708 at 0x000058800000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 805 at 0x000064a00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 897 at 0x000070200000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 990 at 0x00007bc00000  [f7 ff ff ff ff ff ff ff ff ff]
Bad eraseblock 1217 at 0x000098200000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 1337 at 0x0000a7200000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 1671 at 0x0000d0e00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 1756 at 0x0000db800000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 1790 at 0x0000dfc00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 2432 at 0x000130000000  [ef ff ff ff ff ff ff ff ff ff]
Bad eraseblock 2463 at 0x000133e00000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 2611 at 0x000146600000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 3436 at 0x0001ad800000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 3584 at 0x0001c0000000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 3667 at 0x0001ca600000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 3772 at 0x0001d7800000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 3974 at 0x0001f0c00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4058 at 0x0001fb400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4131 at 0x000204600000  [bf ff ff ff ff ff ff ff ff ff]  
<-- Does _NOT_ appear in third round
Bad eraseblock 4135 at 0x000204e00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4186 at 0x00020b400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4187 at 0x00020b600000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4871 at 0x000260e00000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 4952 at 0x00026b000000  [f7 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5010 at 0x000272400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5018 at 0x000273400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5114 at 0x00027f400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5358 at 0x00029dc00000  [bf 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5712 at 0x0002ca000000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 6017 at 0x0002f0200000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 6066 at 0x0002f6400000  [fb 00 00 00 00 00 00 00 00 00]
Bad eraseblock 6225 at 0x00030a200000  [ef ff ff ff ff ff ff ff ff ff]
Bad eraseblock 6806 at 0x000352c00000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 7105 at 0x000378200000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 7536 at 0x0003ae000000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 7906 at 0x0003dc400000  [bf 00 00 00 00 00 00 00 00 00]
Bad eraseblock 7935 at 0x0003dfe00000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 8139 at 0x0003f9600000  [bf 00 00 00 00 00 00 00 00 00]

The third round test:
===========================================================
nand: Micron MT29F128G08CFAABWP
nand: 8192MiB, MLC, page size: 8192, OOB size: 448
nand: 2 chips detected
gpmi-nand 1806000.gpmi-nand: enable the asynchronous EDO mode 5
Scanning device for bad blocks
Bad eraseblock 90 at 0x00000b400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 91 at 0x00000b600000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 279 at 0x000022e00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 708 at 0x000058800000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 805 at 0x000064a00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 897 at 0x000070200000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 990 at 0x00007bc00000  [f7 ff ff ff ff ff ff ff ff ff]
Bad eraseblock 1217 at 0x000098200000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 1337 at 0x0000a7200000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 1671 at 0x0000d0e00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 1756 at 0x0000db800000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 1790 at 0x0000dfc00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 2432 at 0x000130000000  [ef ff ff ff ff ff ff ff ff ff]
Bad eraseblock 2463 at 0x000133e00000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 2611 at 0x000146600000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 3436 at 0x0001ad800000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 3584 at 0x0001c0000000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 3667 at 0x0001ca600000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 3772 at 0x0001d7800000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 3974 at 0x0001f0c00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4058 at 0x0001fb400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4135 at 0x000204e00000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4186 at 0x00020b400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4187 at 0x00020b600000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 4871 at 0x000260e00000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 4952 at 0x00026b000000  [f7 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5010 at 0x000272400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5018 at 0x000273400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5114 at 0x00027f400000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5358 at 0x00029dc00000  [bf 00 00 00 00 00 00 00 00 00]
Bad eraseblock 5712 at 0x0002ca000000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 6017 at 0x0002f0200000  [00 00 00 00 00 00 00 00 00 00]
Bad eraseblock 6066 at 0x0002f6400000  [fb 00 00 00 00 00 00 00 00 00]
Bad eraseblock 6225 at 0x00030a200000  [ef ff ff ff ff ff ff ff ff ff]
Bad eraseblock 6806 at 0x000352c00000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 7105 at 0x000378200000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 7536 at 0x0003ae000000  [fb ff ff ff ff ff ff ff ff ff]
Bad eraseblock 7906 at 0x0003dc400000  [bf 00 00 00 00 00 00 00 00 00]
Bad eraseblock 7935 at 0x0003dfe00000  [bf ff ff ff ff ff ff ff ff ff]
Bad eraseblock 8139 at 0x0003f9600000  [bf 00 00 00 00 00 00 00 00 00]

On 12/4/2014 9:32 PM, gmail wrote:
> Hi,
>
> I have a question about how mtd read OOB. Does MTD assume the OOB is not
> covered by ECC? I think if raw read the OOB data, it hardly to guarantee
> the data consistency. I met this issue when system scans BBT, the BBT 
> list
> changes in each time.
>
> Is that a general problem? Any comments for it? Thanks.
>
> Han Xu
>
