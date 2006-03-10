Received: from ms01.sssup.it ([193.205.80.99] helo=sssup.it)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHhm4-0004gJ-F3
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 08:35:29 -0500
Message-ID: <44118092.3040208@gandalf.sssup.it>
Date: Fri, 10 Mar 2006 14:35:14 +0100
From: Michael Trimarchi <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
References: <38F58D7B92CB20438DF49D28B572CC6F13C4A0@budgw09a.ww300.siemens.net>
In-Reply-To: <38F58D7B92CB20438DF49D28B572CC6F13C4A0@budgw09a.ww300.siemens.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND + partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Selmeci, Tamas wrote:

>Hi!
>
>Is it possible to create partitions on a NAND flash card? And if that card is a SmartMedia Card?
>
>I'd need to following layout:
>partition0: boot loader                       128 KB
>partition1: linux kernel boot params           64 KB
>partition2: linux kernel
>partition3: root filesystem (now it's cramfs but I'd like to change to JFFS2)   50 MB
>
>Bye
>--
>Tamas Selmeci
>Siemens PSE HU
>Tel.   : +36-1-471-3861
>Email  : tamas.selmeci@siemens.com
>Address: H-1143 Budapest, Gizella ut 51-59
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>  
>
Yes it possible,
You can use cmdpartion if it is present in the kernel, or static partion.
regards
michael
