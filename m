Received: from mail2.bluewin.ch ([195.186.4.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eBEJ-0000XU-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 09:43:31 +0000
Subject: Re: NFTL not recognizing disk on chip in some cases
From: Raphael Hertzog <eng@eipm.ch>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <1043913922.556.4.camel@localhost>
References: <Pine.LNX.4.44.0301292238560.4791-100000@imladris.demon.co.uk>
	 <1043913922.556.4.camel@localhost>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1043921640.555.12.camel@localhost>
Mime-Version: 1.0
Date: 30 Jan 2003 11:14:00 +0100
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Am Don, 2003-01-30 um 09.05 schrieb Raphael Hertzog:
> > Because in the first case the 'ANAND' went somewhere other than the first 
> > page of an erase block, so wasn't seen as an 'extra' media header? Taking 
> > raw dumps of the flash would confirm this.
> 
> I'll do that to check it. 

It looks like you're right.

When the image is ok, the problematic ANAND is on the dump at offset
0x778800 (it's a multiple of 512 but not of 16k) ... when the image is
bad it is at offset 0x6cc000 (which is a multiple of 512 and 16k).

I'm currently compiling the modules with your patch to see if it's ok.

Cheers,
-- 
Raphaël Hertzog - EIPM SA
