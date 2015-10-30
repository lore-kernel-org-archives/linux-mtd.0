Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs5fn-00082B-M4
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 09:08:36 +0000
Message-ID: <1446196090.6126.48.camel@gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Andrea Scian <rnd4@dave-tech.it>,  Iwo
 Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, Bean Huo =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?=
 "\"(beanhuo)\"" <beanhuo@micron.com>
Date: Fri, 30 Oct 2015 11:08:10 +0200
In-Reply-To: <20151030091521.439f436b@bbrezillon>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon> <1446035085.12536.71.camel@gmail.com>
 <20151030091521.439f436b@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-10-30 at 09:15 +0100, Boris Brezillon wrote:
> Hi Artem,
> 
> Don't take the following answer as a try to teach you how UBI/UBIFS
> work
> or should work with MLC NANDs. I still listen to your suggestions,
> but
> when I had a look at how this "skip pages on demand" approach could
> be implemented I realized it was not so simple.

Sure.

Could you verify my understanding please.

You realized that "skip on demand" is not easy, and you suggest that we
simply write all the data twice - first time we skip pages, and then we
garbage collect everything. At the end, roughly speaking, we trade off
half of the IO speed, power, and NAND lifetime.

About secure LEBs - do you suggest UBI exposes 2 different LEB sizes at
the same time - secure and unsecure, or you it could be only in one of
the modes.

Thanks.
