Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OTUZA-0007Qb-73
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 06:45:08 +0000
Subject: Re: [PATCH] mtd: Added an ioctl to query the lock status of a
	flash sector.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>
In-Reply-To: <20100614161033.GA24877@riccoc20.at.omicron.at>
References: <20100531131214.GA15887@riccoc20.at.omicron.at>
	<1276419903.19028.180.camel@localhost>
	<20100614161033.GA24877@riccoc20.at.omicron.at>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Jun 2010 09:42:16 +0300
Message-ID: <1277793736.1041.968.camel@localhost>
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

On Mon, 2010-06-14 at 18:10 +0200, Richard Cochran wrote:
> On Sun, Jun 13, 2010 at 12:05:03PM +0300, Artem Bityutskiy wrote:
> > I think it is tiny bit nicer to name 'is_locked', which is a bit more
> > consistent with the already existing 'block_isbad'?
> 
> Okay, here it is again.

Pushed to l2-mtd-2.6.git / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
