Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EaVqD-00089t-Oh
	for linux-mtd@lists.infradead.org; Fri, 11 Nov 2005 05:09:13 -0500
Date: Fri, 11 Nov 2005 11:08:59 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Pierre.Ricadat@UTBM.fr" <Pierre.Ricadat@utbm.fr>
Message-ID: <20051111100859.GA23660@wohnheim.fh-wedel.de>
References: <1130311964.435f311cf30e9@webmail2.utbm.fr>
	<20051028142739.GB1269@wohnheim.fh-wedel.de>
	<1130753526.4365edf6b2807@webmail1.utbm.fr>
	<20051031143345.GB27238@wohnheim.fh-wedel.de>
	<1130771777.4366354129c88@webmail1.utbm.fr>
	<20051031152430.GC27238@wohnheim.fh-wedel.de>
	<1131702259.437467f3dd940@webmail2.utbm.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1131702259.437467f3dd940@webmail2.utbm.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] separate routine to check jffs2_flash_read
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 11 November 2005 10:44:19 +0100, Pierre.Ricadat@UTBM.fr wrote:
> Quoting Jörn Engel <joern@wohnheim.fh-wedel.de>:
> 
> > Hmmyess, makes sense.  I'd vote for inclusion "right after the merge".
> >
> > Not sure what that actually means.  If it takes too long, I might just
> > shrug and dump new stuff into cvs.  We've had a calm-down period for a
> > while now and the merge could even happen with code from some date
> > like today.
> 
> Could it be added to cvs now?

In principle, yes.  I get half a page of rejects, though.  Can you
respin the patch against current cvs, preferrably so that it applies
with patch -p1?

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
