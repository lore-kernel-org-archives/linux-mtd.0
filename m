Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T48wZ-000442-N7
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 11:17:52 +0000
Received: by lagu2 with SMTP id u2so446781lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 04:17:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345632176.2848.144.camel@sauron.fi.intel.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 13:17:29 +0200
Message-ID: <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
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
> If the feature is not supported (the kernel is old), the tool will just
> return success and the kernel will just ignore max-beb-per1024, which is
> not very nice.
>
> It would be better if ubiattach complained like this instead:
>
> ubiattach error: your UBI driver does not allow changing the reserved
>                  PEBs count, probably you run old kernel? The support
>                  was added in kernel version 3.7.
yes, you're right, I'll change that.
Thanks,

Richard.
