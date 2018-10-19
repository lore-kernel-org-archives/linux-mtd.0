Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDWCm-0004sF-2H
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 14:56:50 +0000
Received: by mail-yb1-xb43.google.com with SMTP id o8-v6so13353149ybk.13
 for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2018 07:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
In-Reply-To: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 19 Oct 2018 17:56:24 +0300
Message-ID: <CAOQ4uxjeVqfCgs0+2YNbugwD85VafadupDLG5xBf3=k4j=69Ng@mail.gmail.com>
Subject: Re: Regression in handling power cuts since 3a1e819b4e80 ("ovl: store
 file handle of lower inode on copy up")
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
 overlayfs <linux-unionfs@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, russell@personaltelco.net,
 openwrt-devel@lists.openwrt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 19, 2018 at 3:31 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> Hi,
>
> Since OpenWrt switch from kernel 4.9 to 4.14 users started randomly
> reporting file system corruptions. OpenWrt uses overlay(fs) with
> squashfs as lowerdir and ubifs as upperdir. Russell managed to isolate
> & describe test case for reproducing corruption when doing a power cut
> after first boot.
>
> Interestingly it cannot be reproduced on all devices (NAND dependant?
> arch dependant?!). I couldn't reproduce that problem on none of my
> Broadcom devices (ARM=3Dy ARCH_BCM_5301X=3Dy) so I had to buy Ubiquiti
> EdgeRouter X (ER-X) (MIPS=3Dy RALINK=3Dy). I reproduced it then and
> bisected down to the commit 3a1e819b4e80 ("ovl: store file handle of
> lower inode on copy up").
>
> FWIW I was told it also affects:
> Asus RT-AC58U (ARCH_IPQ40XX=3Dy)
> powerpc
> RB493G, DIR-860L (ATH79=3Dy)
>
> Steps to reproduce the problem:
> 1) Flash firmware
> 2) Boot (for the first time)
> 3) Let the init script copy config files from lowerdir to the upperdir
> 4) Wait for boot to finish
> 5) Verify content of some unmodified config on overlay, using either:
> hexdump -C /etc/config/dropbear
> hexdump -C /overlay/upper/etc/config/dropbear
> 6) Power cut & boot again
> 7) Check the content of the same file
>
> After above regressing commit the later check confirms the file size
> looks correct but it's filled with all 00-es only.
>
> Can I ask you to check if there is something possibly wrong with the
> above ovl commit? Or does it expose some problem with the ubifs? Or
> maybe the whole UBI?
>
> FWIW testing above commit (and one before it) always results in single
> error in the kernel log:
> [   14.250184] UBIFS error (ubi0:1 pid 637): ubifs_add_orphan: orphaned t=
wice
>

This looks very suspicious and should be taken up with ubifs developers.
There shouldn't be any way for an external module (overlayfs) to generate
internal errors like this in ubifs.

Let me describes what the "offending" commit changes to help you narrow
down the reproducer.

Before the change when config file is copied up overlayfs does:
- open O_TMPFILE in upper ubifs
- copy lower file data to tmpfile
- copy lower file metadata to tmpfile
- link tmpfile to upper ubifs path

After the change, the *only* extra operation is:
vfs_setxattr(tmpfile, "trusted.overlay.origin", NULL, 0, 0);
after opening tmpfile

Add to that the fact that O_TMPFILE support in ubifs is rather new
and you get high likelihood that the problem is stemmed somewhere
around setting extended attributes on O_TMPFILE in ubifs.

You can try to write a small reproducer that does the 5 steps above
without overlayfs directly on ubifs and see if youo get similar results
after power cut.

BTW, creating an O_TMPFILE "orphands" the created inode (once)
something in this procedure, allegedly setxattr() for some reason
causes the inode to be orphaned twice if we believe the error from
ubifs.

BTW, off topic, I posted some overlayfs patches that enable more features
for lower squashfs:
https://www.spinics.net/lists/linux-unionfs/msg05570.html

The most prominent feature is NFS export, but there is also persistent
st_dev;st_ino values that don't change after copy up + reboot and not
breaking hardlinks on copy up.

Can anyone from OpenWrt say if this is at all interesting for your users?

Thanks,
Amir.



> That UBIFS error doesn't occur with 4.12.14. Unfortunately it's
> impossible to cleanly revert 3a1e819b4e80 from the top of 4.12.14.
>
> --
> Rafa=C5=82
