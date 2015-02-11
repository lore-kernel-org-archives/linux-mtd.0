Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YLTul-0001XC-DV
 for linux-mtd@lists.infradead.org; Wed, 11 Feb 2015 09:49:00 +0000
Date: Wed, 11 Feb 2015 10:48:37 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 6/6] [RFC] mtd: mxc-nand: Warn on unimplemented commands
Message-ID: <20150211094837.GX10842@pengutronix.de>
References: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1423594800-24214-7-git-send-email-u.kleine-koenig@pengutronix.de>
 <20150211094256.2ef2805b@ipc1.ka-ro>
 <20150211090017.GW10842@pengutronix.de>
 <20150211104016.0d7eec4d@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150211104016.0d7eec4d@ipc1.ka-ro>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Wed, Feb 11, 2015 at 10:40:16AM +0100, Lothar Waßmann wrote:
> Uwe Kleine-König wrote:
> > On Wed, Feb 11, 2015 at 09:42:56AM +0100, Lothar Waßmann wrote:
> > > > diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> > > > index 0083b4ee4f33..372e0e38f59b 100644
> > > > --- a/drivers/mtd/nand/mxc_nand.c
> > > > +++ b/drivers/mtd/nand/mxc_nand.c
> > > > @@ -1160,6 +1160,10 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
> > > >  		memcpy32_fromio(host->data_buf, host->main_area0, 512);
> > > >  		host->buf_start = 0;
> > > >  		break;
> > > > +	default:
> > > > +		WARN_ONCE(1, "Unimplemented command (cmd=%u)\n",
> > > > +			  command);
> > > > +		break;
> > > >  	}
> > > useless break;
> > Do you mean the line break? That's right, I fixed it here for a later
> > v2. But I guess you mean the (literal) break here. Right, it could be
> > dropped without change in semantic, but I thought adding it matches the
> > usually recommended style?!
> > 
> Documentation/CodingStyle has this example:
> |        default:
> |                break;
> |        }
> but there is no useful statement in the 'default' case, so the
> 'break' is necessary here.
> IMO this doesn't mandate to add a 'break' at the end of the default
> clause if there are actual statements in this path.
OK, we agree that Documentation/CodingStyle isn't explict about this
case here. For non-default case labels I already saw review requests to
add an explicit break which I consider sensible. For default it's not
that important but IMHO still good style. I want to keep it.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
