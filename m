Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1Zh0UB-0002gq-NI
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 19:22:48 +0000
Received: by pacex6 with SMTP id ex6so14411483pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 12:20:56 -0700 (PDT)
Date: Tue, 29 Sep 2015 12:20:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Enrico Joerns <ejo@pengutronix.de>,
 MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd-utils: ubinize: Always return error code (at least
 -1) in case of an error
Message-ID: <20150929192054.GE31505@google.com>
References: <1441978093-20917-1-git-send-email-ejo@pengutronix.de>
 <560A9036.6090902@pengutronix.de>
 <CAFLxGvwacK9TWc58N07i8KBvPTY4nD9eMfmo+q6oMvyxoYSC+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvwacK9TWc58N07i8KBvPTY4nD9eMfmo+q6oMvyxoYSC+Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 29, 2015 at 03:40:38PM +0200, Richard Weinberger wrote:
> On Tue, Sep 29, 2015 at 3:20 PM, Enrico Joerns <ejo@pengutronix.de> wrote:
> > Any comments on this?
> 
> Looks good to me!

Pushed to mtd-utils.git.
