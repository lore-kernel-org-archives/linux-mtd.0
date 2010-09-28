Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0f0l-0002sg-Bh
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 18:34:45 +0000
Received: by bwz19 with SMTP id 19so6034237bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2010 11:34:41 -0700 (PDT)
Subject: Re: RE : UBI/UBIFS interrupted write page handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4CA2129D.3070703@parrot.com>
References: <4C88DDD5.4060507@parrot.com>
	<1284054669.11335.21.camel@brekeke> <1285006478.1762.1.camel@brekeke>
	<4C9B7CD8.4070806@parrot.com>,<1285266914.1766.1.camel@brekeke>
	<F5C24FC168F95048BB6B9E0B13EB33152BA6F5304E@DIAMANT.xi-lite.lan>
	<1285523911.1776.9.camel@brekeke> <1285657088.2437.23.camel@localhost>
	<4CA19DAE.7030402@parrot.com> <1285660934.2437.44.camel@localhost>
	<4CA2129D.3070703@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 21:34:38 +0300
Message-ID: <1285698878.1776.10.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-28 at 18:06 +0200, Matthieu CASTET wrote:
> > Also I wanted to add re-try logic to UBI read path, so that we could try
> > to read several times if there is an ECC errors, because as you pointed,
> > re-trying sometimes helps. However, this also needs a fix in mtd, which
> > is currently in my l2 tree:
> > http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/755e723d39ac6975e6488298e129284e30d74823
> > 
> So this one need a manual merge ? Can't you include in ubi-2.6 ?

It is actually in the ubi-2.6.git / master as well.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
