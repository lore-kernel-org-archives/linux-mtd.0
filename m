Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGtwH-0005Y1-P1
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 15:54:18 +0000
Date: Wed, 26 Sep 2012 17:54:13 +0200
From: Richard Weinberger <richard@nod.at>
To: artem.bityutskiy@linux.intel.com
Subject: Re: [PATCH 01/10] UBI: Add fastmap on-flash data structures
Message-ID: <20120926175413.58a5c455@spider.haslach.nod.at>
In-Reply-To: <1348655591.24309.64.camel@sauron.fi.intel.com>
References: <1348511492-91606-1-git-send-email-richard@nod.at>
 <1348511492-91606-2-git-send-email-richard@nod.at>
 <1348655591.24309.64.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Am Wed, 26 Sep 2012 13:33:11 +0300
schrieb Artem Bityutskiy <artem.bityutskiy@linux.intel.com>:
> Richard, thanks, here is the deal I suggest
> 
> 1. I do not really have time to review this in details.
> 2. I do not want to block this either
> 3. I want to merge this to 3.7 with come pre-conditions (see below)
>    as "Experimental" with a claim that the on-flash format can
>    be changed. Something like Linus did for btrfs. Then let people
>    play with fastmap. I am sure it'll need changes when people
>    try to use it in production.
>    
>    a. Aiaiai is happy

sent you v19 where I've addresses all warnings from Aiaiai you mailed
me.

>    b. You provide a section for the mtd web site describing fastmap
>    c. It does not break anything when it is disabled
>    d. When it is enabled, it also passes the UBI tests
> 
> Actually, I want to expose it to linux-next already after step a.
> Despite a lot of testing you have already done, I am willing to do
> some testing myself as well, so I'll do c. and d. and let you know if
> there are issues.
> 
> Could you please do b. ?

Will do!
I'm fine with your plan.

Thanks,
//richard
