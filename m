Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159jHG-0000Qo-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 09:11:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B24EC1B.7F920021@inventel.fr> 
References: <3B24EC1B.7F920021@inventel.fr>  <991934470.27485.0.camel@timmy> <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> <9968.991944081@redhat.com> 
To: Xavier DEBREUIL <xde@inventel.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: problem with zlib.o 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Jun 2001 09:14:08 +0100
Message-ID: <2667.992333648@redhat.com>
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

xde@inventel.fr said:
>  what I did is removing from jffs2/Makefile zlib.o in COMPR_OBJS...
> and linking is then ok...

> Is it a good work around ?

JFFS2 uses exactly the same zlib.c as the one in drivers/net - so yes, if 
you're compiling in the latter then you can omit the JFFS2 one. 

In 2.5 we need to sort out zlib properly so it can be shared sanely.


--
dwmw2
