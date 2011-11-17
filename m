Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRBoO-00061j-LZ
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2011 23:56:09 +0000
Received: by wwe32 with SMTP id 32so2785915wwe.18
 for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2011 15:56:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1321568352.2272.33.camel@koala>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
Date: Thu, 17 Nov 2011 15:56:05 -0800
Message-ID: <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
Subject: Re: [PATCH 0/2] small mtd-utils fixes
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 17, 2011 at 2:19 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> We can release it as soon as someone ask. Should I do this now?

I suppose I'm asking, so yes :)

> Could you please refresh my memory and remind me about the brian branch?
> Why we have it and what prevents us from merging it to the master
> branch? There were some kernel changes which I was not sure about? But
> now they are in Linus' tree so we can merge that branch and make a
> release, right?

Your exact quote: "And last but not least, I think we should not push
your changes to the master branch of mtd-utils _befor_ the
corresponding kernel-space changes have reached Linuses tree (e.g.,
dwmw2 might dislike something)."

So I suppose it was just waiting until the kernel changes passed
dwmw2. Now's a good time to merge 'brian' and release, I guess.

Thanks,
Brian
