Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IPWq-0002ZF-Fr
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 10:04:56 +0100
Date: Wed, 21 May 2003 11:05:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: John Burch <jburch@vincisystems.com>
Message-ID: <20030521090516.GB22310@wohnheim.fh-wedel.de>
References: <002701c31f11$e009ce70$1200a8c0@JOHNB>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002701c31f11$e009ce70$1200a8c0@JOHNB>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Mtd block access (jffs2 formatted) and mtd char access
 (unformatted) on different partitions of a single flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 May 2003 16:53:30 -0400, John Burch wrote:
> 
> Is there a preferred way to access different mtd partitions of a single
> flash device when certain accesses will be (1) block oriented via
> standard file I/O of a jffs2 file system mounted on a /dev/mtdblockN
> device and other accesses will be (2) character oriented via 'dd' (or
> some other mechanism?) of unformatted/raw flash using /dev/mtdN?  Are
> there any possibly bad interactions between mtd char and block device
> access to the same device?

Usually not. It would be a bug.

> I've adopted a system that uses a driver with its own flash support to
> read/write raw (non-jffs2) portions of the flash, while application code
> uses standard file I/O to read/write jffs2 partitions on the same
> device.  I'm concerned that these accesses may clash and possibly result
> in corrupted flash, crashed kernel, etc.  Is this a legitimate concern
> or does the mtd driver check flash status prior to any operations?

The physical flash device can only have one driver accessing it at any
time. The low level chip drivers have locking for this, so you should
be safe.

What does "driver" mean? If you have two in-kernel drivers for the
same flash chip, they will use different locks and things will break.
If that is a user-space driver, using the /dev/mtdX devices, you are
perfectly safe. Which one is it?

Jörn

-- 
Courage is not the absence of fear, but rather the judgement that
something else is more important than fear.
-- Ambrose Redmoon
