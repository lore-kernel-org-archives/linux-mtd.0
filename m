Received: from web21506.mail.yahoo.com ([66.163.169.17])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Ikzm-0003Zy-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 07:55:42 +0100
Message-ID: <20020614065541.18847.qmail@web21506.mail.yahoo.com>
Date: Thu, 13 Jun 2002 23:55:41 -0700 (PDT)
From: Studying MTD <studying_mtd@yahoo.com>
Subject: Re: Howto create a new jffs2
To: Krypton <krypton8@inwind.it>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <001f01c2136b$ed3fb940$0100a8c0@ester>
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

--- Krypton <krypton8@inwind.it> wrote:
> >> Creating 5 MTD partitions on "SA1100 flash":
> >> 0x00000000-0x00020000 : "firmware"
> >> 0x00020000-0x00040000 : "params"
> >> 0x00040000-0x00140000 : "kernel"
> >> 0x00140000-0x00fe0000 : "rootdisk"
> >> 0x00fe0000-0x01000000 : "test"
> 
> > Try, mount -t jffs2 /dev/mtdblock4 <dir>
> 
> I already have tried this but unsuccesfully.
> Error : "No such file or directory"
> 
> Other suggestions ?

what is the output of "ls -l /dev/mtd*" ?



__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
