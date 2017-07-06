Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT1gB-0001AL-Br
 for linux-mtd@lists.infradead.org; Thu, 06 Jul 2017 07:58:29 +0000
Received: by mail-qt0-x232.google.com with SMTP id r30so9303353qtc.0
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jul 2017 00:58:05 -0700 (PDT)
MIME-Version: 1.0
Sender: romain.izard@mobile-devices.fr
In-Reply-To: <1499323603.18035.44.camel@gmail.com>
References: <20170705163411.23546-1-romain.izard.pro@gmail.com>
 <1499323603.18035.44.camel@gmail.com>
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Thu, 6 Jul 2017 09:57:44 +0200
Message-ID: <CAGkQfmP0oUakmCg_v9Wt1=HnM9dStoCHqQSvgyJixsf=q3Wbug@mail.gmail.com>
Subject: Re: [PATCH] mkfs.ubifs: Only require 17 LEBs
To: dedekind1@gmail.com
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-07-06 8:46 GMT+02:00 Artem Bityutskiy <dedekind1@gmail.com>:
>
> If this change is done in userspace, it should also be done in the
> kernel, which also can "format" the media.
>
> I cannot remember now, but very small volumes were very problematic.
> May be it was very inprecise free space estimation. Or something like
> -ENOSPC when trying to remove a file.
>
> The point is, make sure to test the tiny volumes very thoroughly before
> this is merged.
>

The algorithm used to determine the size of a UBIFS volume is not
exactly the same in mkfs.ubifs and in the kernel. mkfs.ubifs lets the
user tune more parameters, by specifying the number of log LEBs or
orphan LEBs, whereas the kernel calculates all these values by itself.

As a result, the kernel already accepts such small file systems, and
creates them when trying to mount an empty UBI volume of 17 LEBs. If the
empty volume has 16 or less LEBs, mounting fails with the following
error message:

[66897.450000] UBIFS error (ubi0:12 pid 12977): ubifs_mount: too few
LEBs (16), min. is 17

I modified mkfs.ubifs to be able to generate offline an image matching
the exact setup of an existing device. In this device, there is a small
volume with a tiny 17 LEBs UBIFS. I did not notice anything special
about it, but your comment worries me a little as I do not really have
the means to test "very thoroughly" this configuration.

Should I do something about it ?

Best regards,
-- 
Romain Izard
