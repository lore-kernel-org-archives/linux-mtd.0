Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1ZQc-0003sp-Ks
 for linux-mtd@lists.infradead.org; Mon, 30 Jun 2014 11:07:19 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: David Jander <david.jander@protonic.nl>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [FRC] [PATCH] MTD: nand_base.c: Enable support for Samsung
 E-die SLC NAND
Date: Mon, 30 Jun 2014 11:06:39 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAF856A@DBDE04.ent.ti.com>
References: <1403259137-22171-1-git-send-email-david@protonic.nl>
 <CAE94FHELXgoZ9Jm1E3_YT6D1SB=VAGWthZSjbsR+qqkUWn97PA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF6A08@DBDE04.ent.ti.com>
 <CAE94FHGNHDVygoviGgEtE2ZDyumjwa73tZiDnEBdSnnWCE03YQ@mail.gmail.com>
 <CAE94FHFvCoZyawRC=LL+PdBR3ig10crKJN6c_M_q=yGdOXnR9A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF7560@DBDE04.ent.ti.com>
 <20140625133129.060cd535@archvile>
 <20980858CB6D3A4BAE95CA194937D5E73EAF7689@DBDE04.ent.ti.com>
 <20140625141133.247d62a3@archvile>
In-Reply-To: <20140625141133.247d62a3@archvile>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Ted Juan <ted.juan@gmail.com>,
 "sjhill@realitydiluted.com" <sjhill@realitydiluted.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

>From: David Jander [mailto:david.jander@protonic.nl]
[...]
>
>P.S.: Anyone care to give comment on my patch? Not that you two effectivel=
y
>hijacked this thread for only slightly tangentially related issues... ;-)
>
Sorry for diverting from the main patch discussion, somehow I'm unable to
find the original PATCH email from mtd-list.
As per Samsung Device (K9F1G08U0E) datasheet, which is
"1Gb E-die SLC NAND Flash". This device support 'Random Input' (0x85) comma=
nd.
This means driver can change the column-address during page-program
operation and write to any partial page in between. Isn't that sufficient
to support subpage writes ?

Earlier implementation of nand_write_subpage_hwecc() has some limitations,
I have recently sent a patch-series [1] which uses alternate approach, can =
you
check if subpage writes work with this.
Also which controller driver are you using for this device ? There may be s=
ome
controller limitation too, prohibiting use of subpages.


with regards, pekon

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-June/054446.html
