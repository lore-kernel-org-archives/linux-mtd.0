Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iv2M-0004x0-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2002 10:22:14 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C87599B.410CDBA0@selta.it> 
References: <3C87599B.410CDBA0@selta.it> 
To: stefania magistrali <s.magistrali@selta.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip booting for PPC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Mar 2002 10:33:32 +0000
Message-ID: <14934.1015497212@redhat.com>
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

s.magistrali@selta.it said:
> I know the MTD driver doesn't support DiskOnChip Millenium Plus now,
> but is it possible it will support it in a short time?

Booting PPC from a DiskOnChip Millennium ought to be doable. However we 
have no information about the Millennium Plus, and hence no chance of 
writing drivers for it. Avoid the Millennium Plus at all costs, if you 
intend to use Linux.

Did anyone test the patches for UnitSizeFactor != 1 yet?

--
dwmw2
