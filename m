Received: from rwcrmhc53.attbi.com ([204.127.198.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18VVrk-0004OQ-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2003 11:56:24 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Sanal Kumar <p_sanalk@yahoo.com>
Subject: Re: Problem with DiskOnChipMillenium
Date: Mon, 6 Jan 2003 07:24:59 -0500
References: <20030106114629.39183.qmail@web10304.mail.yahoo.com>
In-Reply-To: <20030106114629.39183.qmail@web10304.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Message-Id: <E18VVrk-0004OQ-00@pentafluge.infradead.org>
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

Sanal Kumar wrote:
> Thanks for your reply.
> I have tried as you said . But it is giving exactly
> the same error as before any other ideas.

Sorry, I've never seen those type of error messages before.

It may be worth a try to completely reformat the DiskOnChip using the 
M-Systems DOS utilities:

http://www.m-sys.com/content/download/OSSupport2.asp?id=8&pid=2

Whenever my DoC had problems, the DFORMAT utility was usually able to get it 
back to a known state.

Unless you're using newer code from the MTD CVS archives, you'll want to use 
version 4.2 of the utilities.

These instructions show how to install the Grub bootloader on a DoC, but 
there is some general information about using DFORMAT and installing a Linux 
filesystem:

http://www.lakeshoremicro.com/diskonchip-grub-howto.html

I hope this helps.

Mark
