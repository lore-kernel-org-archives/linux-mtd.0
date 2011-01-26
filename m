Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pi7nB-0002Rm-D4
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2011 16:00:22 +0000
Received: by bwz5 with SMTP id 5so1531196bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Jan 2011 08:00:13 -0800 (PST)
Subject: Re: UBIFS incompatibilities due to min_io_size adaptions?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Holger Brunck <holger.brunck@keymile.com>
In-Reply-To: <4D402DA7.8050101@keymile.com>
References: <4D402DA7.8050101@keymile.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 26 Jan 2011 17:49:51 +0200
Message-ID: <1296056991.2606.10.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andreas Huber <andreas.huber@keymile.com>,
	Anatolij Gustschin <agust@denx.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-01-26 at 15:20 +0100, Holger Brunck wrote:
> Hi all,
> we use UBI and UBIFS on NOR and NAND based systems and kernel 2.6.33. In the
> last days we applied the latest UBI and MTD patches for the min I/O size.
> 
> Due to commit  a121f643993474548fe98144514c50dd4f3dbe76 UBI: use
> mtd->writebufsize to set minimal I/O unit size
> now the min I/O size is equal to the writebuffersize of the flash.

Oh, this is really bad. Thankfully we still have time to revert the
change and think about proper backward-compatible solution.

> This caused incompatibilites in the UBIFS. We have an UBIFS on a board on a NOR
> flash created in the past without the patches. Now with a newer SW and a newer
> kernel which has the latest fixes we can't mount the old UBIFS anymore.
> 
> UBIFS error (pid 865): validate_sb: min. I/O unit mismatch: 8 in superblock, 64 real
> UBIFS error (pid 865): validate_sb: bad superblock, error 1
> mount: wrong fs type, bad option, bad superblock on ubi0:cfg,
>         missing codepage or other error
> 
> If we reformate the UBIFS everything is ok, but we got a problem with the older
> SW image:
> UBIFS error (pid 865): validate_sb: min. I/O unit mismatch: 64 in
> superblock, 8 real
> UBIFS error (pid 865): validate_sb: bad superblock, error 1
> mount: wrong fs type, bad option, bad superblock on ubi0:cfg,
>         missing codepage or other error
> 
> Is there a way to solve this problem? I do not hope that the only solution is to
> remove these patch.

Yes, the first solution is to revert the UBI patch. There seems to be
more work than we thought. Probably we need to add notion of
writebufsize to UBI and UBIFS as well.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
