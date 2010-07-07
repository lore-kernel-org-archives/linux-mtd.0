Subject: Re: [PATCH v2] mtd/mxc_nand: don't call mtd->{suspend,resume}
	explicitly
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
In-Reply-To: <1276801147-4103-4-git-send-email-eric@eukrea.com>
References: <1276801147-4103-1-git-send-email-eric@eukrea.com>
	<1276801147-4103-2-git-send-email-eric@eukrea.com>
	<1276801147-4103-3-git-send-email-eric@eukrea.com>
	<1276801147-4103-4-git-send-email-eric@eukrea.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 07 Jul 2010 17:17:11 +0300
Message-ID: <1278512231.12733.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-06-17 at 20:59 +0200, Eric Bénard wrote:
> The mtd layer is responsible to call mtd->{suspend,resume}.  Doing it
> again in the driver is wrong and results in a warning:
> 
> 	nand_resume called for a chip which is not in suspended state
> 
> at resume time.  Removing the calls from the resume and suspend
> functions makes them empty allowing them to be deleted completely.
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Pushed to l2-mtd-2.6.git / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
