Received: from mga02.intel.com ([134.134.136.20] helo=orsmga101-1.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FZ6p1-0003YO-3M
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 09:46:23 -0400
Message-ID: <4450CB21.1010604@intel.com>
Date: Thu, 27 Apr 2006 17:46:09 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
	<Pine.LNX.4.64.0604261157030.18520@localhost.localdomain>
	<445081B4.8070801@intel.com>
	<Pine.LNX.4.64.0604270859130.18816@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0604270859130.18816@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
>
> Which means you have to copy data into your page, which is against the
> point of writev().  If you're copying data into a separate page in order
> to use write() then JFFS2 could simply do it itself and writev()
> eliminated entirely.
>

I've got your point.

Thanks,
Alexander

-------
The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue.
