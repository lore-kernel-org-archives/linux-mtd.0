Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDA4q-0001ZR-HH
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 08:51:57 +0000
Date: Wed, 6 Mar 2013 09:51:48 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] mtdchar: handle chips that have user otp but no
 factory otp
Message-ID: <20130306085148.GS22886@pengutronix.de>
References: <1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1362414924-27506-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1362559625.21850.17.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1362559625.21850.17.camel@sauron>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 06, 2013 at 10:47:05AM +0200, Artem Bityutskiy wrote:
> On Mon, 2013-03-04 at 17:35 +0100, Uwe Kleine-König wrote:
> > Before this patch mtd_read_fact_prot_reg was used to check availability
> > for both MTD_OTP_FACTORY and MTD_OTP_USER access. This made accessing
> > user otp for chips that don't have a factory otp area impossible. So use
> > the right wrapper depending on the intended area to be accessed.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > Forwarded: id:1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de
> 
> Pushed to l2-mtd.git, thanks.
> 
> I've removed the "Forwarded:" tag since I've never seen these to be used
> before and not sure if this is an agreed practice.
We use this internally at Pengutronix to keep track of what is already
sent. Usually I remove the tag before resubmission.

Having said that I think it doesn't hurt and tip documents the message
id, too. But there are more urgent problems to solve and I'm fine with
dropping the tag.

Thanks
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
