Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U6be-0007Zw-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 14:09:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B6FD798.17986BCA@sri.crossvue.com> 
References: <3B6FD798.17986BCA@sri.crossvue.com>  <3B6E01BA.2B394136@sri.crossvue.com> <4758.997179115@redhat.com> 
To: dhammika <dpathirana@sri.crossvue.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mtd lilo 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 14:14:55 +0100
Message-ID: <31492.997190095@redhat.com>
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
>  I formatted it with the nftl_format, how does this affect lilo?? How
> can I figure out if it's still there?? 

You probably removed the BIOS completely then. You can't use LILO without a 
BIOS to provide INT 13h functionality.

Reformat the DiskOnChip with the DFORMAT utility, and you should get the 
BIOS back. You shouldn't need to use nftl_format - I'm severely tempted to 
remove it from CVS.

--
dwmw2
