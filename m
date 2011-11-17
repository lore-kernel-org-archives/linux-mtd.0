Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRAIc-000351-7t
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2011 22:19:15 +0000
Received: by mail-bw0-f49.google.com with SMTP id t2so3465222bka.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2011 14:19:13 -0800 (PST)
Subject: Re: [PATCH 0/2] small mtd-utils fixes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 18 Nov 2011 00:19:10 +0200
In-Reply-To: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321568352.2272.33.camel@koala>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-11-16 at 12:03 -0800, Brian Norris wrote:
> Speaking of releases: when will we make a new release? After kernel 3.2
> is final? Or perhaps a pre-3.2 and post-3.2 release? There are a lot of
> important fixes in git right now, and I'd like to incorporate them
> officially.

We can release it as soon as someone ask. Should I do this now?

> Also, note that the following commit was intended to be paired with the
> commits in the "brian" branch:
> 
>     commit bf01f2960ba82468b1b25f00e044fd0c3ee0770a
>     nandwrite: consolidate buffer usage
> 
> While it is functionally harmless, it does include an unnecessary
> memcpy(). In fact, the patch really is useful only when paired with the
> rest of the 'brian' branch, which is intended for kernels supporting
> ioctl(MEMWRITE) - i.e., kernel version >= 3.2.
> 
> So I recommend that the next release either includes the 'brian' branch
> or does not include commit bf01f2. Mike Frysinger and I discussed this
> issue on the ML earlier and didn't really come up with a solution that
> avoids the overhead both with and without MEMWRITE. I figure pre-3.2
> kernel users will just have to put up with it eventually.

Could you please refresh my memory and remind me about the brian branch?
Why we have it and what prevents us from merging it to the master
branch? There were some kernel changes which I was not sure about? But
now they are in Linus' tree so we can merge that branch and make a
release, right?

Artem.
