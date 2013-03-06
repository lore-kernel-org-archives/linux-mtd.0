Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UD9zz-0000Fb-2x
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 08:46:56 +0000
Message-ID: <1362559625.21850.17.camel@sauron>
Subject: Re: [PATCH v2] mtdchar: handle chips that have user otp but no
 factory otp
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 06 Mar 2013 10:47:05 +0200
In-Reply-To: <1362414924-27506-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1362414924-27506-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-04 at 17:35 +0100, Uwe Kleine-König wrote:
> Before this patch mtd_read_fact_prot_reg was used to check availability
> for both MTD_OTP_FACTORY and MTD_OTP_USER access. This made accessing
> user otp for chips that don't have a factory otp area impossible. So use
> the right wrapper depending on the intended area to be accessed.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Forwarded: id:1361182768-31919-1-git-send-email-u.kleine-koenig@pengutronix.de

Pushed to l2-mtd.git, thanks.

I've removed the "Forwarded:" tag since I've never seen these to be used
before and not sure if this is an agreed practice.

-- 
Best Regards,
Artem Bityutskiy
