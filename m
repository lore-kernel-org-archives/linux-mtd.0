Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15XgR5-0006zf-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2001 11:01:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.GSO.4.31.0108171303040.549-100000@netti.nic.fi> 
References: <Pine.GSO.4.31.0108171303040.549-100000@netti.nic.fi> 
To: Riipinen Petri <riipinen@nic.fi>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [Novice] Few simple questions on DOC. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 Aug 2001 11:06:27 +0100
Message-ID: <27368.998042787@redhat.com>
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

riipinen@nic.fi said:
>  Can the patches be applied to 2.4.9, so that I could do it myself
> before they are applied into the official source tree? 

Yep. Just drop in the contents of the drivers/mtd directory from CVS over 
the top of the one in 2.4.9

--
dwmw2
