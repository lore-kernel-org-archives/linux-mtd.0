From: tglx@linutronix.de (Thomas Gleixner)
Date: Thu, 27 Mar 2003 21:19:02 +0100
Subject: Unable to handle kernel paging request at virtualaddress80000013
In-Reply-To: <3E832D9D.8C65AC7@thales-e-transactions.com>
References: <3E8303F3.980B0F02@thales-e-transactions.com>
 <1048778440.30799.76.camel@henrik.marasystems.com>
 <3E832D9D.8C65AC7@thales-e-transactions.com>
Message-ID: <200303272119.02420.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thursday 27 March 2003 17:58, Eric DEJONC wrote:
> Thank you all for your help,
> I gave the vmlinux file but  compiled with the cross compiler I  think it
> was the right think to do, i gave too the system.map and the sykms. The
> output seems to denote that the problem comes from the jffs2, driver?

Could you please try the following:

1. Get current MTD source from MTD-CVS or pick a snapshot.
2. read INSTALL in the base directory of MTD soruce
3. use install.sh in mtd/patches to update your kernel
4. compile and try again
5. report results

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
