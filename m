Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161XgC-0001rF-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2001 18:44:04 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <8D4C69676E66D511A1CB00508BBBB192157886@ranmx1.ran.harris.com> 
References: <8D4C69676E66D511A1CB00508BBBB192157886@ranmx1.ran.harris.com> 
To: "Fend, Matthias" <mfend@harris.com>
Cc: 'linux mtd' <linux-mtd@lists.infradead.org>
Subject: Re: doc 2000 unknown partition table 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Nov 2001 18:52:48 +0000
Message-ID: <650.1005159168@redhat.com>
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


mfend@harris.com said:
> Partition check:
>  nftla: unknown partition table

That's normal after you've just done nftl_format - there will have been no 
partition table on there. If you tried to write a partition table with 
fdisk and it still said that, then there's something wrong. Check that 
you can read and write the raw /dev/nftla device. 

Also, try using the nftldump utility (on /dev/mtd0) to check that the
contents of the flash are sane. 

--
dwmw2
