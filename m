Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hq46j-0007sJ-NK
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 05:24:01 -0400
Received: by ug-out-1314.google.com with SMTP id m2so845161uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 May 2007 02:23:07 -0700 (PDT)
From: borasah@gmail.com
To: linux-mtd@lists.infradead.org
Subject: Re: NAND flash write goes wrong
Date: Mon, 21 May 2007 12:30:12 +0300
References: <200705102150.31171.borasah@gmail.com>
	<200705112058.14662.borasah@gmail.com>
	<Pine.LNX.4.64.0705140852340.3951@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0705140852340.3951@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="Iso-8859-9"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705211230.12829.borasah@gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

[Snip]

Thanks for the infos...

> >> Blocks (nand flash terminology rejects the name 'sectors' in favor of
> >> 'blocks' and 'pages') can go bad with time, but we're talking about
> >> thousands if not tens of thousands of erase/write cycles here. So it
> >> seems there's something wrong here.
> >
> > Yes, I think too. Now ~140 bad sector is reported during the boot. I just
> > did at most 50 read/write...
>
> You sound far from wearing the chip out. There must be another problem
> there somewhere.

Hmm...

> >> There was a patch posted just a week or so ago here which fixed a
> >> problem with bad block marking and recognition when not using a
> >> flash-based bad block table.
> >
> > I'm new to the list. Is this Artem's patch? I applied it, but no
> > success... Maybe
> > http://lists.infradead.org/pipermail/linux-mtd/2007-May/018087.html?
>
> By Thomas Knobloch I believe, but yes, that's the patch I was thinking of.

I applied it but no success...

------------

I tried K9F1208U0A with linux-2.6.20 -> JFFS2 file system. I successfully used 
the part. 

Secondly, I tried yaffs with that part in the linux-2.6.11. It was successful 
too.

--
Bora SAHIN
