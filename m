Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or6MH-000863-Jc
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 09:45:26 +0000
Received: by gyg8 with SMTP id 8so78516gyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 02:45:23 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefani Seibold <stefani@seibold.net>
In-Reply-To: <1283410033.6920.30.camel@wall-e.seibold.net>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1280244117.3021.36.camel@localhost.localdomain>
	<1280296009.4310.5.camel@wall-e.seibold.net>
	<1282489456.16502.74.camel@brekeke>
	<1283256587.7515.16.camel@wall-e.seibold.net>
	<1283356077.2209.19.camel@brekeke>
	<1283410033.6920.30.camel@wall-e.seibold.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 12:45:18 +0300
Message-ID: <1283420718.1748.3.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Kreuzer, Michael \(NSN - DE/Ulm\)" <michael.kreuzer@nsn.com>,
	linux-mtd@lists.infradead.org, "Pagliari,
	Vivenzio \(NSN - DE/Ulm\)" <vivenzio.pagliari@nsn.com>,
	"Matthew L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-02 at 08:47 +0200, Stefani Seibold wrote:
> 
> That is the point! Panic or refuse to mount is not a good solution. If
> there is a way to mount the file system, than do it. Maybe read-only
> with a big fat warning, but this is better than nothing. This is like
> the ext3 fs, which handles this also in this way.
> 
> > In your case you have very strange corruption. We can apply your
> patch,
> > problem solved, but will you be 100% comfortable with this? There is
> a
> > chance that you have some issues which can later have different
> > symptoms. I am still interested to find out the real root reason.
> > 
> 
> No a will be not 100% comfortable with this, but it is better than
> nothing. I agree with you to fix the cause and not the symptoms, but
> may
> patch will help to get your data back in case of this bug. 

May be. I need some more time to think about this.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
