Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E0jMo-0006OC-9u
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2005 18:18:54 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: "Nathan H." <n_8_10@hotmail.com>
In-Reply-To: <BAY106-F34B49101C8BF412805B6C098C40@phx.gbl>
References: <BAY106-F34B49101C8BF412805B6C098C40@phx.gbl>
Content-Type: text/plain
Date: Thu, 04 Aug 2005 19:21:37 +0200
Message-Id: <1123176097.26146.206.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mask error in nandbase.c: nand_scan(): oob_size
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please do not toppost !

On Thu, 2005-08-04 at 10:43 -0600, Nathan H. wrote:
> Ah ha!  Now it all becomes clear.  You are looking at the wrong bit field.  
> I tried to make it clear in the first email, but accidentally used a 
> variable width font- so that the "^error" may have been pointing in the 
> wrong place.  Maybe that was not helpful as I had intended.

Yeah, I got confused a bit. 

You are correct. The oob size bit is a single bit. Fixed in CVS. Thanks.

tglx
