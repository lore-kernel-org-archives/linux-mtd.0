Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLrh8-0002lY-Tx
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 07:58:59 +0000
Received: by lagy4 with SMTP id y4so9494941lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 00:58:50 -0700 (PDT)
Date: Sun, 22 Apr 2012 10:58:44 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, Mike Dunn
 <mikedunn@newsguy.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read,
 write}_page interfaces
Message-ID: <20120422105844.7f131f90@pixies.home.jungo.com>
In-Reply-To: <CAN8TOE_u9or8b+ZapRqD8XwV8abUDNXBtmAeBwDNiZ8aAs-Mdw@mail.gmail.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
 <4F8D20C4.9010607@parrot.com>
 <CAN8TOE8d8w6EQZkF8hgBqzgY-Q80gb=wSwUijFjt2sq+7mqC8g@mail.gmail.com>
 <4F904238.4070600@newsguy.com>
 <CAN8TOE_u9or8b+ZapRqD8XwV8abUDNXBtmAeBwDNiZ8aAs-Mdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 prabhakar@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 19 Apr 2012 15:06:33 -0700 Brian Norris <computersforpeace@gmail.co=
m> wrote:
> On Thu, Apr 19, 2012 at 9:50 AM, Mike Dunn <mikedunn@newsguy.com> wrote:
> > On 04/17/2012 08:44 PM, Brian Norris wrote:
> >
> >> Now, in future revisions of this ASIC, it may be possible to access
> >> OOB via DMA as well, but even if this happens, it doesn't make a lot
> >> of sense on this hardware to *always* pull OOB data.
> >
> >
> > No, it doesn't. In fact, I'm not aware of any code within or on top of =
mtd that
> > does anything with the oob data when a page is read.  If oob is needed,
> > mtd_read_oob() is used.
>=20
> I guess this may not be an issue for page read, but I know one use for
> write_page data+OOB. MLC NAND, for instance, requires that you write
> *once* to a page, so I introduced ioctl(MEMWRITE) which generically
> allows page, OOB, or both to be written. This trickles down to the
> nand_ecc_ctrl.write_page function, I think. There are probably other
> cases that I'm not really thinking of right now.

=46rom MTD user's perspective, mtd_read() and mtd_write() interfaces
do not expose the OOB to the user at all.

OTHO, mtd_read_oob() and mtd_write_oob() allow the user to read/write
either the OOB on its own (NULL 'ops->datbuf'), or the page data along
with its accompanying OOB (non-null 'ops->datbuf' and 'ops->oobbuf').

There are few users of the mtd_read_oob/mtd_write_oob interfaces that
provide a non-null 'ops->datbuf':
- nand_bbt.c
- MEMWRITE mtdchar ioctl
- mtdswap.c
- sm_ftl.c
- yaffs2 (out-of-tree)

Regards,
Shmulik
