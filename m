Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KSrpz-00072Q-2x
	for linux-mtd@lists.infradead.org; Tue, 12 Aug 2008 11:14:51 +0000
From: Stefan Roese <sr@denx.de>
To: "Kyungmin Park" <kmpark@infradead.org>
Subject: Re: [U-Boot] U-Boot and UBI
Date: Tue, 12 Aug 2008 13:11:26 +0200
References: <1218220016.2328.109.camel@localhost.localdomain>
	<200808112202.24363.sr@denx.de>
	<9c9fda240808120325va530f61q13b4836f9b8202b5@mail.gmail.com>
In-Reply-To: <9c9fda240808120325va530f61q13b4836f9b8202b5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808121311.27026.sr@denx.de>
Cc: u-boot@lists.denx.de, linux-mtd@lists.infradead.org, arnez@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 12 August 2008, Kyungmin Park wrote:
> > On Monday 11 August 2008, Kyungmin Park wrote:
> >> Actually the Samsung implemented the UBI support on U-boot already and
> >> has used it internally. The big difference is the code base. It's
> >> based on kernel UBI code. Yes it's not fit well to u-boot ecosystem so
> >> it created the ubi wrapper for u-boot.
> >
> > And how does NAND/OneNAND booting with UBI support fit into this? I
> > assume that you have some size restrictions for the IPL/SPL on your
> > platforms as well.
>
> It's not yet covered. it's TODO

I see.

> Anyway, here's UBI patch.
> The real implementation was done by another board but to publish I
> make a patch for apollon board for usage. (tested and verified)
>
> As see it's all-in-one patch and contains several parts, apollon
> board, OneNAND, mtdpartition, and UBI.

Thanks. Really appreciated.

> After the feedback, I will generate right patches for purpose.
>
> Please give any comments and feedbacks

Will come... :)

Best regards,
Stefan

=====================================================================
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
=====================================================================
