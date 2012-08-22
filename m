Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4B2Y-0006Xo-SY
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 13:32:11 +0000
Received: by lagu2 with SMTP id u2so521788lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 06:32:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345636258.2848.156.camel@sauron.fi.intel.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
 <1345635015.2848.150.camel@sauron.fi.intel.com>
 <1345635197.2848.152.camel@sauron.fi.intel.com>
 <CACQ1gAithQd0RMk16atkaaSWZs1CoLnXDe801BP6SvAdVCSKwg@mail.gmail.com>
 <1345636258.2848.156.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 15:31:46 +0200
Message-ID: <CACQ1gAipH5gfTwOmrhGeESuSju01my_pfA8=sfP5QVCWmbvL9g@mail.gmail.com>
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/22 Artem Bityutskiy <dedekind1@gmail.com>:
> Good. But please, implement this double 'attach' invocation inside
> 'ubi_attach_mtd()'. Please, introduce a special return code to indicate
> the 'attached but max_beb_per1024 was ignored' case (say, 1). Add
> comments explaining the trick.

one question:
- does the call:
ubiattach -m 2 -b 0
should fail on an old kernel ?
In this case, I'll have to introduce a flag or something to let
ubi_attach_mtd() know that the -b option was given.
Honestly, I don't think it's necessary, as far as -b0 means "the
default kernel value", so on an old kernel the default that's what
will happened.

I'll have also to change the ubi_attach() call.
My though is to factorize code between ubi_attach_mtd() and
ubi_attach(), and then make the change.


Best regards,
Richard.
