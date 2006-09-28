Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GSjOp-0002sD-Qz
	for linux-mtd@lists.infradead.org; Thu, 28 Sep 2006 01:05:12 +0100
Subject: Re: Is NAND MTD preemption safe?
From: Thomas Gleixner <tglx@linutronix.de>
To: Ronny L Nilsson <rln-mtd@arbetsmyra.dyndns.org>
In-Reply-To: <20060906083858.B4DE55E7@arbetsmyra.dyndns.org>
References: <20060906083858.B4DE55E7@arbetsmyra.dyndns.org>
Content-Type: text/plain
Date: Thu, 28 Sep 2006 02:06:20 +0200
Message-Id: <1159401980.9326.604.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-09-06 at 10:37 +0200, Ronny L Nilsson wrote:
> Hi
> I have a question about MTD, NAND and race conditions. Basically I'm 
> wondering if the NAND support in MTD is preemption safe?

Care to read the code ?

All chip access functions have been serialized by nand_get_device() and
nand_release_device() forever.

	tglx
