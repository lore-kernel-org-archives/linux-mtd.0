Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtiSV-0006BL-DH
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 20:45:36 +0000
Received: by pasz6 with SMTP id z6so28746757pas.2
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2015 12:45:14 -0800 (PST)
Date: Tue, 3 Nov 2015 12:45:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Renaud Barbier <renaud.barbier@ge.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: nand_flash_detect_onfi error
Message-ID: <20151103204511.GI7274@google.com>
References: <5638E074.5070800@ge.com>
 <CAAEAJfAjs0k26QumQdDzHeMGAM2s=xJw4E8N+yhs5GMCFkK=Aw@mail.gmail.com>
 <20151103212546.0184eaf6@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151103212546.0184eaf6@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 03, 2015 at 09:25:46PM +0100, Boris Brezillon wrote:
> On Tue, 3 Nov 2015 13:56:16 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> > On 3 November 2015 at 13:27, Renaud Barbier <renaud.barbier@ge.com> wrote:
> > > chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> > > for (i = 0; i < 3; i++) {
> > >         for (j = 0; j < sizeof(*p); j++)
> > >                 ((uint8_t *)p)[j] = chip->read_byte(mtd);
> > >         if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
> > >                         le16_to_cpu(p->crc)) {
> > >                 break;
> > >         }
> > > }
> > >
...
> BTW, I wonder why ->read_byte() is used instead of ->read_buf() here.

commit bd9c6e99b58255b9de1982711ac9487c9a2f18be
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Fri Nov 29 22:04:28 2013 -0800

    mtd: nand: don't use read_buf for 8-bit ONFI transfers

Brian
