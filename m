Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OfmXS-0004oy-Mz
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2010 04:22:11 +0000
Received: by fxm3 with SMTP id 3so1852312fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 01 Aug 2010 21:22:08 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <AANLkTikgmnRZHwN64xCFaO7F71xHaGXWo3WZ62u4939u@mail.gmail.com>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<AANLkTimY5d6_koSrmg7Ser0O1SveWCBpYs76tEqd3GaX@mail.gmail.com>
	<1280506337.2826.1.camel@localhost.localdomain>
	<AANLkTikgmnRZHwN64xCFaO7F71xHaGXWo3WZ62u4939u@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 02 Aug 2010 07:22:04 +0300
Message-Id: <1280722924.4363.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-07-30 at 13:51 -0400, Matthew L. Creech wrote:
> On Fri, Jul 30, 2010 at 12:12 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > Something like this, I guess, would be good enough?
> >
> ...
> > + *   o if this is a new UBI image, then just print the warning
> > + *   o if this is an UBI image which has already been used for some time, print
> > + *     a warning only if we can reserve less than 10% of the expected amount of
> > + *     the reserved PEB.
> > + *
> > + * The idea is that when UBI is used, PEBs become bad, and the reserved pool
> > + * of PEBs becomes smaller, which is normal and we do not want to scare users
> > + * with a warning every time they attach the MTD device. This was an issue
> > + * reported by real users.
> 
> This sounds like a good compromise to me.  I was wondering whether
> we'd still want to warn in the case in which nearly all of the reserve
> PEBs had been exhausted, and using a 10% threshold seems like a good
> way to accomplish that without scaring others unnecessarily.  :)

Pushed this patch to ubi-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
