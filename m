Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMFM1-0000lb-BN
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 09:14:42 +0000
Received: by lbol5 with SMTP id l5so4075180lbo.36
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2012 02:14:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120422105844.7f131f90@pixies.home.jungo.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
 <4F8D20C4.9010607@parrot.com>
 <CAN8TOE8d8w6EQZkF8hgBqzgY-Q80gb=wSwUijFjt2sq+7mqC8g@mail.gmail.com>
 <4F904238.4070600@newsguy.com>
 <CAN8TOE_u9or8b+ZapRqD8XwV8abUDNXBtmAeBwDNiZ8aAs-Mdw@mail.gmail.com>
 <20120422105844.7f131f90@pixies.home.jungo.com>
Date: Mon, 23 Apr 2012 11:14:39 +0200
Message-ID: <CABYn4sy6fOEMwF_Gj24HdnaR55Sf1cFftT=JA-2PPSU1+zFjYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read,
 write}_page interfaces
From: Bastian Hecht <hechtb@googlemail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 prabhakar@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/4/22 Shmulik Ladkani <shmulik.ladkani@gmail.com>:
> On Thu, 19 Apr 2012 15:06:33 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
>> On Thu, Apr 19, 2012 at 9:50 AM, Mike Dunn <mikedunn@newsguy.com> wrote:
>> > On 04/17/2012 08:44 PM, Brian Norris wrote:
>> I guess this may not be an issue for page read, but I know one use for
>> write_page data+OOB. MLC NAND, for instance, requires that you write
>> *once* to a page, so I introduced ioctl(MEMWRITE) which generically
>> allows page, OOB, or both to be written. This trickles down to the
>> nand_ecc_ctrl.write_page function, I think. There are probably other
>> cases that I'm not really thinking of right now.
>
> From MTD user's perspective, mtd_read() and mtd_write() interfaces
> do not expose the OOB to the user at all.
>
> OTHO, mtd_read_oob() and mtd_write_oob() allow the user to read/write
> either the OOB on its own (NULL 'ops->datbuf'), or the page data along
> with its accompanying OOB (non-null 'ops->datbuf' and 'ops->oobbuf').
>
> There are few users of the mtd_read_oob/mtd_write_oob interfaces that
> provide a non-null 'ops->datbuf':
> - nand_bbt.c
> - MEMWRITE mtdchar ioctl
> - mtdswap.c
> - sm_ftl.c
> - yaffs2 (out-of-tree)

Following this thread, I wondered how mtd_write_oob is meant to work.
The sh_flctl code simply writes the OOB data 1 to 1 into the oob area
of the nand chip when using hardware ECC. So when reading this, it
should result in a corrupted page. Is the driver meant to OR the ECC
code to the buffer? Then the driver would need a page read and write
it back applying the oob data, no?

Best regards,

 Bastian Hecht

> Regards,
> Shmulik
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
