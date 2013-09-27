Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPVz6-0007XX-3w
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2013 11:13:21 +0000
Received: by mail-lb0-f171.google.com with SMTP id u14so2126963lbd.16
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2013 04:12:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52456595.6080202@nod.at>
References: <1380141125-11063-1-git-send-email-richard@nod.at>
 <5243E033.7010403@gmail.com> <5243E130.3040200@nod.at>
 <CACQ1gAgqfHXwLjxhy9RrzFWe93Vmnc0chOg6uRKyqb6sVVQKxw@mail.gmail.com>
 <CACQ1gAjrSZv61sow6Ows50fu+ptjr3swqXDQT7NYGWqEx-w2Lg@mail.gmail.com>
 <52456595.6080202@nod.at>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 27 Sep 2013 13:12:36 +0200
Message-ID: <CACQ1gAj2NFQRhBP3Po4H9SZJgsSDrG97Qk68kiw3aKjQMnFg-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] UBI: Fix error path in scan_pool()
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/9/27 Richard Weinberger <richard@nod.at>:
> Am 26.09.2013 11:25, schrieb Richard Genoud:
>> I added some traces and I found that : (dumping ec_header after
>> "ubi_io_read_ec_hdr(ubi, pnum, ech, 0); " in ubi_scan_fastmap())
>> [    0.812500] UBI: default fastmap pool size: 95
>> [    0.820312] UBI: default fastmap WL pool size: 25
>> [    0.828125] UBI: attaching mtd2 to ubi0
>> [    0.851562] ubi_scan_fastmap:
>> [    0.859375] Erase counter header dump:
>> [    0.859375]  magic          0x55424923
>> [    0.867187]  version        1
>> [    0.867187]  ec             1
>> [    0.867187]  vid_hdr_offset 2048
>> [    0.875000]  data_offset    4096
>> [    0.875000]  image_seq      891983656 <- image seq is good.
>> [    0.875000]  hdr_crc        0x13cc9a78
>> [    0.882812] erase counter header hexdump:
>> [    0.882812] 00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00
>> 01 00 00 08 00 00 00 10 00 35 2a 97
>> 28 00 00 00 00  UBI#....................5*.(....
>> [    0.890625] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> 00 00 00 00 00 00 00 00 00 00 00 00
>> 00 13 cc 9a 78  ...............................x
>> [    0.960937] UBI error: scan_pool: bad image seq: 0x0, expected: 0x352a9728
>
> BTW: Do you really print the same PEB as scan_pool() complains about?
No, those debug traces were dumb, sorry...
I understand fastmap code better now :)
> Do you know how many PEBs for one fastmap are needed on your target?

Actually, I just found the problem.
U-boot has an old UBI implementation that was not aware of image_seq.
So when I write the ubifs volume, some PEB got erased by UBI(in uboot)
and written with a image_seq==0.
and fastmap doesn't pay attention to this use case.

I'll have to test a patch I made and I'll send it in a while.


Richard.
