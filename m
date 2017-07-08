Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dTeKZ-0007sw-JJ
 for linux-mtd@lists.infradead.org; Sat, 08 Jul 2017 01:14:45 +0000
Received: by mail-pf0-x242.google.com with SMTP id z6so6512493pfk.3
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jul 2017 18:14:22 -0700 (PDT)
Date: Fri, 7 Jul 2017 18:14:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH v5 3/5] mtd: handle partitioning on devices with 0
 erasesize
Message-ID: <20170708011419.GE55942@google.com>
References: <20170602032119.22282-1-chris.packham@alliedtelesis.co.nz>
 <20170602032119.22282-4-chris.packham@alliedtelesis.co.nz>
 <ec40da4af0be445b9a1f2ed29e61a547@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec40da4af0be445b9a1f2ed29e61a547@svr-chch-ex1.atlnz.lc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 04, 2017 at 03:22:52AM +0000, Chris Packham wrote:
> I had someone mention to me in passing that mtdinfo was failing for them 
> (crashing with some floating point error). I'm wondering if we've 
> created a divide-by-zero problem by reporting 0 erase size in /proc/mtd. 
> I don't have any other info and right now I don't have access to the 
> system I had with the mchp23lcv1024 sram.

Wouldn't be that surprising. mtdinfo is actually developed under the
"ubi-utils" directory of mtd-utils, and UBI wouldn't know what to do
with and SRAM like that.

Brian
