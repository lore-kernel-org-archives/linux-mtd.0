Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IcFO-0002tS-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 22:35:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020613161907.87873.qmail@web21503.mail.yahoo.com> 
References: <20020613161907.87873.qmail@web21503.mail.yahoo.com> 
To: Studying MTD <studying_mtd@yahoo.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: why MTD model ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 13 Jun 2002 22:34:52 +0100
Message-ID: <30266.1024004092@redhat.com>
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

studying_mtd@yahoo.com said:
> Can somehow we treat(emulate) memory device as a block device and
> treat memory device like a hard disk ?

Not directly, no. There are drivers which do so -- and present a flash 
device as a block device using translation layers of various complexity, 
but that is not a true representation of the capabilities of the underlying 
device.

--
dwmw2
