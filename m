Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178irp-0005q0-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 15:38:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <OFC71DD43C.AE1C268B-ONC1256BBC.004CD0AC@diamond.philips.com> 
References: <OFC71DD43C.AE1C268B-ONC1256BBC.004CD0AC@diamond.philips.com> 
To: erik.niessen@philips.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems using mke2fs on DOC-2000 (288MB) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 May 2002 15:38:01 +0100
Message-ID: <2159.1021646281@redhat.com>
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

May 17 15:58:20 localhost kernel: Cannot make free space.

This seems to happen when we allow the kernel to write to blocks which are 
higher than it should actually allow.

Can you show me the output of 'nftldump /dev/mtd0' ?

--
dwmw2
