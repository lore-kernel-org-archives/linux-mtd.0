Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U3kU-0007LC-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 11:06:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B6E01BA.2B394136@sri.crossvue.com> 
References: <3B6E01BA.2B394136@sri.crossvue.com> 
To: dhammika <dpathirana@sri.crossvue.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd lilo 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 11:11:55 +0100
Message-ID: <4758.997179115@redhat.com>
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
>  but when i try to boot with lilo nothing comes up, any ideas??

Odd. LILO doesn't start at all? Not even 'LI'?

Does the DiskOnChip BIOS still work, or did you delete it with nftl_format?

--
dwmw2
