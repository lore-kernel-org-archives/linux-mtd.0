Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qWUe-000667-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Oct 2001 10:14:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011005105919.A28963@recycle.lbl.gov> 
References: <20011005105919.A28963@recycle.lbl.gov>  <20011004160202.A25776@recycle.lbl.gov> <20011004093533.A25013@recycle.lbl.gov> <1002226435.27652.21.camel@russ> <20011004160202.A25776@recycle.lbl.gov> <15283.1002287554@redhat.com> 
To: Larry Doolittle <ldoolitt@recycle.lbl.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: No clean _or_ dirty blocks to GC from! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 08 Oct 2001 10:23:45 +0100
Message-ID: <13795.1002533025@redhat.com>
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


ldoolitt@recycle.lbl.gov said:
>  It doesn't exactly get woken, it just has insomnia.  :-) This
> one-liner "fixes" it for me.

Thanks. I've committed that, with an appropriate comment to make it clear 
that we don't care about the race.

--
dwmw2
