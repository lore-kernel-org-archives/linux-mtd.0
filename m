Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RNsNy-0006gf-Lb
 for linux-mtd@lists.infradead.org; Tue, 08 Nov 2011 20:35:11 +0000
Received: by bkat2 with SMTP id t2so1108186bka.36
 for <linux-mtd@lists.infradead.org>; Tue, 08 Nov 2011 12:35:07 -0800 (PST)
Subject: Re: [PATCH V2 2/2] mtd: tests: annotate as DANGEROUS in Kconfig
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 08 Nov 2011 22:35:03 +0200
In-Reply-To: <CAN8TOE-pmRTc322hBajwSB1knwYSjBuGeL8tDuG=Te5XE=fcHA@mail.gmail.com>
References: <1319977792.2126.30.camel@koala>
 <1319992129-13588-1-git-send-email-w.sang@pengutronix.de>
 <1320006895.2126.61.camel@koala> <20111030203719.GA20162@pengutronix.de>
 <CAN8TOE-pmRTc322hBajwSB1knwYSjBuGeL8tDuG=Te5XE=fcHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1320784505.17770.0.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Wolfram Sang <w.sang@pengutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-10-31 at 10:00 -0700, Brian Norris wrote:
> On Sun, Oct 30, 2011 at 1:37 PM, Wolfram Sang <w.sang@pengutronix.de> wrote:
> > On Sun, Oct 30, 2011 at 10:34:53PM +0200, Artem Bityutskiy wrote:
> >> On Sun, 2011-10-30 at 17:28 +0100, Wolfram Sang wrote:
> >> > +     WARNING: Some of the tests will ERASE THE CONTENT of mtd devices!
> >> > +     Do not use these tests unless you are sure you really need to.
> >>
> >> Thanks, I've pushed this patch but amended the above text a bit:
> >> +         WARNING: some of the tests will ERASE entire MTD device which they
> >> +         test. Do not use these tests unless you really know what you do.
> 
> Amendment to the amendment, perhaps? I think "unless you really know
> what you do" should be "unless you really know what you are doing".

Sorry, now it is a bit too late - this is merged, but should not be a
big issue I think.

Artem.
