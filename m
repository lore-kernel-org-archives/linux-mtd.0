Received: from moutng.kundenserver.de ([212.227.126.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KSdb6-0007nE-JI
	for linux-mtd@lists.infradead.org; Mon, 11 Aug 2008 20:02:32 +0000
From: Stefan Roese <sr@denx.de>
To: u-boot@lists.denx.de
Subject: Re: [U-Boot] U-Boot and UBI
Date: Mon, 11 Aug 2008 22:02:24 +0200
References: <1218220016.2328.109.camel@localhost.localdomain>
	<20080808225824.138D3248BF@gemini.denx.de>
	<9c9fda240808102218y6461fb6el192dcff7e47c2536@mail.gmail.com>
In-Reply-To: <9c9fda240808102218y6461fb6el192dcff7e47c2536@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808112202.24363.sr@denx.de>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-mtd@lists.infradead.org,
	arnez@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 11 August 2008, Kyungmin Park wrote:
> Actually the Samsung implemented the UBI support on U-boot already and
> has used it internally. The big difference is the code base. It's
> based on kernel UBI code. Yes it's not fit well to u-boot ecosystem so
> it created the ubi wrapper for u-boot.

And how does NAND/OneNAND booting with UBI support fit into this? I assume 
that you have some size restrictions for the IPL/SPL on your platforms as 
well.

<snip>

> I want to know what's the better way if there are two code bases.
>
> Please give any options and comments

As Josh already mentioned, your version might be better suited as a basis for 
mainline inclusion because its more feature complete and probably is for a 
newer U-Boot version.

So best would be to publish your UBI support too, then we can compare and 
decide where to go.

> Thank you,
> Kyungmin Park
>
> P.S., we will post the patches ASAP

Do you have a rough idea when you could publish your patches?

Thanks.

Best regards,
Stefan

=====================================================================
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
=====================================================================
