From: tglx@linutronix.de (Thomas Gleixner)
Date: Sat, 15 Feb 2003 00:09:24 +0100
Subject: ECC calculation bug in nand_write_page()
In-Reply-To: <001d01c2d452$ce30b2e0$1a00a8c0@itc.intrinsyc.com>
References: <001d01c2d452$ce30b2e0$1a00a8c0@itc.intrinsyc.com>
Message-ID: <200302150009.24299.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 18:59, Alex Samoutin wrote:
> I found that ECC calculation is worng when we do partial write to sector.
Same as last mail. Partial page programming is not supported anymore.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
