Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZRZA-0004SN-RD
 for linux-mtd@lists.infradead.org; Wed, 01 Oct 2014 21:36:09 +0000
Received: by mail-wi0-f180.google.com with SMTP id em10so2095897wid.13
 for <linux-mtd@lists.infradead.org>; Wed, 01 Oct 2014 14:35:46 -0700 (PDT)
Received: from [192.168.0.2]
 (host36-238-dynamic.248-95-r.retail.telecomitalia.it. [95.248.238.36])
 by mx.google.com with ESMTPSA id wk5sm2467829wjb.12.2014.10.01.14.35.45
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Wed, 01 Oct 2014 14:35:46 -0700 (PDT)
Message-ID: <542C73B0.7000602@gmail.com>
Date: Wed, 01 Oct 2014 23:35:44 +0200
From: Angelo Dureghello <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBI ECC errors on kernel 3.16.2
References: <542C66EB.5000105@gmail.com>
 <CAFLxGvz0cKDdUNjQHyNcW3VbtQGW5FkamSJv+vx786TRBqDCkA@mail.gmail.com>
In-Reply-To: <CAFLxGvz0cKDdUNjQHyNcW3VbtQGW5FkamSJv+vx786TRBqDCkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/10/2014 22:51, Richard Weinberger wrote:
>
> Do mtd and ubi tests pass?
>
I have successfully executed all mtd tests under old kernel 3.5.1.
Now, with this new  kernel 3.16.2 i can't boot, and i don't know how i 
could test it.

Only thing that i can do is to minimally verify the flashed image from 
u-boot

U-Boot > ubi part rootfs 2048
UBI: attaching mtd1 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    126976 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          2048 (aligned 2048)
UBI: data offset:                4096
UBI: volume 0 ("rootfs") re-sized from 205 to 472 LEBs
UBI: attached mtd1 to ubi0
UBI: MTD device name:            "mtd=6"
UBI: MTD device size:            60 MiB
UBI: number of good PEBs:        480
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 480
UBI: number of PEBs reserved for bad PEB handling: 4
UBI: max/mean erase counter: 1/0
U-Boot >

It seems sane.

Also, once loaded the system and get the errors, the ubi get damaged
(check from U.boot shows ecc errors

Regards
