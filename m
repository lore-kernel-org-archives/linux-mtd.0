Received: from nat-pool-rdu.redhat.com ([66.187.233.200]
	helo=devserv.devel.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Ul8W-0007Tc-0C
	for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2003 11:34:52 +0100
Date: Tue, 24 Jun 2003 06:35:07 -0400
From: Alexander Viro <aviro@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030624063507.E9043@devserv.devel.redhat.com>
References: <5.2.1.1.0.20030622225659.00a46a30@192.168.1.10>
	<1056446261.29264.393.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1056446261.29264.393.camel@passion.cambridge.redhat.com>;
	from dwmw2@infradead.org on Tue, Jun 24, 2003 at 10:17:42AM +0100
Content-Type: text/plain; charset=us-ascii
cc: Allen Curtis <acurtis@onz.com>
cc: Infradead Org <linux-mtd@lists.infradead.org>
cc: jffs-dev@axis.com
Subject: Re: JFFS patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 24, 2003 at 10:17:42AM +0100, David Woodhouse wrote:
> On Mon, 2003-06-23 at 06:58, Allen Curtis wrote:
> > Patch for updating JFFS in 2.4.20 kernel
> 
> Looks good. Want to take over maintenance for JFFS? I'm getting very
> tempted to remove it from the 2.5 tree unless someone steps forward to
> look after it.

It would be nice.  There are several ugly craps in there and I'd
rather see it gone than try and fix them...
