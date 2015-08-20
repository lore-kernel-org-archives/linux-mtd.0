Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSWbg-0000dl-D1
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 20:38:40 +0000
Received: by pdrh1 with SMTP id h1so18310581pdr.0
 for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2015 13:38:19 -0700 (PDT)
Date: Thu, 20 Aug 2015 13:38:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Viet Nga Dao <vndao@altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nga_chi86 <ngachi86@gmail.com>
Subject: Re: [PATCH] [PATCH v5] mtd:spi-nor: Add Altera Quad SPI Driver
Message-ID: <20150820203815.GF74600@google.com>
References: <1440053705-3836-1-git-send-email-vndao@altera.com>
 <201508201052.47502.marex@denx.de>
 <CAN1oZWzADdeNyZofXQwKa0F2_Jv4Oda824ew5C3Ug+-V9Lx3hw@mail.gmail.com>
 <201508201142.18586.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201508201142.18586.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 20, 2015 at 11:42:18AM +0200, Marek Vasut wrote:
> On Thursday, August 20, 2015 at 11:18:14 AM, Viet Nga Dao wrote:
> > You might misunderstand the hardware problem i mention here. This soft
> > IP controller is able to provide the ID for our Altera EPCS/EPCQ flash
> > chips, which are non JEDEC chips. As from EPCQ device data sheet
> > (https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature
> > /hb/cfg/cfg_cf52012.pdf), the device ID is 8 bit data.
> 
> So what exactly is the output of READID instruction followed by 6 Byte read
> on an EPCQ chip?

+1 to this question
