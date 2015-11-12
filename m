Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwwnq-0007Re-6E
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 18:40:58 +0000
Received: by pabfh17 with SMTP id fh17so72666586pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 10:40:37 -0800 (PST)
Date: Thu, 12 Nov 2015 10:40:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kernel@pengutronix.de
Subject: Re: [PATCH v2 0/5] mkfs.ubifs: cleanups + extended attribute support
Message-ID: <20151112184034.GB8456@google.com>
References: <1447320688-3086-1-git-send-email-mkl@pengutronix.de>
 <CAFLxGvzd8R3ZWD7WHUzTwjdEfd9y+249x7CTUWLJvbPWOF7cnA@mail.gmail.com>
 <56446247.9030808@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56446247.9030808@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 10:56:23AM +0100, Marc Kleine-Budde wrote:
> On 11/12/2015 10:53 AM, Richard Weinberger wrote:
> > And bonus points for rebasing to the latest mtd-utils tree! :-)
> 
> I've to pass at least half of the bonus points to the git developers, as
> git detected and handled the tree restructuring without any manual
> interaction. \o/

+1

I'll also take this time to confess that for the longest time, I didn't
have am.threeWay set in my .gitconfig. That really helps as a maintainer
for applying patches that *aren't* quite rebased to the latest tree.

Brian
