Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16U9OM-0003Jo-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 16:39:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200201251626.g0PGQJQ32684@vindaloo.ras.ucalgary.ca> 
References: <200201251626.g0PGQJQ32684@vindaloo.ras.ucalgary.ca>  <20020125103941.26958.qmail@web8101.in.yahoo.com> <4181.1011956000@redhat.com> 
To: Richard Gooch <rgooch@ras.ucalgary.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Cf Card vs DiskOnChip 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 Jan 2002 16:50:46 +0000
Message-ID: <16566.1011977446@redhat.com>
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

rgooch@ras.ucalgary.ca said:
>  What kind of reliability problems? Cards that are DOA? Or random bit
> errors during usage? 

Death on power failure.

Vipin's report at http://www.embeddedlinuxworks.com/articles/jffs_guide.html
seems fairly typical.

--
dwmw2
