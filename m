Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IENy-0000wF-KE
	for <linux-mtd@lists.infradead.org>; Tue, 20 May 2003 22:11:03 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "John Burch" <jburch@vincisystems.com>,
	<linux-mtd@lists.infradead.org>
Date: Wed, 21 May 2003 09:13:22 +1200
References: <002701c31f11$e009ce70$1200a8c0@JOHNB>
In-Reply-To: <002701c31f11$e009ce70$1200a8c0@JOHNB>
MIME-Version: 1.0
Message-Id: <20030520211120.2FB2115762@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Mtd block access (jffs2 formatted) and mtd char access
 (unformatted) on different partitions of a single flash device
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 21 May 2003 08:53, John Burch wrote:
> Is there a preferred way to access different mtd partitions of a single
> flash device when certain accesses will be (1) block oriented via
> standard file I/O of a jffs2 file system mounted on a /dev/mtdblockN
> device and other accesses will be (2) character oriented via 'dd' (or
> some other mechanism?) of unformatted/raw flash using /dev/mtdN?  Are
> there any possibly bad interactions between mtd char and block device
> access to the same device?

This should not be a problem.
>
> I've adopted a system that uses a driver with its own flash support to
> read/write raw (non-jffs2) portions of the flash, while application code
> uses standard file I/O to read/write jffs2 partitions on the same
> device.  I'm concerned that these accesses may clash and possibly result
> in corrupted flash, crashed kernel, etc.  Is this a legitimate concern
> or does the mtd driver check flash status prior to any operations?

It is mtd's job to handle this sort of thing.

-- CHarles
