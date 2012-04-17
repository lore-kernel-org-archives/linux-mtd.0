Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SK3BL-0007CJ-Jh
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2012 07:50:36 +0000
Message-ID: <4F8D20C4.9010607@parrot.com>
Date: Tue, 17 Apr 2012 09:50:28 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read, write}_page
 interfaces
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
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
 Armando Visconti <armando.visconti@st.com>, Liu Shuo <b35362@freescale.com>,
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

Brian Norris a écrit :
> New NAND controllers can perform read/write via HW engines which don't expose
> OOB data in their DMA mode. To reflect this, we should rework the nand_chip /
> nand_ecc_ctrl interfaces that assume that drivers will always read/write OOB
> data in the nand_chip.oob_poi buffer. A better interface would pass the
> appropriate buffer explicitly when OOB data is requested and otherwise pass a
> NULL pointer, meaning that no OOB data is needed.

If I understand correctly you propose that these driver will fetch oob (via pio
mode) only when needed ?
Do you have an example of such controller ?

Matthieu
