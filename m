From: tglx@linutronix.de (Thomas Gleixner)
Date: Sun, 09 Mar 2003 20:10:44 +0100
Subject: Memory leak
In-Reply-To: <000e01c2e65b$71ca7020$210486da@ybb>
References: <000e01c2e65b$71ca7020$210486da@ybb>
Message-ID: <200303092010.44211.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sunday 09 March 2003 17:46, matsunaga wrote:
> Hi all
>
> I am testing on NAND flash.
> There seems memory leak when you mount and unmount a device with some data.
> Dnode resource acquired during mount seems not to be freed during unmount.
This is not a Problem of NAND Flash. It's a filesystem related problem. 
Do you use JFFS2 ?
If yes, which Dnode resource do you mean ? Where is it allocated ? Can you 
please give more precise information ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
