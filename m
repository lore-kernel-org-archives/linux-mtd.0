From: tglx@linutronix.de (Thomas Gleixner)
Date: Wed, 26 Feb 2003 09:48:47 +0100
Subject: Is Samsung K9F5608U0B-YCB0 NAND Flash Supported
In-Reply-To: <20030226054016.23676.qmail@web80411.mail.yahoo.com>
References: <20030226054016.23676.qmail@web80411.mail.yahoo.com>
Message-ID: <200302260948.47080.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wednesday 26 February 2003 06:40, Kevin Kaichuan He wrote:
> This is a 16Mbtes, 8bits NAND Flash from Samsung.
> I'm wondering if it's supported already. IOr is
> there a similiar hardware specific NAND driver
> I can copy and modify ?
All types of 8bit wide NAND Flash should be supported.

Please read http://linux-mtd.infradead.org/tech/nand.html

Copy one of the existing Hardwaredrivers (autcpu12.c or edb7312.c) and modify 
it, so it matches your hardware.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
