Received: from bay104-f36.bay104.hotmail.com ([65.54.175.46] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dkkk8-00037D-8H
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2005 11:32:53 -0400
Message-ID: <BAY104-F36C99B1FBD33D805371E6784E80@phx.gbl>
In-Reply-To: <BAY104-F742A4B60C7CA2E0EDFE8B84E80@phx.gbl>
From: "David L" <idht4n@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 21 Jun 2005 08:11:30 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Subject: boot to MTD-partitioned NAND from DOS w/loadlin?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry about the no subject in my last post.  :(

>Hi,
>
>I'm using a Nand flash driver on a Compulab board with a proprietary driver 
>provided by Compulab.  I'd like to switch to a non-proprietary driver like 
>MTD for a few reasons.  But having read through the MTD documentation, I'm 
>not sure we can maintain our current boot strategy if we migrate to MTD.  
>Right now, we boot to DOS that comes with the board and then use loadlin to 
>boot a kernel/initial ramdisk that reside on a partition of the Nand flash 
>that has a DOS filesystem on it.  On the rare event that we need to change 
>the kernel or initial ramdisk, we mount the DOS filesystem from Linux and 
>change the file.
>
>Is there a way to maintain this strategy if we use MTD?  I saw in the NAND 
>API document that only jffs2 and YAFFS filesystems can be used with MTD.  
>Is there any way around this? (I don't care how efficient it is).  And even 
>if there is a workaround that would allow us to modify files in a DOS 
>filesystem from Linux, will MTD partitions be visible from DOS so that we 
>can boot in the first place?
>
>Thanks...
>
>                    David
>
>_________________________________________________________________
>Express yourself instantly with MSN Messenger! Download today - it's FREE! 
>http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
