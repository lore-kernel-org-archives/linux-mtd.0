Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 169q4E-0001EF-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2001 15:59:10 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <OFAC99A10B.9F8BAC9B-ON85256B14.00580AD9@nitsuko.com> 
References: <OFAC99A10B.9F8BAC9B-ON85256B14.00580AD9@nitsuko.com> 
To: MQuicquaro@necinfrontia.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: No space on jffs2 fs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 30 Nov 2001 16:09:42 +0000
Message-ID: <11848.1007136582@redhat.com>
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

MQuicquaro@necinfrontia.com said:
>  Can this 5 block minimum be easily reduced by me, even if its just
> temporary, so that I can get past my initial development/testing
> phase? 

Edit fs/jffs2/nodelist.h, reduce JFFS2_RESERVED_BLOCKS_BASE to 1.

--
dwmw2
