Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T49Du-0006o4-9e
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 11:35:46 +0000
Received: by lbbgf7 with SMTP id gf7so533754lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 04:35:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345635015.2848.150.camel@sauron.fi.intel.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
 <1345635015.2848.150.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 13:35:21 +0200
Message-ID: <CACQ1gAiPPFyja+=gckbrGvkzB5C7L20-7Orzu5yAGXyFaZX65A@mail.gmail.com>
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
> I see 2 ways.
>
> 1. Add a 'get device property' ioctl, similar to the 'set volume
> property' ioctl we have. And use this ioctl to query the current bad
> PEBs limit.
>
> 2. Just call the 'attach' ioctl with an insane max_beb_per1024 value
> (say, -1) first. If it succeeded, than the driver does not support
> max_beb_per1024 at all, and you may exit with a warning that you have
> attached it, but the max_beb_per1024 was ignored because the kernel is
> old.
>
> If it fails with -EINVAL, this means the kernel checked the value and
> the feature is supported, so you can call it for the second time with
> the right max_beb_per1024.
>
> The first approach is more complex but probably cleaner. The second is
> easier to implement.
>
> --
> Best Regards,
> Artem Bityutskiy

There's also a 3rd one with an uname system call, checking if kernel
>= 3.7, but that's not very elegant.

-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
