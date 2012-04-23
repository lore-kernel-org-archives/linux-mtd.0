Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMMqp-0002Lh-O8
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 17:15:00 +0000
Message-ID: <4F958E0A.1010900@newsguy.com>
Date: Mon, 23 Apr 2012 10:14:50 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read, write}_page
 interfaces
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
 <4F8D20C4.9010607@parrot.com>
 <CAN8TOE8d8w6EQZkF8hgBqzgY-Q80gb=wSwUijFjt2sq+7mqC8g@mail.gmail.com>
 <4F904238.4070600@newsguy.com>
 <CAN8TOE_u9or8b+ZapRqD8XwV8abUDNXBtmAeBwDNiZ8aAs-Mdw@mail.gmail.com>
 <20120422105844.7f131f90@pixies.home.jungo.com>
 <CABYn4sy6fOEMwF_Gj24HdnaR55Sf1cFftT=JA-2PPSU1+zFjYA@mail.gmail.com>
In-Reply-To: <CABYn4sy6fOEMwF_Gj24HdnaR55Sf1cFftT=JA-2PPSU1+zFjYA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, prabhakar@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/23/2012 02:14 AM, Bastian Hecht wrote:
> 
> Following this thread, I wondered how mtd_write_oob is meant to work.
> The sh_flctl code simply writes the OOB data 1 to 1 into the oob area
> of the nand chip when using hardware ECC. So when reading this, it
> should result in a corrupted page. Is the driver meant to OR the ECC
> code to the buffer? Then the driver would need a page read and write
> it back applying the oob data, no?


Good question.  I would guess that one-to-one placement is probably only
appropriate for MTD_OPS_RAW.

Mike
