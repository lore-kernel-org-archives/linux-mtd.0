Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QjuK-00087m-Hy
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 09:27:37 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5D8URD01086
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jun 2003 11:30:27 +0300 (EEST)
Received: from ifaistos.intranet.gr (ifaistos.intranet.GR [146.124.20.203])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5D8UQY01078
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jun 2003 11:30:26 +0300 (EEST)
Received: from intracom.gr (pcrnd46 [146.124.20.92])
	by ifaistos.intranet.gr (8.9.1b+Sun/8.9.1) with ESMTP id LAA20425
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jun 2003 11:24:08 +0300 (EET DST)
Message-ID: <3EE98AC4.9050200@intracom.gr>
Date: Fri, 13 Jun 2003 11:26:44 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <3EE878A5.8040400@intracom.gr>
In-Reply-To: <3EE878A5.8040400@intracom.gr>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] Error free RO mtdblock device for NAND chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Well, obviously this thing will not work since I mistakenly
use a block size of 512, instead of the erase size
of the device as supported by the nandwrite utility.

My device had no bad blocks, so everything worked by chance.

Reading the NAND documentation for the JFFS2 OOB usage
it states the the valid block marker is used for the first page
in a block.

I thought that it meant a block device block, but it appears
that it is the erase block.

So a new patch will be produced shortly.

Regards

Pantelis
