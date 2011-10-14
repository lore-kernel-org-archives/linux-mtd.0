Received: from lunge.queued.net ([173.255.254.236])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1REiX6-0005jM-Ss
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 14:14:45 +0000
Date: Fri, 14 Oct 2011 07:14:16 -0700
From: Andres Salomon <dilinger@queued.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH] jffs2: allow disabling of compression schemes at runtime
Message-ID: <20111014071416.5278051d@debxo>
In-Reply-To: <1318582244.12351.73.camel@sauron>
References: <20111003191624.7efd3dce@queued.net>
	<1318582244.12351.73.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 14 Oct 2011 11:50:37 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Mon, 2011-10-03 at 19:16 -0700, Andres Salomon wrote:
> > Currently jffs2 has compile-time constants (and .config options)
> > regarding whether or not the various compression/decompression
> > drivers are built in and enabled.  This is fine for embedded
> > systems, but it clashes with distribution kernels.  Distro kernels
> > tend to turn on everything; this causes OpenFirmware to fall
> > over, as it only supports ZLIB decompression.  Booting a kernel
> > that has LZO compression enabled, writing to the boot partition,
> > and then rebooting causes OFW to fail to read the kernel from
> > the filesystem.  This is because LZO compression has priority
> > when writing new data to jffs2, if LZO is enabled.
> > 
> > To get around that, this patch adds jffs2 module params for each
> > compressor type that isn't decompression-only.  That means I can run
> > a kernel that has support for LZO and ZLIB decompression (allowing
> > me to read LZO data off of the root partition), while  disabling
> > LZO compression writes (jffs2.disable_lzo=1) so that the boot
> > partition stays compatible with OFW.
> > 
> > Signed-off-by: Andres Salomon <dilinger@queued.net>
> 
> You should use mount options instead. Invent nice mount options to
> configure compression strategy of JFFS2.

I thought about it, but currently jffs2 doesn't support parsing
mount options.  It seemed like a lot of extra code for such an obscure
feature, on a filesystem that's merely in maintenance mode (I don't know
if anyone else has run into the same issue that I have).  However, I can
do that if desired.

> 
> Or you can simply implement the same option as UBIFS has: compr=xxx.
> 

Yep.

> See Documentation/filesystems/ubifs.txt
> 
> With this option you set the default compressor which is use when
> writing, and on reading all decompression are supported, seems like
> exactly what you want. You can also look how it is implemented in
> UBIFS for reference.
> 
