Received: from wproxy.gmail.com ([64.233.184.194])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0skn-0006IJ-IK
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 21:47:58 -0500
Received: by wproxy.gmail.com with SMTP id 68so1914314wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Feb 2005 18:47:56 -0800 (PST)
Message-ID: <43507b7c0502141847134e1e68@mail.gmail.com>
Date: Mon, 14 Feb 2005 20:47:56 -0600
From: Sean Kelley <sean.sweng@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Linux MTD and NFTL - Question
Reply-To: Sean Kelley <sean.sweng@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been looking into an NFTL implementation for a device that uses a
NAND part and needs to be mounted on a Window's PC Desktop.  Thus I
need a Block Device interface so as to present a surface on which a
FAT filesystem can be placed.  However, in the course of my research
it came to my attention that a company called M-Systems has a hefty
amount of IP with regards to FTL and NFTL for pseudo-block devices. 
How does the Linux MTD-NFTL skirt the patents that M-Systems has in
place?  If I want to sell my product commercially what sort of risk? 
It is not terribly clear.  I've looked at YAFFS and JFFS2, but those
won't work if I wish to support USB mass storage for the Windows
desktop.

Any comments on NFTL and M-Systems patents much appreciated.

Thanks,

Sean
