From: hno@marasystems.com (Henrik Nordstrom)
Date: 07 Feb 2003 16:37:29 +0100
Subject: JFFS2 & 2.5.59 & FS_REQUIRES_DEV
In-Reply-To: <1044620849.21169.4.camel@passion.cambridge.redhat.com>
References: <Pine.BSF.4.51.0302061603270.3212@kazi.fit.vutbr.cz>
 <1044544711.2535.13.camel@passion.cambridge.redhat.com>
 <Pine.BSF.4.51.0302070847270.66348@kazi.fit.vutbr.cz>
 <1044604814.5502.616.camel@imladris.demon.co.uk>
 <Pine.BSF.4.51.0302071016360.70445@kazi.fit.vutbr.cz>
 <1044610143.5502.691.camel@imladris.demon.co.uk>
 <1044620396.30969.15.camel@henrik.marasystems.com>
 <1044620849.21169.4.camel@passion.cambridge.redhat.com>
Message-ID: <1044632248.6361.19.camel@henrik.marasystems.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

fre 2003-02-07 klockan 13.27 skrev David Woodhouse:
> On Fri, 2003-02-07 at 12:19, Henrik Nordstrom wrote:
> > While the root= argument is not passed to root filesystems, rootfsflags=
> > are. So I think you should be able to use something like
> > 
> > devfs=mount root=/dev/root rootfsflags=[mtddevspec]... rootfs=jffs2
> > 
> > then have the filesystem fix up /dev/root.
> > 
> > This is used successfully in UML to mount a non-block root filesystem
> > (hostfs).
> 
> Shan't :)
> 
> The flags are not for passing the device to be mounted. But thanks for
> pointing out another case where this is needed.

NFS is yet another one perhaps more familiar to most people if you want
to take the torch on rewriting boot= processing and rootfs mounting..
NFS is handled quite a bit special in the kernel root mount..

-- 
Henrik Nordstrom <hno@marasystems.com>
MARA Systems AB
