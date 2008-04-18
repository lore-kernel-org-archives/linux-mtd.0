Received: from an-out-0708.google.com ([209.85.132.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jmw7C-0004Co-Gf
	for linux-mtd@lists.infradead.org; Fri, 18 Apr 2008 19:19:19 +0000
Received: by an-out-0708.google.com with SMTP id c3so168240ana.99
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Apr 2008 12:19:17 -0700 (PDT)
Subject: Re: [U-Boot-Users] ubi and u-boot
From: Josh Boyer <jwboyer@gmail.com>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20080418165957.GG31520@shareable.org>
References: <4808AE6F.4030505@largestprime.net>
	<1208536808.6654.6.camel@vader.jdub.homelinux.org>
	<20080418165957.GG31520@shareable.org>
Content-Type: text/plain
Date: Fri, 18 Apr 2008 14:19:01 -0500
Message-Id: <1208546341.6654.8.camel@vader.jdub.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: u-boot-users@lists.sourceforge.net,
	Bernard Blackham <bernard@largestprime.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-04-18 at 17:59 +0100, Jamie Lokier wrote:
> Josh Boyer wrote:
> > On Fri, 2008-04-18 at 22:21 +0800, Bernard Blackham wrote:
> > > [apologies for the cross post]
> > > Is anyone working on ubi/ubifs support in u-boot?
> > 
> > I am not aware of anyone actively working on porting UBI to upstream
> > U-Boot at this exact moment.
> 
> Is it even a good idea?  The UBI (version 1 :-) initial scan is not
> fast for large flash, and if the bootloader does it too, that's twice
> as much time to boot.

It's a good idea, yes.  Particularly if you want to boot from NAND
flash.

Can you define "large device"?  It only scans the first 1 or 2 pages for
each eraseblock to build up the volume tables.  That really isn't that
slow...

> However, if there was a protocol for bootloader to pass the scan
> results to the booted kernel, that would be very nice.

Maybe.  I was never fully convinced of that.

josh
