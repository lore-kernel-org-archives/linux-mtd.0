Received: from bay19-f13.bay19.hotmail.com ([64.4.53.63] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BemuX-0006jj-JZ
	for linux-mtd@lists.infradead.org; Sun, 27 Jun 2004 23:34:28 -0400
From: "w h" <wh3cq@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 28 Jun 2004 03:34:17 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY19-F13LZ9fhzgAfi0004393d@hotmail.com>
Subject: used percent in "df" command
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I use Moto Dragonball MX1 (arm920T)to startup my cramfs root fs. All work 
ok, but there is an information I wonder why. Is there anyone who can 
explain?

Actually the cramfs rootfs downloaded takes up only 4016K which is smaller 
than the whole space(mtdblock2) 12448 allocated to root filesystem°£But why 
dose "Use% = 100%" exist?

The information after "df" command is as following:

Filesystem           1k-blocks      Used Available Use% Mounted on

/dev/mtdblock/2          12448     12448         0 100% /
.....
 
I want "df" to show actually used percent.What can I do? Is there any place 
I can do some modificaton?

_________________________________________________________________
√‚∑—œ¬‘ÿ MSN Explorer:   http://explorer.msn.com/lccn  
