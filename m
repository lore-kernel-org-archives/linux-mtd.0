Received: from web41312.mail.yahoo.com ([66.218.93.61])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AhBVX-00064O-6H
	for linux-mtd@lists.infradead.org; Thu, 15 Jan 2004 17:42:15 +0000
Message-ID: <20040115173939.38923.qmail@web41312.mail.yahoo.com>
Date: Thu, 15 Jan 2004 09:39:39 -0800 (PST)
From: pal pal <coolpalcoolpal@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Embedded Application design help needed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Guys,

   This is my first Embedded related project and needs
to be done on fast track so i need your help.
   I have some knowledge of linux,written few modules
but not much as far as programming in linux is
concerned.



Tech Back ground of the Proj.

       I have an SBC(PCI bus) and A.) Analog Input
card B.) Analog O/p card c.) Digital input Card d.)
Digital O/p Card.

  I want to know how to design my application , i mean
i don't know anything about embedded linux. In other
words can somebosy tell me what should be there in
modules/threads/process.

1.) My Analog Input card has onboard FIFO and it does
conversions from analog to digital at some rate which
is lets say very fast like 2000 samples/ second.(PCI
based Analog i/p card), I want to scan the card evry
10 msec and store the data , i should give higest
priority to this task.

2.) The samples mentioned above are taken from some
sensors which are mounted over a rail and they move at
To and Fro at a speed of 200mm/sec, i want to give
this task 2nd highest priority. These sensors are
moved TO and Fro using AC induction motor i also have
to control the motor (direction and speed).

3.) I need to store the captured samples in the memory
and do some computation.

4.) After the computation is done i need to run a PID
loop(some loop). This loop should be executed once
every 250ms.

5.) At the same time i also need to pass on this
averaged value to a PC running windows on in via
LAN.This task can be of lower priority.

6.)If required i need to run some diagonistic's from 
windows PC.


Lets assume that drivers for Analog I/p , Analog O/p ,
Digital i/p and Digital o/p cards are avialable.
        

Can somebody help me to get started with it. may be i
can refine the Design here on the list.


cheers 
pal

__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus
