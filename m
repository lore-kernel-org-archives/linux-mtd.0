Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZrvO-0006Yy-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 12:45:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020731103419.GA23749@wohnheim.fh-wedel.de> 
References: <20020731103419.GA23749@wohnheim.fh-wedel.de>  <FA06AA2C99BCD511951200005A99441001E3ECBE@irvexch1.sextantifs.com> <14572.1028067711@redhat.com> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_scan_eraseblock() - errors 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 12:45:52 +0100
Message-ID: <2881.1028115952@redhat.com>
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

joern@wohnheim.fh-wedel.de said:
>  How exactly is this done? On the next mount after the failed write?
> By toggling bits in the status word of the node header?

By marking it obsolete. It's an optimisation.

> If so, this will not work with any of the shiny STMicro chips with
> hardware ECC, so I would have to tackle that one too, once we merge. 

Doesn't matter. Our other plans for deferring CRC checking will avoid the 
harmless complaint.


--
dwmw2
