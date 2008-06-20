Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9kmL-0005c3-Jm
	for linux-mtd@lists.infradead.org; Fri, 20 Jun 2008 17:52:06 +0000
Date: Sat, 21 Jun 2008 02:53:34 +0900 (JST)
Message-Id: <20080621.025334.25909435.anemo@mba.ocn.ne.jp>
To: sr@denx.de
Subject: Re: [PATCH] jedec_probe: Fix SST 16-bit chip detection
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <200806200708.37974.sr@denx.de>
References: <20080619.163648.262833678.nemoto@toshiba-tops.co.jp>
	<1213896113.26255.1434.camel@pmac.infradead.org>
	<200806200708.37974.sr@denx.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 20 Jun 2008 07:08:37 +0200, Stefan Roese <sr@denx.de> wrote:
> > I believe you about the uaddr -- but can these devices really not be
> > used in 8-bit mode?
> 
> No. They are 16-bit only.

Right.  They do not have BYTE# pin, according to their datasheets:

http://www.sst.com/downloads/datasheet/S71145.pdf
http://www.sst.com/downloads/datasheet/S71223.pdf

---
Atsushi Nemoto
