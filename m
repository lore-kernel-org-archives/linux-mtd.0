Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRObU-0004Jf-P1
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2015 17:53:49 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Mon, 17 Aug 2015 19:53:23 +0200
Cc: Brian Norris <computersforpeace@gmail.com>,
 Viet Nga Dao <vndao@altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
References: <1433316644-3748-1-git-send-email-vndao@altera.com>
 <CAN1oZWx1z0vq_8csMx3bs70ULfhR03CgX=NtTBj1HiLA8FdZjg@mail.gmail.com>
 <20150817160338.GN60523@google.com>
In-Reply-To: <20150817160338.GN60523@google.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508171953.23955.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, August 17, 2015 at 06:03:38 PM, Brian Norris wrote:

Hi!

[...]

> > Hi Brian,
> > It is really unfortunate that this controller is not able to read full
> > JEDEC ID. It only can provide 1 byte ID. I did discuss with IP
> > designer about this, but it is really unfortunate that they are not
> > able to fix that issue. Hence it requires software to make changes.

Thanks for CCing me, I assume this is a driver for that "altera_epcq_controller"
which you can synthesise into your FPGA, is that correct? Is there an Hard IP 
variant of this controller in the public or is this purely Soft IP?

Also, I cannot find any documentation for this IP block even if I search through 
Quartus/QSys, is there any proper documentation available anywhere?

[...]

Best regards,
Marek Vasut
