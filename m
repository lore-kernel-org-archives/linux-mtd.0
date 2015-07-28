Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK9dd-0004Ar-9x
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 18:30:06 +0000
From: Marek Vasut <marex@denx.de>
To: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH V6 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Tue, 28 Jul 2015 20:29:40 +0200
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Vikas MANOCHA <vikas.manocha@st.com>, linux-kernel@vger.kernel.org,
 Alan Tull <atull@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>
References: <1438105083-19738-1-git-send-email-grmoore@opensource.altera.com>
 <201507282007.56506.marex@denx.de> <55B7C84D.5040104@opensource.altera.com>
In-Reply-To: <55B7C84D.5040104@opensource.altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201507282029.40924.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, July 28, 2015 at 08:22:05 PM, Graham Moore wrote:
> On 07/28/2015 01:07 PM, Marek Vasut wrote:
> > On Tuesday, July 28, 2015 at 07:38:03 PM, Graham Moore wrote:
> > 
> > DTTO here.
> > 
> > Thanks a lot for working on the driver though -- would you like me to
> > continue reviewing or just take over please ?
> 
> Aha, I see your strategy :)  You must *really* want to take this over.
> Fine, you can have it.

I don't care either way, it's just a driver on my radar which I'd like to
see mainline because I use it on my board. I can keep reviewing until we
bash it into sensible state :)

> And thanks, I'm glad somebody actually gives a hoot.

You're welcome, I do care indeed. I use UBI/UBIFS on a QSPI NOR here.

Best regards,
Marek Vasut
