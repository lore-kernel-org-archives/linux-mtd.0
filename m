Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15aB5d-0002en-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2001 08:09:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010824023928.3168.qmail@qis> 
References: <20010824023928.3168.qmail@qis> 
To: "Nikolai Vladychevski" <niko@isl.net.mx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtdchar major , 90 or 91? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 24 Aug 2001 08:15:09 +0100
Message-ID: <10297.998637309@redhat.com>
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

niko@isl.net.mx said:
>  Why in MAKEDEV the char device has major 90 and in mtdchar.c it has
> redefined from 90 to 91 in one of the first lines of code: 

Eep, sorry. That was a local hack which shouldn't have escaped my tree. 
Reverted.

--
dwmw2
