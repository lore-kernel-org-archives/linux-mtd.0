From: tglx@linutronix.de (Thomas Gleixner)
Date: Sat, 15 Feb 2003 00:01:23 +0100
Subject: A couple of bugs in nand_write_ecc()
In-Reply-To: <001301c2d450$aa1a07a0$1a00a8c0@itc.intrinsyc.com>
References: <001301c2d450$aa1a07a0$1a00a8c0@itc.intrinsyc.com>
Message-ID: <200302150001.23072.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 18:43, Alex Samoutin wrote:
> Am I right?
Not really. 
But it's no more relevant. I removed the possiblibity to write not page 
aligned data to NAND. 

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
