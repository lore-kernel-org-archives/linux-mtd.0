Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VUa5-0007CD-9p
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 12:06:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Stephen Brown <sbrown@stirling-dynamics.com>
In-Reply-To: <000f01c33bd2$2a579660$11c8a8c0@stevejunior>
References: <000f01c33bd2$2a579660$11c8a8c0@stevejunior>
Message-Id: <1056625602.27553.73.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 26 Jun 2003 12:06:43 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: quick question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-06-26 at 12:00, Stephen Brown wrote:
> Hi all,
> 
> what do you all think about this:
> 
> http://www.m-sys.com/content/products/product.asp?PID=17&FILE=DOCIdePro&FAM=
> doc
> 
> if I used this as a standard IDE device does this mean that I wouldn't
> require any MTD drivers for linux and just use the standard IDE?
> 
> if so could I format this as EXT2 fs and contain my ROOT file system on it?
> or would I still run the risk of power failure disk error etc?

You'd want EXT3 not EXT2, presumably, but yes -- it should just work. 

You still have the same fundamental problem that you're running a
journalling file system atop a journalling pseudo-filesystem which
emulates a block device, but unlike the reports I've heard about most
CompactFlash devices, I'd expect that M-Systems have at least managed to
make the firmware within the device itself reliable w.r.t.
power-failure.

>  I mean I can load my ROOT fs into memory so thats not a problem, see the
> thing is at the moment I can't get the MTD drivers to work with the onboard
> 'Msys D-O-C' on an Ampro p5e module, reason being is Ampro use part of the
> FLASH to store the bios for the ampro board and have specific tools for
> formatting etc,

That's interesting... can you describe the problems? Precisely what type
of DiskOnChip is it, is it detected correctly by the hardware driver? Is
it only the NFTL code which is unhappy? etc. 

-- 
dwmw2
