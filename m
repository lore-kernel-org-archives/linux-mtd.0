Date: Sat, 11 Jun 2011 12:38:07 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
Subject: Re: [PATCH 2/3] ts72xx: use MTDPART_OFS_RETAIN for mtd partitioning
Message-ID: <20110611103807.GC16318@ibawizard.net>
References: <1307369056-29319-1-git-send-email-dbaryshkov@gmail.com>
	<1307369056-29319-3-git-send-email-dbaryshkov@gmail.com>
	<20110611092224.GB16318@ibawizard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20110611092224.GB16318@ibawizard.net>
Cc: Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com,
	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Mika Westerberg <mika.westerberg@iki.fi>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <ryan@bluewatersys.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Petr ©tetiar <ynezz@true.cz> [2011-06-11 11:22:24]:

> I think, that it would be better to either make that Redboot partition
> read-only by default

Sorry for the noise, it's read-only already, I've just missed that mask.

-- ynezz
