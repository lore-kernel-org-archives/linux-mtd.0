Received: from sis.com.tw ([203.67.208.2] helo=maillog.sis.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CbK6-0004e1-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2001 07:18:43 +0100
Message-ID: <3B304060.D2A2452F@sis.com.tw>
Date: Wed, 20 Jun 2001 14:19:12 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: qwerty t <qwerty172@yahoo.com>
CC: mtd support group <linux-mtd@lists.infradead.org>
Subject: Re: Input/Output Errors
References: <20010615115134.12572.qmail@web3203.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii
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

qwerty t wrote:
> 
> I am getting some very strange results I would like to
> share.
> 
> I have a 16 M DoC 2000. I have formated it as an ext2
> partition, and have copied 10M in various directories.
> 
> During boot MTD support says that it found unformated
> sectors and formats them. This doesn't happen all the
> time. Sometimes after one of these unformated sections
> is formatted the result is I/O errors when I try to
> read a file or directory.
> 
> Has anyone seen this before? Has anyone used ext2 as
> filesystem.
> 


This seems to be a bug in the NFTL code. Somtimes the NFTL layer is
skewed up with the underlay DoC and does not work correctly on the 
NFTL metadata. Please send me the kernel message (the reformating
process) and nftldump output of the victim DoC.

Ollie
