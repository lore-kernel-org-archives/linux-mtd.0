From: dwmw2@infradead.org (David Woodhouse)
Date: 07 Feb 2003 12:27:29 +0000
Subject: JFFS2 & 2.5.59 & FS_REQUIRES_DEV
In-Reply-To: <1044620396.30969.15.camel@henrik.marasystems.com>
References: <Pine.BSF.4.51.0302061603270.3212@kazi.fit.vutbr.cz>
 <1044544711.2535.13.camel@passion.cambridge.redhat.com>
 <Pine.BSF.4.51.0302070847270.66348@kazi.fit.vutbr.cz>
 <1044604814.5502.616.camel@imladris.demon.co.uk>
 <Pine.BSF.4.51.0302071016360.70445@kazi.fit.vutbr.cz>
 <1044610143.5502.691.camel@imladris.demon.co.uk>
 <1044620396.30969.15.camel@henrik.marasystems.com>
Message-ID: <1044620849.21169.4.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-02-07 at 12:19, Henrik Nordstrom wrote:
> While the root= argument is not passed to root filesystems, rootfsflags=
> are. So I think you should be able to use something like
> 
> devfs=mount root=/dev/root rootfsflags=[mtddevspec]... rootfs=jffs2
> 
> then have the filesystem fix up /dev/root.
> 
> This is used successfully in UML to mount a non-block root filesystem
> (hostfs).

Shan't :)

The flags are not for passing the device to be mounted. But thanks for
pointing out another case where this is needed. I won't be implementing
a hack like that -- just like I won't be implementing hole-punching in
JFFS2 until we have a _sane_ way of doing it -- I refuse to use an
ioctl() like XFS does :)


-- 
dwmw2
