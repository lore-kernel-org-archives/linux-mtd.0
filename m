From: tglx@linutronix.de (Thomas Gleixner)
Date: Sat, 15 Feb 2003 12:30:36 +0100
Subject: A couple of bugs in nand_write_ecc()
In-Reply-To: <006801c2d48e$626313a0$1a00a8c0@itc.intrinsyc.com>
References: <001301c2d450$aa1a07a0$1a00a8c0@itc.intrinsyc.com>
 <200302150001.23072.tglx@linutronix.de>
 <006801c2d48e$626313a0$1a00a8c0@itc.intrinsyc.com>
Message-ID: <200302151230.36499.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Saturday 15 February 2003 02:05, Alex Samoutin wrote:
> From: "Thomas Gleixner" <tglx@linutronix.de>
> Ok, But what I have to do with this,
>  JFFS2 still trying to write not sector alligned data:
Fixed in CVS. cvs up. 
Thanks for pointing it out.
-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
