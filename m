Subject: Re: [PATCH v2] mtd/mxc_nand: don't call mtd->{suspend,resume}
	explicitly
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
In-Reply-To: <4C41A6EA.8070501@eukrea.com>
References: <1276801147-4103-1-git-send-email-eric@eukrea.com>
	<1276801147-4103-2-git-send-email-eric@eukrea.com>
	<1276801147-4103-3-git-send-email-eric@eukrea.com>
	<1276801147-4103-4-git-send-email-eric@eukrea.com>
	<4C415AB5.9070705@eukrea.com>
	<1279351998.7515.0.camel@localhost.localdomain>
	<4C41A6EA.8070501@eukrea.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 17 Jul 2010 18:13:46 +0300
Message-Id: <1279379626.7515.5.camel@localhost.localdomain>
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

On Sat, 2010-07-17 at 14:49 +0200, Eric Bénard wrote:
> Hi Artem,
> 
> Le 17/07/2010 09:33, Artem Bityutskiy a écrit :
> > On Sat, 2010-07-17 at 09:24 +0200, Eric Bénard wrote:
> >> can you also pick this patch for mxc_nand ?
> >
> > It is in my tree already, and I sent a notification as well :-)
> >
> 
> OK, sorry, I didn't see the notification mail and only checked your 
> master branch, not the dunno branch where you applied this patch !

Yeah, I put to master only the stuff I understand and hence, can
sight-off. The rest goes to dunno - David then processes it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
