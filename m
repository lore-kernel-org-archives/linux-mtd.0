Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4A6O-0007LD-BT
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 12:32:05 +0000
Received: by weyr3 with SMTP id r3so589426wey.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 05:32:02 -0700 (PDT)
Date: Wed, 22 Aug 2012 15:31:56 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
Message-ID: <20120822153156.258d8408@pixies.home.jungo.com>
In-Reply-To: <1345637715.2848.167.camel@sauron.fi.intel.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
 <1345635015.2848.150.camel@sauron.fi.intel.com>
 <1345635197.2848.152.camel@sauron.fi.intel.com>
 <20120822144751.5aa7f932@pixies.home.jungo.com>
 <1345637715.2848.167.camel@sauron.fi.intel.com>
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

On Wed, 22 Aug 2012 15:15:15 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2012-08-22 at 14:47 +0300, Shmulik Ladkani wrote:
> > But the ioctl might return -EINVAL due to any of the *other*
> > ubi_attach_req fields being invalid.
> > So you can't really determine whether max_beb_per1024 is supported.
> 
> We call the attach ioctl 2 times.
> 
> 1. Call it with bogus max_beb_per1024.
>    a) Success - print the warning and exit
>    b) Failure with non-EINVAL - overall failure.
>    c) Failure with -EINVAL, go to step 2.
> 
> 
> 2. Call with user-supplied max_beb_per1024.
>    a) Success - everything is fine, max_beb_per1024 is supported,
>       the first failure was because we passed max_beb_per1024=-1
>    b) Failure with non-EINVAL - overall failure.
>    b) Failure with -EINVAL, return error, the whole operation failed,
>       one of the parameters was incorrect.
> 
> Where is the flaw?

Sorry, this seems right. Should have given this more thought... will go
for some cofee.

Regards,
Shmulik
