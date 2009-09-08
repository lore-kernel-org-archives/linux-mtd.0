Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ml50e-0001N7-Tg
	for linux-mtd@lists.infradead.org; Tue, 08 Sep 2009 18:01:45 +0000
In-Reply-To: <4AA684A6.1000303@billgatliff.com>
References: <774508.54364.qm@web110103.mail.gq1.yahoo.com>
	<4AA684A6.1000303@billgatliff.com>
Subject: Re: Ideal NAND flashes for JFFS2 or YAFFS
To: Bill Gatliff <bgat@billgatliff.com>
Message-ID: <OFBEE608EF.84319E73-ONC125762B.0062C1F1-C125762B.0062FE4E@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 8 Sep 2009 20:01:16 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Justin Treon <justin_treon@yahoo.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bill Gatliff <bgat@billgatliff.com> wrote on 08/09/2009 18:21:58:
>
> Justin Treon wrote:
> > For NAND I think there is a simple flow chart to pick your filing system.
> >
> > Do you have a partition bigger than 256 MBytes?

Oh yes, probably 512MB-1GB, possibly more

> > If YES: Use UBIFS (@128 MB you can argue the point)
> > If NO: Do you have a LOT of RAM?
> >    If YES: Use YAFFS2 (It is fast, but RAM hungry)

This is news to me. I always had the impression that JFFS2 needed
more RAM.

> >    If NO: Use JFFS2
> >
>
> With 128MB and/or 1GB partitions, does YAFFS2 use more memory than
> UBIFS?  It does seem to me that YAFFS2 mounts a tad faster, though I
> haven't broken out the stopwatch or anything (yet).

I too want to know.

 Jocke
