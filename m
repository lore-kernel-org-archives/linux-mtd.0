Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLEtG-0001zB-JI
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 15:05:07 +0000
Subject: Re: mkfs.ubifs problem when output file really isn't in the UBIFS
 root directory
From: Marcus Prebble <marcus.prebble@axis.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1349367416.20373.75.camel@sauron.fi.intel.com>
References: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
 <1349367416.20373.75.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 8 Oct 2012 17:04:56 +0200
Message-ID: <1349708696.2552.1821.camel@lnxprebble2.se.axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Ricard =?ISO-8859-1?Q?Wanderl=F6f?= <ricardw@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Thanks for your reply - please see below.


On Thu, 2012-10-04 at 18:16 +0200, Artem Bityutskiy wrote:
> On Fri, 2012-09-21 at 17:41 +0200, Marcus Prebble wrote:
> > Hi,
> > 
> > We are working on a project using UBI/UBIFS and I have run into a
> > problem with mkfs.ubifs which I am hoping someone can advise on.
> > Apologies if I have already missed the answer to this in the archives
> > somewhere.
> > 
> > A requirement of the project is to take an image of the root filesystem
> > (/) which is implemented as a static UBI read only volume. Obviously its
> > not possible to unmount /, but it seems to be possible to re-mount the
> > UBI volume, read only, onto another location e.g. /tmp/mnt/new_rootfs.
> > 
> > The problem arises when running mkfs.ubifs is that it fails saying that
> > the output file cannot be in the UBIFS root directory.
> > This sounds like a reasonable constraint if the output file really was
> > in the root, but this is not the case for us seeing root is mounted
> > somewhere belowtmp. To give a concrete example of the command we are
> > running:
> > 
> > mkfs.ubifs --output=/tmp/rootfs.img  --leb-size=129024
> > --root=/tmp/rootfs_mnt --min-io-size=2048 --max-leb-cnt=147 
> > 
> > Where /dev/ubi0_11 is mounted read-only on both / and /tmp/rootfs_mnt/.
> > 
> > Having a look at the source for mkfs.ubifs it seems that the function
> > in_path(..) is the problem - it works up the directory tree using ../
> > until it either reaches the top_dir (/) or the inode number/dev match in
> > which case it fails. It doesn't seem that this section of code has
> > changed in the latest version of mtd-utils (we are running 1.4.3-2) and
> > I wonder if this is a bug in in_path(..) or a genuine safeguard against
> > screwing something up? I suspect the former for when I disabled this
> > check in mkfs.ubifs.c the resulting image was completely OK.
> 
> Well, obviously this is a safeguard check. If your source FS is
> in /a/path/, and the output image file is /a/path/image, then we will
> loop forever reading /a/path/image and writing the output
> to /a/path/image.

I am well aware of the need for a safe-guard check, but I think you
mis-understood my question.

We have remounted a static UBI volume which happens to be the rootfs (/)
onto another location, /tmp/newrootfs
We are trying to make an image of /tmp/newrootfs with mkfs.ubifs and
where the output file is /tmp/newrootfs.img.

In other words, we have /foo/bar/ and /foo/out.img. 
out.img is not in the same directory as bar, so it should be legal to
make an image of /foo/bar/

The problem is that in_path() compares inode numbers, and seeing the
inode numbers are apparently the same for / and /tmp/newrootfs
mkfs.ubifs (wrongly) says the output is in the root directory.

My original question was is there any technical reason why in_path()
compares inode numbers? I.e. is there a risk if you make an image of a
re-mounted RO filesystem of the resulting image being corrupt (or
something)

We have a workaround at moment --disable-root-check but its clearly not
an optimal solution. Another user is also having problems with in_path()
so this function needs looking at. Once we know that this is not the
intended behaviour of in_path() then we are happy to look for a
solution.

Kind regards,

/Marcus Prebble
