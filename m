Received: from uproxy.gmail.com ([66.249.92.175])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYZik-0001lB-E4
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 22:25:43 -0400
Received: by uproxy.gmail.com with SMTP id j3so1205922ugf
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Apr 2006 19:25:33 -0700 (PDT)
Message-ID: <625fc13d0604251925o10a5062bj45f8397948f6fe5f@mail.gmail.com>
Date: Tue, 25 Apr 2006 21:25:33 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Peter Buelow" <pete@putzin.net>
In-Reply-To: <44871.129.188.33.221.1145996362.squirrel@www.westnelson.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <44871.129.188.33.221.1145996362.squirrel@www.westnelson.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Unlocking Intel flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/25/06, Peter Buelow <pete@putzin.net> wrote:
> Ok, hoping someone knows, because Google isn't helping oddly enough. I've
> just started putting together some work that includes adding a JFFS2
> partition using MTD (obviously) that sits on it's own (ie, it's not
> bootable and is just a small area that I would like to read/write to wher=
e
> the rest of the FS is squashfs read only). Basically, an rc script either
> creates it, or mounts it depending, and then I would use it mounted under
> /store. Here's what's happening.
>
> I can create the JFFS2 fielsystem, no errors. I can mount the new
> filesystem, no errors. I can initially write to the filesystem, but then
> the writes fail (usually after the first write) with the following error
>
> Write of 68 bytes at 0x000e0214 failed. returned 0, retlen 0
>
> This happens after initial creation and will happen immediately after
> reboot and remount of the existing partition. OK, so I need to unlock the
> flash maybe? I try the unlock command, and get the following.
>
> # unlock /dev/mtdblock/8
> Could not get MTD device info from /dev/mtdblock/8

Try unlock /dev/mtd/8.  You need to use the character device with
unlock, not the block device.

> This is a stock 2.4.17 kernel, no patches to MTD (yet?) and gcc version
> 2.95.3. It's Intel Strata flash, the P30 family. Many thanks in advance t=
o
> anyone who can help.

That combination probably won't work anyway.  You have a fairly new
flash that has a CFI version of 1.4.  You also have a kernel version
that is very very very old and does not support that version of CFI.=20
If you want real MTD support for those chips, you'll need to update
your kernel.

josh
