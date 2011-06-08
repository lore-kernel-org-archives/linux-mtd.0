Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUIjR-0004Cx-7q
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 13:23:37 +0000
Received: by wyb28 with SMTP id 28so457082wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 06:23:34 -0700 (PDT)
Subject: Re: [PATCH] mtd: OneNAND: Detect the correct NOP when 4KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <BANLkTinOBRUiaAGrbPcxve-EzZN3YdS__g@mail.gmail.com>
References: <20110608015625.GA27537@july> <1307530994.31223.46.camel@localhost>
	<BANLkTinOBRUiaAGrbPcxve-EzZN3YdS__g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 16:19:16 +0300
Message-ID: <1307539156.31223.69.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	roman.tereshonkov@nokia.com, m.szyprowski@samsung.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-08 at 22:21 +0900, Kyungmin Park wrote:
> > 1. Add a comment that this is a hacky quirk to work around HW
> >   identification flaw, to make it clear for the people who read the
> >   code.
> 
> For the record, chip maker (memory) made different chips for each
> vendor (Samsung Mobile, and Nokia)
> with the design flaw, it made a workaround, not hacky quirk.

OK :-) Would you please send an updated patch ?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
