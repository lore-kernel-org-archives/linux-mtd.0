Received: from mail-vn0-x232.google.com ([2607:f8b0:400c:c0f::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2EmW-0006e0-IY
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2015 08:21:13 +0000
Received: by vnbf190 with SMTP id f190so1557351vnb.5
 for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2015 01:20:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOx4H9BWcd-8HNrXcnyP+YsnqDnjo-ucS7E9Zzvvr1WVd-os5A@mail.gmail.com>
References: <CAOx4H9BWcd-8HNrXcnyP+YsnqDnjo-ucS7E9Zzvvr1WVd-os5A@mail.gmail.com>
Date: Tue, 9 Jun 2015 10:20:49 +0200
Message-ID: <CAFLxGvww+uRu2vp2qLF3RdhCzrY6VxHUOpashUEUVf6PAg2b0Q@mail.gmail.com>
Subject: Re: Data integrity check after UBIFORMAT? Bad image sequence number
 error.
From: Richard Weinberger <richard.weinberger@gmail.com>
To: t kevin <kevint324@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 9, 2015 at 10:02 AM, t kevin <kevint324@gmail.com> wrote:
> Hi,
>
> We are using kernel 2.6.36 and mtd-util-1.5.1 on our box.
> During system upgrade, very very occasionally ( 1 in 100, maybe? ) I
> get this error at ubiattach after ubiformat.
>
> [ 1632.520000] UBI: attaching mtd8 to ubi0
> [ 1632.520000] UBI: physical eraseblock size: 131072 bytes (128 KiB)
> [ 1632.530000] UBI: logical eraseblock size: 126976 bytes
> [ 1632.530000] UBI: smallest flash I/O unit: 2048
> [ 1632.540000] UBI: sub-page size: 512
> [ 1632.540000] UBI: VID header offset: 2048 (aligned 2048)
> [ 1632.550000] UBI: data offset: 4096
> [ 1633.190000] UBI error: process_eb: bad image sequence number
> 559476870 in PEB 635, expected 139654706
>
> I understand ubiformat generate a random sequence number and write the
> sequence number to all PEB. So it seems an expected sequence number
> somehow is not written into nand flash correctly.

Are you sure about that?
Can it be that 559476870 is the seq number of the old image and the
new one is too small?
This is one of the main reasons why we have that number, such that
UBI can detect a partial written image.

> So I changed my upgrade sequence like below
>
> ubiformat ubi.img /dev/mtdx
> ubiattach /dev/mtdx
>
> if [ "$?" != "0" ]
>     #do ubiformat again
>     ubiformat ubi.img /dev/mtdx

You format it while it is attached?

> My question are,
> 1. What could possibly be wrong that caused the ubiformat fail?

It can be a faulty MTD driver, a usage error, everything.

> 2. Is there a way to verify the data integrity after a UBIFORMAT
> process? Something like "mtd verify" function.

I fear the answer is "no".

Thanks,
//richard
