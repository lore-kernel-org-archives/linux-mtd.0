Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NaAsX-0000RI-Mg
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 16:36:34 +0000
Subject: Re: shrinking ubifs?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <152584231001270834l49147b4di6c825acd42a76f8d@mail.gmail.com>
References: <152584231001141415x2086fed9rd8566b6609a87b7e@mail.gmail.com>
	<1263724803.8276.138.camel@localhost.localdomain>
	<152584231001221121u2ffc1816o18d71e6099f8fc6@mail.gmail.com>
	<1264609500.1973.42.camel@localhost>
	<152584231001270834l49147b4di6c825acd42a76f8d@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 Jan 2010 18:35:55 +0200
Message-ID: <1264610155.1973.46.camel@localhost>
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

On Wed, 2010-01-27 at 11:34 -0500, Jon Ringle wrote:
> On Wed, Jan 27, 2010 at 11:25 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Fri, 2010-01-22 at 14:21 -0500, Jon Ringle wrote:
> >> How about the opposite. If the static volumes became smaller freeing
> >> up some LEBs. Can the UBIFS be expanded to make use of the freed LEBs?
> >
> > That works automatically. UBIFS expands automatically, but up to the
> > size which you specified with the '-c' mkfs.ubifs option.
> 
> Can the same thing be done using ubimkvol?
> ubimkvol -m -N ubifs /dev/ubi0

Sorry, I don't understand the question...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
