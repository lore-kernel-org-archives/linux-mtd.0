Received: from extern.plris.com ([212.199.10.23] helo=plris.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WT8ps-0003Jg-F1
 for linux-mtd@lists.infradead.org; Thu, 27 Mar 2014 11:51:05 +0000
Received: from leonp.plris.com (leonp.plris.com [192.168.50.57])
 by plris.com (Postfix) with ESMTP id C827AA8344
 for <linux-mtd@lists.infradead.org>; Thu, 27 Mar 2014 13:50:38 +0200 (IST)
From: Leon Pollak <leonp@plris.com>
To: linux-mtd@lists.infradead.org
Subject: Re: What is wrong?
Date: Thu, 27 Mar 2014 13:50:38 +0200
Message-ID: <2149088.qdEVfg3R4h@leonp.plris.com>
In-Reply-To: <20140304083325.GJ13420@norris-Latitude-E6410>
References: <4315632.KkRm7kzq26@leonp.plris.com>
 <20140303211336.GA7369@gmail.com>
 <20140304083325.GJ13420@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian, hello.

I am a bit more free now and wish to solve the issue.
I am a bit confused now - what should I try to test? Can you help me.

Many hanks ahead.

On Tuesday 04 March 2014 00:33:25 Brian Norris wrote:
> On Mon, Mar 03, 2014 at 03:13:36PM -0600, Andrew Ruder wrote:
> > On Thu, Feb 27, 2014 at 01:22:08PM -0800, Brian Norris wrote:
> > > Perhaps Richard or Andrew can comment on whether this patch should
> > > help you. But I think JFFS2 on NAND uses write-buffered support
> > > which can be affected by this bug.
> > 
> > Definitely sounds like the same issue and I'm kind of glad to see it
> > crop up in another filesystem.
> 
> We haven't confirmed that the *patch* actually affects Leon's problem;
> just that if he runs an additional 'sync' it solves his problem.
> Leon, did you get to try the patch?
> 
> Anyway, should commit 807612db2f9940b9fa6deaef054eb16d51bd3e00 be
> marked for -stable?
> 
> Brian
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Leon
