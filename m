Received: from smtprelay0190.hostedemail.com ([216.40.44.190]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae6Dz-0008C1-S8
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 19:26:20 +0000
Message-ID: <1457637955.3433.17.camel@perches.com>
Subject: Re: checkpatch.pl false positive: FSF mailing address
From: Joe Perches <joe@perches.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux
 Kernel <linux-kernel@vger.kernel.org>
Date: Thu, 10 Mar 2016 11:25:55 -0800
In-Reply-To: <CAN8TOE-dOUsuPfm8cp6c3k94XRzyyCb1g7sAaPeOdaxS9zG-uA@mail.gmail.com>
References: <20160310190023.GB2545@google.com>
 <1457636880.3433.12.camel@perches.com>
 <CAN8TOE-dOUsuPfm8cp6c3k94XRzyyCb1g7sAaPeOdaxS9zG-uA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-03-10 at 11:15 -0800, Brian Norris wrote:
> On Thu, Mar 10, 2016 at 11:08 AM, Joe Perches <joe@perches.com> wrote:

Hey again Brian.

> > Yeah, it's amusing.  It's also likely not something worth
> > bothering with though as the likelihood of fixing it is low
> > and eventually the FSF warning will be minimized or removed
> > as no longer necessary.
> An easy improvement: don't use "ignore case" for the regex.

Maybe, but:

drivers/pcmcia/bfin_cf_pcmcia.c: * if not, write to the free software foundation,

Of course there's only one of those too.

Mostly, it's a "I just don't care very much" warning.

If you care enough to submit a patch removing the "/i"
from the regex, please do and cc Andrew Morton too.

> > checkpatch is stupid, false positives will always exist.

I'd almost rather have people understand this.
