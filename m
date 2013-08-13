Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V92Qe-0001as-MO
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 00:25:41 +0000
Received: by mail-pd0-f173.google.com with SMTP id p10so4130204pdj.32
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 17:25:16 -0700 (PDT)
Date: Mon, 12 Aug 2013 17:25:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 3/6] mtd: set the ecc step size for master/slave
 mtd_info
Message-ID: <20130813002512.GC7267@brian-ubuntu>
References: <1376285092-19683-1-git-send-email-b32955@freescale.com>
 <1376285092-19683-4-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2A32@DBDE04.ent.ti.com>
 <52089C91.4090903@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2B57@DBDE04.ent.ti.com>
 <5208AE99.6020508@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5208AE99.6020508@freescale.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 05:44:57PM +0800, Huang Shijie wrote:
> 于 2013年08月12日 17:24, Gupta, Pekon 写道:
> >[Pekon]: Following Artem's recommendations.. Can this be named as
> >chip->ecc.size = ecc_step_size.
> >then chip->ecc.bytes  = ecc_syndrome_size (or ecc_code_size)
> yes, we can rename these fields in the future with another patch set.

Internal naming can be changed in the future if needed, but we really
need to get a good sysfs name now, since that becomes ABI. And it would
also be good to get this to be clearly consistent internally too.

So the main decision to be made here: what to name the sysfs field? It
currently stands as ecc_step, but for clarity to users (and for avoiding
internal confusion with nand_chip.ecc.steps), I think ecc_step_size is
just as good or better.

Then, we might as well have the mtd_info field be
mtd_info.ecc_step_size. So we would have the following names.

For ECC step size:

  /sys/class/mtd/mtdX/ecc_step_size
  mtd_info.ecc_step_size
  nand_chip.ecc.size    <--- candidate for renaming to ...ecc.step_size

For ECC strength:

  /sys/class/mtd/mtdX/ecc_strength
  mtd_info.ecc_strength
  nand_chip.ecc.strength

Other fields to consider for internal naming:

  # Number of ECC steps per page
  nand_chip.ecc.steps

  # Number of ECC bytes per ECC step
  nand_chip.ecc.bytes

Please, let's get an agreement on one of these, so we hopefully only
need at most a v4 patch series:

(1) Huang's current patch set (v3)
(2) My proposed naming above
(3) A third option? (AFAICT, (1) or (2) should be satisfactory)

If we go with (2), the v4 patch series only needs to take care of the
new sysfs naming (plus documentation) and the new mtd_info field naming.
Any internal consistency patches (e.g., for nand_ecc_ctrl) can come as
follow-ups.

> >In addition, chip->ecc.bytes should also be helpful for userspace
> >utility to determine how much bytes to reserve in spare-area for ECC.
> >So exposing that as sysfs entry is also good.
> >
> I do not need the chip->ecc.bytes. :)
> For me, export the chip->ecc.size is enough.

A better argument against this is that ecc.bytes does not necessarily
have utility across many types of NAND drivers by itself, since ECC
layouts differ. And at that point, we're trying to duplicate the
behavior of ioctl(ECCGETLAYOUT) (which notably has run out of room and
isn't 100% informative anymore).

> So you can submit a patch if you need this field.

Yes, if you have good reason for exporting it, send a patch and a good
argument. And it would need to explain why we can't just use
ECCGETLAYOUT.

Brian
