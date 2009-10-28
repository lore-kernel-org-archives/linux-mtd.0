Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N3794-0003gC-Ea
	for linux-mtd@lists.infradead.org; Wed, 28 Oct 2009 11:56:59 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n9SBuhvN008325
	for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2009 06:56:52 -0500
Subject: Re: [PATCH] MTD OneNAND OMAP2/3: allow giving partition layout as
	module parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
In-Reply-To: <1256730627.29885.782.camel@localhost>
References: <1251976558-13463-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1256730627.29885.782.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Oct 2009 13:56:45 +0200
Message-Id: <1256731005.29885.798.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-10-28 at 13:50 +0200, Artem Bityutskiy wrote:
> On Thu, 2009-09-03 at 14:15 +0300, Mika Korhonen wrote:
> > Add module parameter "parts" to omap2-onenand driver. Parameter format is
> > the same as for cmdlinepart except mtd-id must not be specified - it
> > gets prepended by the driver, i.e.: parts=<partdef>[,<partdef>]*
> > 
> > This allows one to repartition the OneNAND chip and is useful for flashing
> > applications that do the partitioning from scratch or want to backup and
> > update the partitioning.
> > 
> > Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>

checkpatch.pl is BTW unhappy.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
