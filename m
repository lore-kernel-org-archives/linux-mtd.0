Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 152orU-0006yl-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 May 2001 07:44:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B0C8A8E.F0543661@isl.net.mx> 
References: <3B0C8A8E.F0543661@isl.net.mx> 
To: Nikolai Vladychevski <niko@isl.net.mx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtdblock failing 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 24 May 2001 07:48:50 +0100
Message-ID: <8664.990686930@redhat.com>
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
> I have problems using mtdblock device with DoC millenium 8MB, it does
> not accept reading or writing.

The DiskOnChip hardware drivers aren't designed for use with anything but 
the NFTL code. So they don't accept reads longer than a single flash page, 
which is what you're seeing.

--
dwmw2
