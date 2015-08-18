Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRVfI-0000qs-GJ
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 01:26:13 +0000
Received: by pawq9 with SMTP id q9so22580382paw.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2015 18:25:51 -0700 (PDT)
Date: Mon, 17 Aug 2015 18:24:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org, Viet Nga Dao <vndao@altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rafa?? Mi??ecki <zajec5@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Message-ID: <20150818012444.GA17499@localhost>
References: <1433316644-3748-1-git-send-email-vndao@altera.com>
 <CAN1oZWx1z0vq_8csMx3bs70ULfhR03CgX=NtTBj1HiLA8FdZjg@mail.gmail.com>
 <20150817160338.GN60523@google.com>
 <201508171953.23955.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201508171953.23955.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not very helpful here, so hopefully Viet can be of more use:

On Mon, Aug 17, 2015 at 07:53:23PM +0200, Marek Vasut wrote:
> On Monday, August 17, 2015 at 06:03:38 PM, Brian Norris wrote:
> Also, I cannot find any documentation for this IP block even if I search through 
> Quartus/QSys, is there any proper documentation available anywhere?

I never found proper documentation, but I didn't look too hard. I've
mostly been going off of Viet's comments and code.

But FWIW, I did find some relevant info for the peculiar Altera EPCQ
flash here:

https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/cfg/cfg_cf52012.pdf

Brian
