Subject: Re: [PATCH] mxc_nand: fix PM
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
In-Reply-To: <4C15D542.2060102@eukrea.com>
References: <1274942000-3580-2-git-send-email-eric@eukrea.com>
	<1274982919-13251-1-git-send-email-eric@eukrea.com>
	<4C15D542.2060102@eukrea.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Jun 2010 09:41:36 +0300
Message-ID: <1277793696.1041.967.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-06-14 at 09:07 +0200, Eric Bénard wrote:
> Hi Sascha,
> 
> Le 27/05/2010 19:55, Eric Bénard a écrit :
> > * when resuming, we get the following log :
> > nand_resume called for a chip which is not in suspended state
> > * this happens because mtd->suspend and mtd->resume are already
> > called from the mtd layer, thus they were called a second time
> > in mxc_nand so mtd complains when trying to resume for the
> > second time
> > * the fix is to remove these call and thus remove the supend and
> > resume functions of mxc_nand
> >
> any news concerning this patch ?
> 

Pushed to l2-mtd-2.6.git / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
