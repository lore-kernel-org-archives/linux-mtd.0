Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZodS-0006Gv-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 09:15:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <007901c23869$35d3f500$1b0448c0@gv.com.tw> 
References: <007901c23869$35d3f500$1b0448c0@gv.com.tw> 
To: "??" <kevin@gv.com.tw>
Cc: linux-mtd@lists.infradead.org
Subject: Re: can i use jffs2 directly on /dev/mtdblock? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 09:15:02 +0100
Message-ID: <31207.1028103302@redhat.com>
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

kevin@gv.com.tw said:
>  can i use jffs2 directly on /dev/mtdblock? instead of /dev/nftl?

You cannot use JFFS2 on NFTL. You can _only_ use it on /dev/mtdblock 
devices.

--
dwmw2
