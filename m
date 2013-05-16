Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcsS2-0001c2-MT
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 07:18:11 +0000
Message-ID: <1368688777.15764.175.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 0/4] Export the ecc step size to user applications
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Thu, 16 May 2013 10:19:37 +0300
In-Reply-To: <CAMiH66GygmwvfZrwys7RoeoY4Q_fFkfbiZF_pJN4RxQBPaz0fw@mail.gmail.com>
References: <1368607606-4344-1-git-send-email-b32955@freescale.com>
 <1368619642.15764.96.camel@sauron.fi.intel.com>
 <CAMiH66GygmwvfZrwys7RoeoY4Q_fFkfbiZF_pJN4RxQBPaz0fw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-15 at 22:19 +0800, Huang Shijie wrote:
> ok.   can i send a separate patch to fix it?
> or a new version patch set？
> 
Just a follow-up patch. I would like to let this patch-set sit in the
mailing list for some time before I pick it, in case someone wants to
comment.

Also, surely the things you expose are the real ECC step and ECC
strength? I think the datasheet ones in your other patch-set should be
named differently to make sure the reader of the code understands that
they are only the recommended datasheet values, not necessarily the
values which are actually in use.

-- 
Best Regards,
Artem Bityutskiy
