Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zs6J-0006aP-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 12:57:11 +0100
Date: Wed, 31 Jul 2002 13:57:03 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_scan_eraseblock() - errors
Message-ID: <20020731115703.GB28984@wohnheim.fh-wedel.de>
References: <20020731103419.GA23749@wohnheim.fh-wedel.de> <FA06AA2C99BCD511951200005A99441001E3ECBE@irvexch1.sextantifs.com> <14572.1028067711@redhat.com> <2881.1028115952@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2881.1028115952@redhat.com>
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

On Wed, 31 July 2002 12:45:52 +0100, David Woodhouse wrote:
> joern@wohnheim.fh-wedel.de said:
> >  How exactly is this done? On the next mount after the failed write?
> > By toggling bits in the status word of the node header?
> 
> By marking it obsolete. It's an optimisation.

And this marking as obsolete is done how? Does is involve writes to
the flash node, after it has already been written?

Sorry for me being clueless.

> > If so, this will not work with any of the shiny STMicro chips with
> > hardware ECC, so I would have to tackle that one too, once we merge. 
> 
> Doesn't matter. Our other plans for deferring CRC checking will avoid the 
> harmless complaint.

Ok, I can live with that.

Jörn

-- 
When in doubt, use brute force.
-- Ken Thompson
