Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fKsKp-0006Hl-Ok
 for linux-mtd@lists.infradead.org; Mon, 21 May 2018 21:27:17 +0000
From: Richard Weinberger <richard@nod.at>
To: Ritesh Harjani <riteshh@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
Subject: Re: Selabel/selinux support in mtd-utils for ubifs
Date: Mon, 21 May 2018 23:26:53 +0200
Message-ID: <1707195.VuFK1zXW7D@blindfold>
In-Reply-To: <d1fc48d2-ee16-2405-bf4d-a75ea8cd5f46@codeaurora.org>
References: <d1fc48d2-ee16-2405-bf4d-a75ea8cd5f46@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ritesh,

Am Montag, 21. Mai 2018, 13:47:53 CEST schrieb Ritesh Harjani:
> Hello all,
> 
> Could anyone please help whether selinux support is fully present on 
> ubifs or not?
> 
> Below are my observations:-
> 1. Selinux support was added in ubifs kernel via below patch
> "UBIFS: Add security.* XATTR support for the UBIFS"
> 
> 2. Extended attribute support was added in mtd-utils via below patch.
> "mkfs.ubifs: Add extended attribute support"
> 
> With above I think that selinux could be enabled but only at the boot 
> time using selinux tools.

Yes.

> But I could not see any support to add selinux labels/context 
> information while creating ubifs.img in mtd-utils. I do see below link 
> where something like above was tried but never made upstream. Could 
> anyone please give pointers on whether this support is added/ or bring 
> worked upon?
> 
> http://lists.infradead.org/pipermail/linux-mtd/2014-February/052136.html
> 
> Also Whether selinux labeling support can be added in the mkfs.ubifs or 
> not? Do we see any issues with this?

No, just revive the patches.
In 2014 the maintainer situation was different and sadly we forgot about some
patches.
 
> I would like to work upon adding selinux support in mtd-utils.

This would be wonderful!

> I would appreciate if I could get some pointers on above queries and if 
> anyone has any pointers/suggestions for this.

Just go ahead. :-)

Thanks,
//richard
