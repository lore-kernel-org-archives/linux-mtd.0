Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKLoY-0005WG-Jz
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 03:44:22 +0000
Received: by ggnk1 with SMTP id k1so3888326ggn.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Apr 2012 20:44:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4F8D20C4.9010607@parrot.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
 <4F8D20C4.9010607@parrot.com>
Date: Tue, 17 Apr 2012 20:44:11 -0700
Message-ID: <CAN8TOE8d8w6EQZkF8hgBqzgY-Q80gb=wSwUijFjt2sq+7mqC8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read,
 write}_page interfaces
From: Brian Norris <computersforpeace@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Viresh Kumar <viresh.kumar@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Vipin Kumar <vipin.kumar@st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Lei Wen <leiwen@marvell.com>,
 Jamie Iles <jamie@jamieiles.com>, Mike Dunn <mikedunn@newsguy.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Bastian Hecht <hechtb@gmail.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthieu,

On Tue, Apr 17, 2012 at 12:50 AM, Matthieu CASTET
<matthieu.castet@parrot.com> wrote:
> Brian Norris a =E9crit :
>> New NAND controllers can perform read/write via HW engines which don't e=
xpose
>> OOB data in their DMA mode. To reflect this, we should rework the nand_c=
hip /
>> nand_ecc_ctrl interfaces that assume that drivers will always read/write=
 OOB
>> data in the nand_chip.oob_poi buffer. A better interface would pass the
>> appropriate buffer explicitly when OOB data is requested and otherwise p=
ass a
>> NULL pointer, meaning that no OOB data is needed.
>
> If I understand correctly you propose that these driver will fetch oob (v=
ia pio
> mode) only when needed ?

Sure, that's the idea.

> Do you have an example of such controller ?

Yes. I'm working with a new ASIC which has a DMA mode as well as a PIO
mode. For DMA transactions (the preferred interface), I fill out a
64-byte descriptor (format specified below) then point the controller
to that DRAM address via a register. The "command" field only supports
page program, page read, and block erase, though.

So for instance, if I want to perform a page program, I can only
specify a single buffer (via dram_addr/dram_addr_ext) for the in-band
data; the OOB data is automatically filled with 0xFF + HW ECC
(calculated on the fly, internally, by HW controller). And on page
read, I only receive the in-band data in my DRAM buffer.

Now, in future revisions of this ASIC, it may be possible to access
OOB via DMA as well, but even if this happens, it doesn't make a lot
of sense on this hardware to *always* pull OOB data. As mentioned
previously, most normal applications (i.e., UBI(FS)) don't need to
access this OOB data at all, so it seems silly to go to extra work to
have the DMA controller return it to the MTD/NAND layers. I'm not
familiar with the OOB/ECC schemes on enough other hardware to
determine whether other drivers could make use of this same
optimization. It would require hardware with internal buffers for
error correction and an access mode that easily returns page data
only...

Brian

struct nand_dma_desc {
       __le32 next_desc;
       __le32 next_desc_ext;
       u8 type_E;
       u8 irq_swap;
       u8 __pad1;
       u8 command;
       __le32 dram_addr;
       __le32 dram_addr_ext;
       __le32 tfr_len;
       __le32 total_len;
       __le32 flash_addr;
       __le32 flash_addr_ext;
       __le32 cs;
       u32 __pad[5];
       u8 valid;
       u8 ecc_status;
       u8 flash_status;
       u8 dma_status;
} __attribute__((packed));
