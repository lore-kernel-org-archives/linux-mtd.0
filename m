Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlwnU-0004Ca-AE
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 09:22:36 +0000
Received: by mail-wg0-f42.google.com with SMTP id k14so398206wgh.15
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 01:22:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5459E090.1010300@broadcom.com>
References: <5459E090.1010300@broadcom.com>
Date: Wed, 5 Nov 2014 10:22:13 +0100
Message-ID: <CAFLxGvwTLd_uWBrj9RsD6FPFCSGsC_VcOmi_j0VLgVCJ=YVQ9w@mail.gmail.com>
Subject: Re: suspect UBIFS async operations causing issues during reboot
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Scott Branden <sbranden@broadcom.com>
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

On Wed, Nov 5, 2014 at 9:32 AM, Scott Branden <sbranden@broadcom.com> wrote:
> We are doing reboot testing with UBIFS on the 3.10 kernel with a new chipset
> we are working on.
>
> Over 1000's of reboots we eventually find that the NAND has uncorrectable
> ECC errors reported on a random page when it is mounted.
>
> We have found the problem is that a NAND erase operation is in progress when
> the reboot occurs. Since the NAND is in the middle of the erase operation
> the page is mostly FF with some random bits not erased when the reboot
> occurs.
>
> We suspect the problem is the asynchronous nature of the UBIFS operations.
> Perhaps the small write buffer that can take 3-5 seconds to be written or
> some other operation occuring in UBI/UBIFS?  I don't think the shutdown of
> the filesystem is dealing with all the threads properly.

And what about powercuts?
UBI/UBIFS was designed to survive powercuts.
If your NAND shows strange issues even after a clean reboot something nasty is
going on. Does your driver pass all UBI/MTD test?

-- 
Thanks,
//richard
