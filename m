Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M5YI-0007eb-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 11:24:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B4FDB9D.BF97C98C@sri.crossvue.com> 
References: <3B4FDB9D.BF97C98C@sri.crossvue.com> 
To: dhammika <dpathirana@sri.crossvue.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: problem with lilo 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 16 Jul 2001 11:30:12 +0100
Message-ID: <4406.995279412@redhat.com>
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

dpathirana@sri.crossvue.com said:
> 	Reading boot sector from /dev/nftla1
> 	Merging with /boot/bootsect.b
> 	Fatal: First boot sector is version 20.0. Expecting version 21.7. 

The file /boot/bootsect.b appears to be from a different version of LILO.

--
dwmw2
