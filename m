Received: from relay-6v.club-internet.fr ([194.158.96.111])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ASPqq-00024h-P6
	for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2003 23:59:12 +0000
Date: Fri, 5 Dec 2003 23:45:19 -0100 (GMT+1)
From: Jasmine Strong <jasmine@regolith.co.uk>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1070666214.8421.4.camel@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.53.0312052344460.3377@pink.linuxgrrls.org>
References: <77FE4A1FA59FF947845A42194AD667620A0F4E@uswaumsx07medge.med.ge.com>
	<Pine.LNX.4.53.0312052158410.3295@pink.linuxgrrls.org>
	<1070666214.8421.4.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
cc: "Howard, Michael \(MED\)" <Michael.Howard@med.ge.com>
Subject: Re: Why restrict to page aligned writes in nand_write_ecc() ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Fri, 5 Dec 2003, David Woodhouse wrote:

> > For jffs2 to work properly it's pretty much essential to support partial
> > page writing.  You also need to support subsequent writes to the same
> > partially-written page.
>
> No. The current JFFS2 code handles batching writes up into page-sized
> chunks just fine.

...what about power failures?

-J.
