Received: from mail.shareable.org ([81.29.64.88])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FBi1z-0008V6-8A
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 19:39:04 -0500
Date: Wed, 22 Feb 2006 00:38:44 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Charles Manning <manningc2@actrix.gen.nz>
Message-ID: <20060222003844.GA31305@mail.shareable.org>
References: <43EB96DC.3030900@eptar.com>
	<200602211140.30069.manningc2@actrix.gen.nz>
	<1140477524.2480.827.camel@localhost.localdomain>
	<200602211408.05208.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200602211408.05208.manningc2@actrix.gen.nz>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
	yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> YAFFS for devices with no OOB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning wrote:
> OK, I'll start investigating an OOB-less YAFFS and give that a priority 
> depending on the amount of interest. Hint to everyone: If this sounds 
> interesting, respond (on or off list), especially if you'd like to be 
> involved in some way.

Would that make it more usable as a filesystem for Compact Flash cards?

I've heard of people using JFFS2 on Compact Flash (using blkmtd),
because it's power-fail-safe and is much better for wear than, say,
ext3.

-- Jamie
