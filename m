Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WYZG-00028H-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 08:24:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <8D4C69676E66D511A1CB00508BBBB1921BCE9B@ranmx1.ran.harris.com> 
References: <8D4C69676E66D511A1CB00508BBBB1921BCE9B@ranmx1.ran.harris.com> 
To: "Walser, Martin" <mwalser@harris.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: nftl_format: Erase size not 8Kb - I'm confused 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Aug 2001 08:30:06 +0100
Message-ID: <25431.997774206@redhat.com>
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

mwalser@harris.com said:
> I'm using a MD2202-D16. At startup a message is shown  
> Could not find valid boot record
> Could not mount NFTL device 

Please try the latest code from CVS. This should be fixed.

--
dwmw2
