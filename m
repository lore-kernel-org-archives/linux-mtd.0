Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOw4t-0001lL-Qy
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 19:16:08 +0000
Received: by yenm10 with SMTP id m10so1741053yen.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2012 12:16:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335705942.1942.10.camel@koala>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-2-git-send-email-computersforpeace@gmail.com>
 <20120429143631.532ce0a6@pixies.home.jungo.com>
 <1335705942.1942.10.camel@koala>
Date: Mon, 30 Apr 2012 12:16:06 -0700
Message-ID: <CAN8TOE-ZbZCmH0nAcM0Jx65nOPaJxyue2nd0MTFY9XwJhLqrsA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] mtd: nand: add 'oob_required' argument to NAND
 {read,write}_page interfaces
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>, Lei Wen <leiwen@marvell.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Kevin Cernekee <cernekee@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Scott Wood <scottwood@freescale.com>,
 Jamie Iles <jamie@jamieiles.com>, Thomas Gleixner <tglx@linutronix.de>,
 Li Yang <leoli@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Axel Lin <axel.lin@gmail.com>, Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 29, 2012 at 6:25 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2012-04-29 at 14:36 +0300, Shmulik Ladkani wrote:
>> > Note: I couldn't compile-test all of these easily, as some had ARCH
>> > dependencies.
>> >
>> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>>
>> Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
>
> Brian, probably you take care of this, but just in case I would like to
> ask to put tags like this to your patches when re-sending. I am trying
> to be careful about this for several reasons: it shows that the patch
> was reviewed, it saves the reviewers name in the git history which and
> makes persons' contribution visible, so it is kind of a credit.

Sure, I'll do this as appropriate. Should I apply these tags when the
review is made w/o an explicit "Reviewed-by" (e.g., Scott Wood's
comments on patch 7)? There's also the issue of placing "reviewed-by"
before the reviewer actually sees my change.

So I'll be sure to place Shmulik's and Huang's tags. Not quite as sure
on Scott's review, but I will include it as "Reviewed-by" for now.

Brian
