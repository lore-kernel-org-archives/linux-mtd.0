Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CF781-0005uJ-RN
	for linux-mtd@lists.infradead.org; Wed, 06 Oct 2004 04:26:33 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Brad Beveridge <bbeveridge@bluewatersys.com>
In-Reply-To: <41636AD5.4020403@bluewatersys.com>
References: <41636AD5.4020403@bluewatersys.com>
Content-Type: text/plain
Message-Id: <1097051308.3045.4.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Wed, 06 Oct 2004 10:28:28 +0200
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: BUG in nand_base.c
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-10-06 at 05:47, Brad Beveridge wrote:
> Hi all, I have been playing with large size nand devices & have found 
> what I think is a bug in nand_base.c::nand_command.  I have the latest 
> daily snapshot.
> Starting at line 546, there is the following code
>                         /* One more address cycle for higher density 
> devices */
>                         if (this->chipsize & 0x0c000000)
>                                 this->write_byte(mtd, (unsigned char) 
> ((page_addr >> 16) & 0x0f));
> Which will correctly trap the 4th write cycle for 64 & 128MiB parts, but 
> not for larger sizes of 256 & 512 MiB.
> In my code I have changed the line to read
>                         if (this->chipsize & 0xfc000000)
> 
> Also, I noticed that for the large page devices (nand_command_lp) a 
> proper compare (>) is used instead of a mask - should one of these be 
> changed to make both functions consistant?

You're right. I will fix this later when I have CVS access again.

Thanks
tglx
