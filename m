Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDyg2-0002EF-VC
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2013 15:25:59 +0000
Received: by mail-pb0-f52.google.com with SMTP id wz12so3534575pbc.39
 for <linux-mtd@lists.infradead.org>; Mon, 26 Aug 2013 08:25:37 -0700 (PDT)
Date: Mon, 26 Aug 2013 23:30:22 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 00/10] About the SLC/MLC
Message-ID: <20130827033020.GA2182@gmail.com>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <20130826144153.568f2b1c@skate>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130826144153.568f2b1c@skate>
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 26, 2013 at 02:41:53PM +0200, Thomas Petazzoni wrote:
> Dear Huang Shijie,
> 
> On Mon, 26 Aug 2013 17:36:38 +0800, Huang Shijie wrote:
> > In current mtd code, the MTD_NANDFLASH is used to represent both the
> > SLC nand MLC(including the TLC). But we already have the MTD_MLCNANDFLASH
> > to stand for the MLC. What is worse is that the JFFS2 may run on the MLC
> > nand with current code. For the reason of READ/WRITE disturbance, the JFFS2
> > should runs on the SLC only,
> 
> Pardon the probably very silly question, but would you mind giving more
> details about why JFFS2 is not appropriate on MLC flashes? Is there
> anything that UBI/UBIFS does that JFFS2 isn't doing to take into
> account read/write disturbance?
I try to explain it.

For the UBIFS, it will writes the page(including the oob) only one time;
but for jffs2, it may writes the page(including the oob) twice, one for the
marker, one for the real data. 

For the MLC, the write disturbance will cause some bitflips in this
page. Since you write a page twice, so in the jffs2, you will meet uncorrectable
ECC error.

thanks
Huang Shijie
