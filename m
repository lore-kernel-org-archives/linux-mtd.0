Received: from web21505.mail.yahoo.com ([66.163.169.16])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 1798oe-00009T-00
	for <linux-mtd@lists.infradead.org>; Sat, 18 May 2002 19:20:28 +0100
Message-ID: <20020518182026.49817.qmail@web21505.mail.yahoo.com>
Date: Sat, 18 May 2002 11:20:26 -0700 (PDT)
From: Studying MTD <studying_mtd@yahoo.com>
Subject: Re: FAT for NAND Flash 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <23649.1021737644@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--- David Woodhouse <dwmw2@infradead.org> wrote:
> Neither the 'mtdblock' nor 
> 'mtdchar' code is involved at all. 

As per drivers/mtd/Config.help (2.5.15) :-

CONFIG_MTD_BLOCK
...
At the moment, it is also required for the Journalling
Flash File System(s) to obtain a handle on the MTD
device when it's mounted(although JFFS and JFFS2 don't
actually use any of the functionality of the mtdblock
device).
...
You do not need this option for use with the
DiskOnChip devices. For those, enable NFTL support
(CONFIG_NFTL) instead.


it means we have to set CONFIG_MTD_BLOCK, if we are
not using DoC but we are using JFFS2 filesystem.

i am confused, who is correct ?

Please guide me.

Thank for your help.



__________________________________________________
Do You Yahoo!?
LAUNCH - Your Yahoo! Music Experience
http://launch.yahoo.com
