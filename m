Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qalsk-00053u-L0
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 09:43:59 +0000
Received: by bwf12 with SMTP id 12so1061192bwf.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 02:43:48 -0700 (PDT)
Subject: Re: linux-next: Tree for June 24 (mtd + of)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Likely <grant.likely@secretlab.ca>, Dmitry Eremin-Solenikov
	<dbaryshkov@gmail.com>
Date: Sun, 26 Jun 2011 12:43:41 +0300
In-Reply-To: <BANLkTi=Q-7bCHaH+-z6gnbwvexpGLYH6pA@mail.gmail.com>
References: <20110624155822.cb8cf6eb.sfr@canb.auug.org.au>
	<20110624090456.191f1fda.randy.dunlap@oracle.com>
	<1308947172.13493.37.camel@koala> <4E04F5D0.9090900@oracle.com>
	<1308983721.23868.2.camel@koala>
	<20110625152009.f264be78.randy.dunlap@oracle.com>
	<BANLkTi=Q-7bCHaH+-z6gnbwvexpGLYH6pA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1309081426.6618.0.camel@koala>
Mime-Version: 1.0
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, Vitaly Wool <vwool@ru.mvista.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-06-26 at 00:11 -0600, Grant Likely wrote:
> > 3.0-rc4 does not have this build error when I use the .config file with it...
> > however, I think that 3.0-rc4 also does not build ofpart.ko as it should.
> >
> > Looks to me like changes in drivers/mtd/{Kconfig && Makefile} caused this
> > build error.
> 
> The following commit in linux-next appears to be the culprit:
> 
> commit 1a6bc893044b961caae1c5a9c6c2065e608da427
> Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Date:   Sun May 29 21:32:33 2011 +0400
> 
>     mtd: prepare to convert of_mtd_parse_partitions to partition parser
> 
>     Prepare to convert of_mtd_parse_partitions() to usual partitions parser:
>     1) Register ofpart parser
>     2) Internally don't use passed device for error printing
>     3) Add device_node to mtd_part_parser_data struct
>     4) Move of_mtd_parse_partitions from __devinit to common text section
>     5) add ofpart to the default list of partition parsers
> 
>     Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>     Signed-off-by: Artem Bityutskiy <dedekind1@gmail.com>
> 
> It adds a module_init() call to ofpart.c which does not work the way
> that ofpart.c is linked to mtdcore.o.  Seems like that commit series
> still needs work.

OK, let's ask Dmitry to take a look at this.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
