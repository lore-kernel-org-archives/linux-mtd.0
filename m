Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T20TN-0002J2-Uo
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 13:50:55 +0000
Received: by weyr3 with SMTP id r3so1907237wey.36
 for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2012 06:50:32 -0700 (PDT)
Date: Thu, 16 Aug 2012 16:50:27 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 4/4] UBI: replace MTD_UBI_BEB_LIMIT with user-space
 parameter
Message-ID: <20120816165027.6520c4f4@pixies.home.jungo.com>
In-Reply-To: <1345123718.3393.235.camel@sauron.fi.intel.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-5-git-send-email-richard.genoud@gmail.com>
 <20120816115713.726da8f2@pixies.home.jungo.com>
 <1345123718.3393.235.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 16 Aug 2012 16:28:38 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2012-08-16 at 11:57 +0300, Shmulik Ladkani wrote:
> > 
> > For the simplest systems (those having one ubi device) that need a
> > limit
> > *other* than the default (20 per 1024), they can simply set the config
> > to their chosen value, as they were used to.
> > 
> > With you approach, these system MUST pass the limit parameter via the
> > ioctl / module-parameter. 
> 
> Yeah, when you change the default, you usually need to do an extra step.
> It does not feel too bad, and I would not keep additional configuration
> option for a hypothetical user. If someone suffers, we can add an option
> to change the default. But I'd start without it. So, I think it is OK to
> remove this.

Yes, but the main drawback I was referring to is those platforms already
setting MTD_UBI_BEB_RESERVE other than the default, by means of kernel
configuration.
(there's one platform known to do so in its defconfig, that's
sam9_l9260_defconfig, which uses 3% instead of the "standard" 2%).

These platforms must now change their usermode code to either pass a
module parameter during the insmod or change their attach ioctl of
their application.

We force these systems to change their usermode because we changed ubi's
default BEB limit to be 20/1024 _hardcoded_ (instead of kernel
configurable as previously was).

Is this ok?

Regards,
Shmulik
