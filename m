Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DaxIK-0000rh-RD
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 10:55:41 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Jonas <jdietsche@fsforth.de>
In-Reply-To: <42948BE6.1010400@fsforth.de>
References: <42948BE6.1010400@fsforth.de>
Content-Type: text/plain
Date: Wed, 25 May 2005 16:55:23 +0200
Message-Id: <1117032923.6736.316.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand write problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-05-25 at 16:29 +0200, Jonas wrote:
> I try to write some files within linux to my flash. But I always get the 
> message
> nand_write_ecc: Attempt to write not page aligned data
> cp: Write Error: Invalid argument

You can not use cp to write to a raw nand flash. NAND must be written
with page aligned data. 

Please read the FAQ and the tech docs on http://linux-mtd.infradead.org

tglx
