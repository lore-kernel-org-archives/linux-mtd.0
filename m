Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T49Pk-0000la-W6
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 11:48:01 +0000
Received: by bkcji2 with SMTP id ji2so270890bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 04:47:59 -0700 (PDT)
Date: Wed, 22 Aug 2012 14:47:51 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
Message-ID: <20120822144751.5aa7f932@pixies.home.jungo.com>
In-Reply-To: <1345635197.2848.152.camel@sauron.fi.intel.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
 <1345635015.2848.150.camel@sauron.fi.intel.com>
 <1345635197.2848.152.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, 22 Aug 2012 14:33:17 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > 2. Just call the 'attach' ioctl with an insane max_beb_per1024 value
> > (say, -1) first. If it succeeded, than the driver does not support
> > max_beb_per1024 at all, and you may exit with a warning that you have
> > attached it, but the max_beb_per1024 was ignored because the kernel is
> > old.
> > 
> > If it fails with -EINVAL, this means the kernel checked the value and
> > the feature is supported, so you can call it for the second time with
> > the right max_beb_per1024.

But the ioctl might return -EINVAL due to any of the *other*
ubi_attach_req fields being invalid.
So you can't really determine whether max_beb_per1024 is supported.

> > The first approach is more complex but probably cleaner. The second is
> > easier to implement.
> 
> I guess I prefer the second option, though. What do you think?

I would go with first, due to my slight tendency to over-design
things ;-)
It is cleaner, however bloatier too...

I'll try to think if there's an easy alternative.

Regards,
Shmulik
