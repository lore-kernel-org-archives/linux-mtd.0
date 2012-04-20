Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLBlO-00030m-LO
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 11:12:31 +0000
Received: by lbol5 with SMTP id l5so2355335lbo.36
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2012 04:12:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1334915328-10673-1-git-send-email-ivan.djelic@parrot.com>
References: <1334915328-10673-1-git-send-email-ivan.djelic@parrot.com>
Date: Fri, 20 Apr 2012 14:12:27 +0300
Message-ID: <CANOLnOOjrZEbPByOD3EQTZ3vn2ZO0SMdyYo1oME_NLRyYciXUQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: omap: add support for hardware BCH ecc
From: Grazvydas Ignotas <notasas@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Jan Weitzel <J.Weitzel@phytec.de>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 20, 2012 at 12:48 PM, Ivan Djelic <ivan.djelic@parrot.com> wrot=
e:
> Hello,
> This patch provides hardware NAND BCH ecc support for OMAP3 boards.
> It depends on the following patches:
>
> new GPMC BCH api (linux-omap):
> http://lists.infradead.org/pipermail/linux-mtd/2012-April/040757.html
>
> race condition fix in OMAP mtd driver:
> http://lists.infradead.org/pipermail/linux-mtd/2012-April/040724.html

I don't have this one in my mailbox (looked up through the archives),
so commenting about it here. What about just dropping omap_wait()
instead? I think gpmc_nand_read(.. GPMC_NAND_DATA) is equivalent to
ordinary data read, knowing that omap_wait() looks like a duplicate of
generic nand_wait(), just without LED support.


--=20
Gra=C5=BEvydas
