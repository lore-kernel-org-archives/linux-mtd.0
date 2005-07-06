Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DqFh7-0004N0-1x
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2005 15:36:30 -0400
Message-ID: <42CC32B0.4020101@ieee.org>
Date: Wed, 06 Jul 2005 15:36:16 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Andrew Schultz <alschult@eecs.berkeley.edu>
References: <42CC2CCA.2050409@eecs.berkeley.edu>
In-Reply-To: <42CC2CCA.2050409@eecs.berkeley.edu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem booting DOCboot and Linux 2.6
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Schultz wrote:
> I am currently having a problem getting DOCboot to work with a 256MB 
> DoC2000 TSOP and a Linux 2.6.11 kernel image.

> Just for completeness, here are the steps I performed to get to this point:
> 
> 1) Setup the chip with dformat:
>    dformat /winl:0000 /winh:d8000 /bdkl0:2M (the /winl, /winh stuff is 
> needed to work for some reason)
> 
> 2) Reboot into linux off hard drive and put doc_spl image on chip:
>    ./flash_eraseall /dev/mtd1
>    ./nandwrite -o /dev/mtd1 doc_spl
> 
> 3) Fdisk/format the /dev/inftla device to create the filesystem
> 
> 4) Reboot and get the "CANNOT FIND IMAGE ON DEVICE" message

I be interested in seeing the results of "cat /proc/mtd" on your system. 
  Also, it would be interesting to see what happens if you omit step 3). 
  Obviously, if you do that your kernel will be unable to load your root 
filesystem.  But at the moment you aren't even getting the kernel loaded.

You might also want to examine the output from "./nanddump -p 
/dev/mtd1", to see if the 0xdbb1 tag shows up.  Omit the -p flag if you 
prefer binary (rather than pretty-printed ascii) output.

BTW I do everything with the 2.6 kernel; that certainly is not the 
problem.  In fact the MTD developers don't generally test against the 
2.4 kernel :)

	-Dan
