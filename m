Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dz53b-0007Iy-Gq
 for linux-mtd@lists.infradead.org; Mon, 02 Oct 2017 18:03:09 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Doug Crawford <dcraw101@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ubifs robustness with early power cut warning
Date: Mon, 02 Oct 2017 20:03:16 +0200
Message-ID: <19830307.zslJMcUXK2@blindfold>
In-Reply-To: <CAAEsGzKDarv476=FW5dkKOt9-AD82miHdn1Ku59WAvdF-+qxzQ@mail.gmail.com>
References: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
 <7850553.GNXqutYARo@blindfold>
 <CAAEsGzKDarv476=FW5dkKOt9-AD82miHdn1Ku59WAvdF-+qxzQ@mail.gmail.com>
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

Am Montag, 2. Oktober 2017, 19:33:01 CEST schrieb Doug Crawford:
> the freeze/thaw sounds like what I need.  I guess using the fsfreeze
> tool from util-linux would work?  Is all of that implemented in the
> VFS layer?  I see some recent patches for adding UBIFS specific
> freeze/thaw functionality?

Currently UBIFS does not support freeze/thaw.
But adding this feature shouldn't be a big deal.

On the other hand, if your application behaves correctly power-cut would
never cause data loss.
If you do, UBIFS or the MTD driver are buggy.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
