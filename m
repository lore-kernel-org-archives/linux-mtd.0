Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175Mbf-0005jh-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 09:15:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020508015602.65389.qmail@web9404.mail.yahoo.com> 
References: <20020508015602.65389.qmail@web9404.mail.yahoo.com> 
To: Matt Cochran <matthewcochran@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Filesystem Driver Panic 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 May 2002 09:15:26 +0100
Message-ID: <1195.1020845726@redhat.com>
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

matthewcochran@yahoo.com said:
> I've been developing a system using kernel 2.4.18 and the MTD drivers
> packaged with it on a system with a Millenium DOC. I've enabled
> read-write support and can successfully read the test VFAT filesystem
> on the DOC. However, after multiple writes, approximately 6, I get a
> "filesystem panic" from the kernel, and the device is remounted
> read-only.

Can you give more details? Can you reproduce by just reading from and 
writing to the raw /dev/nftla device?

It's better to format with their DFORMAT program than nftl_format.

--
dwmw2
