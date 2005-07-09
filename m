Received: from [61.16.170.184] (helo=emuzed.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DrFSB-00068P-J5
	for linux-mtd@lists.infradead.org; Sat, 09 Jul 2005 09:33:15 -0400
Message-ID: <42CFC8DB.9040803@emuzed.com>
Date: Sat, 09 Jul 2005 18:23:47 +0530
From: Trilok Soni <trilok.soni@emuzed.com>
MIME-Version: 1.0
To: Greg Lindberg <gl4jalopi@earthlink.net>
References: <MPEAJFOFNNOAIMOHBACICEIOEBAA.gl4jalopi@earthlink.net>
In-Reply-To: <MPEAJFOFNNOAIMOHBACICEIOEBAA.gl4jalopi@earthlink.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Configure in Linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greg Lindberg wrote:

>I'm trying to move an embedded system based on an Intel PXA255 from the 2.4
>kernel to the 2.6 kernel.  I've gotten to the point that the MTD system is
>recognizing the partition and adding it to the system.  When I try to mount
>it using the Linux command line option 'root=/dev/mtd0' I get an error.
>  
>
Try root=/dev/mtdblock0 and rootfstype=jffs2 if you are mounting the 
same type.

---Trilok Soni
