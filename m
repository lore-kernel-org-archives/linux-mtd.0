Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D63Ex-0002YM-PX
	for linux-mtd@lists.infradead.org; Tue, 01 Mar 2005 04:00:29 -0500
From: Andrew Victor <andrew@sanpeople.com>
To: Narinder Kumar <narinder@kritikalsolutions.com>
In-Reply-To: <4222D35B.7070909@kritikalsolutions.com>
References: <4222D35B.7070909@kritikalsolutions.com>
Content-Type: text/plain
Message-Id: <1109667284.4420.18.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 01 Mar 2005 10:54:44 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: SPI DataFlash interfacing using 2.4.26
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Narinder,

>          Did anyone on the group sucessfully interfaced a JFFS2 
> partition on SPI DataFlash on Atmel's AT91RM9200 DK using  kernel 2.4.26 
> ? I have been able to mount the partition but read/write was giving CRC 
> errors.

I'm running JFFS2-on-DataFlash successfully on 2.4.27-vrs1.

1) You will need to download the latest CVS version of the MTD/JFFS2
code from cvs.infradead.org (see http://www.linux-mtd.infradead.org/ for
instructions).

2) Read the INSTALL file and then run the ./patchin.sh script

3) There are some incompatibilities with 2.4 kernels, but they're not
difficult to fix.  This might help:
http://lists.infradead.org/pipermail/linux-mtd/2004-December/011039.html

4) Configure your kernel and enable "JFFS2 write-buffering support"
under Filesystems->JFFS2.


Regards,
  Andrew Victor
