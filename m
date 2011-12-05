Received: from mail.phycard.co.uk ([217.6.246.34] helo=root.phytec.de)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RXTeE-0002BR-RX
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 08:11:40 +0000
Subject: Re: [PATCH] mdt nand: omap2+ use platform options
From: Jan Weitzel <J.Weitzel@phytec.de>
To: Grazvydas Ignotas <notasas@gmail.com>
In-Reply-To: <CANOLnOOE3a0BP0TcLnRAmq5YAiHLZTpkbriDh9WtkkBT7TotFA@mail.gmail.com>
References: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
 <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
 <1322728943.2332.13.camel@koala>
 <CANOLnOOE3a0BP0TcLnRAmq5YAiHLZTpkbriDh9WtkkBT7TotFA@mail.gmail.com>
Date: Mon, 05 Dec 2011 09:11:17 +0100
Message-ID: <1323072677.12068.5.camel@lws-weitzel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"
Cc: linux-omap@vger.kernel.org, dedekind1@gmail.com, dedekind@infradead.org,
 linux-mtd@lists.infradead.org, tglx@linutronix.de, computersforpeace@gmail.com
Reply-To: J.Weitzel@phytec.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, den 02.12.2011, 12:20 +0200 schrieb Grazvydas Ignotas:
> On Thu, Dec 1, 2011 at 10:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2011-11-29 at 10:00 +0100, Jan Weitzel wrote:
> >> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
> >
> > Pushed to l2-mtd-2.6.git, thank you!
> 
> This breaks build here, did you really test it, Jan?
Sorry, I wasn't carefully enough. I missed 7a559c78 where you removed
options from struct omap_nand_platform_data. Did you think getting we
should reintroduce it? I am looking for a good way to get
NAND_NO_SUBPAGE_WRITE from boardfile to driver.
Jan
> drivers/mtd/nand/omap2.c: In function 'omap_nand_probe':
> drivers/mtd/nand/omap2.c:1078: error: 'struct omap_nand_platform_data'
> has no member named 'options'
> 
> 
