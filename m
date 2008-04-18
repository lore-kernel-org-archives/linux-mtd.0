Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JmtwX-0008HD-CJ
	for linux-mtd@lists.infradead.org; Fri, 18 Apr 2008 17:00:09 +0000
Date: Fri, 18 Apr 2008 17:59:57 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [U-Boot-Users] ubi and u-boot
Message-ID: <20080418165957.GG31520@shareable.org>
References: <4808AE6F.4030505@largestprime.net>
	<1208536808.6654.6.camel@vader.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1208536808.6654.6.camel@vader.jdub.homelinux.org>
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

Josh Boyer wrote:
> On Fri, 2008-04-18 at 22:21 +0800, Bernard Blackham wrote:
> > [apologies for the cross post]
> > Is anyone working on ubi/ubifs support in u-boot?
> 
> I am not aware of anyone actively working on porting UBI to upstream
> U-Boot at this exact moment.

Is it even a good idea?  The UBI (version 1 :-) initial scan is not
fast for large flash, and if the bootloader does it too, that's twice
as much time to boot.

However, if there was a protocol for bootloader to pass the scan
results to the booted kernel, that would be very nice.

-- Jamie
