Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwnDW-00074b-6v
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 08:26:50 +0000
Date: Thu, 12 Nov 2015 09:26:17 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Frans Klaver <fransklaver@gmail.com>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, baruch@tkos.co.il,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
 Luis de Bethencourt <luis@debethencourt.com>, s.hauer@pengutronix.de,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: mxc_nand: fix a possible NULL dereference
Message-ID: <20151112082617.GE24008@pengutronix.de>
References: <1447314423-31225-1-git-send-email-clabbe.montjoie@gmail.com>
 <CAH6sp9OhB3y=0GazcL5Lj-C5z-pRerncQ_KQM0xpP3nmAqF_gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH6sp9OhB3y=0GazcL5Lj-C5z-pRerncQ_KQM0xpP3nmAqF_gw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 09:03:11AM +0100, Frans Klaver wrote:
> Hi,
> 
> On Thu, Nov 12, 2015 at 8:46 AM, LABBE Corentin
> <clabbe.montjoie@gmail.com> wrote:
> > of_match_device could return NULL, and so cause a NULL pointer
> > dereference later.
> 
> Did you actually run into this? It seems to me that this driver is
> only probed if and only if we have a match and that therefore
> of_match_device will always return a valid pointer (it is using the
> same match table). Am I missing something?

Yes, you're missing something. The driver would probe for a dt snippet
like:

	mxc_nand {
		compatible = "foobar";
	}

In this case dev->of_node is non-NULL but of_match_device(mxcnd_dt_ids,
dev) is.

(I didn't actually test this, so there is a chance I'm wrong here. And
if not I wonder if it is sensible at all to match the device name on
driver name for of-created platform devices.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
