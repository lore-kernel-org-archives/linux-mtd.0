Subject: Re: [PATCH v5 5/9] [MTD] remove bogus warning about missing boot
	bank	location
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20100424155812.14723.66554.stgit@shiryu.yomgui.biz>
References: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
	<20100424155812.14723.66554.stgit@shiryu.yomgui.biz>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Apr 2010 08:57:35 +0300
Message-ID: <1272520655.7750.74.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Chris Moore <moore@free.fr>,
	Wolfram Sang <w.sang@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-04-24 at 17:58 +0200, Guillaume LECERF wrote:
> From: Uwe Kleine-König <Uwe.Kleine-Koenigi@digi.com>
> 
> After the deleted block bootloc is only used once as follows:
> 
> 	if (bootloc == 3 && something_else) {
> 		...
> 
> So setting bootloc = 2 doesn't change anything.  Taking that the warning is
> wrong and missleading.
> 
> Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> Acked-by: Christopher Moore <moore@free.fr>

Pushed this v5 series to l2-mtd-2.6 / dunno. But please, if you re-send
the series, use consistent "mtd: cfi_cmdset_0002:" prefix for this
patch. Then I will be able to do git-am without manual work. Now I have
to tweak this patch because git am removes [MTD].

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
