From: tglx@linutronix.de (Thomas Gleixner)
Date: Wed, 12 Mar 2003 11:06:59 +0100
Subject: Problems building contents of snapshot 3-9-2003
In-Reply-To: <001b01c2e869$37224c80$bda6580c@who5>
References: <001b01c2e869$37224c80$bda6580c@who5>
Message-ID: <200303121106.59051.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wednesday 12 March 2003 08:30, Gregg C Levine wrote:
> Hello from Gregg C Levine
> Well, I am now closer to my working problem's solution. But now a new
> problem, or problems has surfaced. And here's a C&P of the problems:
> Script started on Tue Mar 11 23:06:53 2003
> root at drwho4:/usr/src/mtd# make
I'm not sure, if the out of kernel build is really up to date.

Could you try to use patchin.sh from patches directory and do make xImage, 
make modules from your kernel directory ? That works for sure.
Please use latest CVS code, as we have fixed some leakes yesterday.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
