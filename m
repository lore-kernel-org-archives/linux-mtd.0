From: tony.hague@bbsrc.ac.uk (tony hague SRI)
Date: Thu, 6 Feb 2003 12:57:45 -0000
Subject: Partitioning nftl troubles
Message-ID: <0DBA4DD6EF95D411BFB200508BDE9AA508E34B@wpark-exsrv1.sri.bbsrc.ac.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Firstly, sorry if this is a stupid question.

I have a 16M DOC2000, on which I am trying to create two partitions,
/dev/nftla1 and /dev/nftla2 respectively. With kernel 2.4.3, I 
can do it: with drivers docprobe, doc2000 and docecc loaded, 
I can fdisk /dev/nftla with no problem. It seems that the kernel
module loader loads the nftl modules when I do this.

With later kernels, including 2.4.20 patched with the cvs snapshot 
of 4 Feb 2003, after I write the new partition table, I get:

invalidate: busy buffer

several times (at least 17) before fdisk exits. Anyone know what is 
happening ?

Thanks for any help.

Tony Hague. 
