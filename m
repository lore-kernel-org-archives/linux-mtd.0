Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVc5U-0006Sp-IW
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 12:20:35 +0000
Date: Wed, 20 Jun 2018 14:19:36 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] mtd: cfi_cmdset_0002: Avoid walking all chips
 when unlocking.
Message-ID: <20180620141936.1f79cd10@bbrezillon>
In-Reply-To: <c5c50ddf2e99950dd790a264a5f40eb6e1647a83.camel@infinera.com>
References: <20180605172607.50acb34f@bbrezillon>
 <20180606101330.11071-1-joakim.tjernlund@infinera.com>
 <20180606101330.11071-4-joakim.tjernlund@infinera.com>
 <20180620112503.26572cf1@bbrezillon>
 <c5c50ddf2e99950dd790a264a5f40eb6e1647a83.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 Jun 2018 11:10:49 +0000
Joakim Tjernlund <Joakim.Tjernlund@infinera.com> wrote:

> On Wed, 2018-06-20 at 11:25 +0200, Boris Brezillon wrote:
> > 
> > 
> > On Wed,  6 Jun 2018 12:13:30 +0200
> > Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote:
> >   
> > > cfi_ppb_unlock() walks all flash chips when unlocking sectors,
> > > avoid walking chips unaffected by the unlock operation.
> > > 
> > > Fixes: 1648eaaa1575 ("mtd: cfi_cmdset_0002: Support Persistent Protection Bits (PPB) locking")
> > > Cc: stable@vger.kernel.org  
> > 
> > That's clearly not a fix, just an optimization. You should drop the
> > Fixes and Cc-stable tags.  
> 
> It sure IS! The code never intended to do this and it is just bad luck that nothing bad
> happened and I sure don't want to walk all 4 chips we have, stealing CPU and keeping the
> flash busy just because I am using stable.

Except it's like that from the beginning, so that's not a regression
you're fixing nor it is a real bug preventing you from using the driver
on your platform. I'm not making the rules of what is appropriate to be
backported and what is not, but I've been told several times that only
patches fixing bugs or perf regressions are supposed to be backported,
and that's not the case here.

> 
> Given I have moved on now and we disagree, I will not reword and resubmit any
> time soon. Feel free to do needed edits though.

I'm sorry, maybe you don't like it but that's the process. I understand
that it's not pleasant to have to send a new version of patches that
you thought were good enough to go upstream, but it's like that. If I
don't apply this rule to you, why should it apply to others.
