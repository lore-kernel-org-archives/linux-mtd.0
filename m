Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dvAV-0006v0-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 16:34:31 +0000
Subject: Re: NFTL not recognizing disk on chip in some cases
From: Henrik Nordstrom <hno@marasystems.com>
To: Raphael Hertzog <eng@eipm.ch>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <1043858542.554.144.camel@localhost>
References: <1043844420.555.111.camel@localhost>
	 <1043851709.11449.118.camel@henrik.marasystems.com>
	 <1043858542.554.144.camel@localhost>
Content-Type: text/plain
Message-Id: <1043859930.13381.16.camel@henrik.marasystems.com>
Mime-Version: 1.0
Date: 29 Jan 2003 18:05:31 +0100
Content-Transfer-Encoding: 7bit
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

ons 2003-01-29 klockan 17.42 skrev Raphael Hertzog:

> Unless the bad things are irreversible this should not be the case.
> AFAIR I always took care to remove the module before formating.
> 
> And it doesn't explain why I have the problem when I copy a set of files
> and why I doesn't have it with another set of files. Even stranger when
> I first copy the good set of files, then umount, remount, remove the
> good set of files and copy the problematic set of files then it's ok.
> 
> But if I copy the problematic set of files directly during the first
> mount after the partitioning/formating then I have the problem exposed
> in my previous mail.

Well.. who knows what happens if the NFTL table gets corrupted somehow
due to conflict between the NFTL driver and nftl_format. I would not at
all be supriced if in such case it behaves quite different depending on
which fileset you copy first/how as this has impact on in which order
the blocks is beeing used by the filesystem.

But if you are sure the NFTL driver was removed from the system when you
ran nftl_format then it must be something else..

As of yet I have only formatted our DOC chips using the DFORMAT tool.
Feels like a safer approach. And with the current GRUB patch you should
be able to install GRUB direcly using DFORMAT 5.X as a binary partition
image.

Note: For various reaosns (mainly lack of time and lab equipment to try
out a new scheme) we are still using the msys drivers and a normal grub
loading from the doc via the msys BIOS. Hope to switch to native
Linux/GRUB drivers shortly.

-- 
Henrik Nordstrom <hno@marasystems.com>
MARA Systems AB
