Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYX6X-0007II-4I
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 13:04:42 +0000
Date: Mon, 8 Jan 2018 14:04:29 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>, Han Xu <han.xu@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: Check ONFI timings have been acked by
 the chip
Message-ID: <20180108140429.79f67a83@bbrezillon>
In-Reply-To: <20180105164239.79d7980c@xps13>
References: <20171222172853.27710-1-miquel.raynal@free-electrons.com>
 <20171222172853.27710-2-miquel.raynal@free-electrons.com>
 <20180105161321.44218e4e@bbrezillon>
 <20180105164239.79d7980c@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 5 Jan 2018 16:42:39 +0100
Miquel RAYNAL <miquel.raynal@free-electrons.com> wrote:

> Hello,
> 
> > Hm, I'm not sure this is safe. The spec says that new ONFI timing mode
> > is applied as soon the CS line is released after a
> > SET_FEATURES(ONFI_FEATURE_ADDR_TIMING_MODE), and since we have no
> > guarantee that the CS will be kept low by the controller after  
> > ->onfi_set_features() returns we must assume the new mode has been    
> > applied and call ->setup_data_interface() to instruct the controller
> > to apply new timings.
> > 
> > If you want to check if the mode has really been applied, you should
> > release the CS (->select_chip(-1)), re-acquire it
> > (->select_chip(X)), and call  
> > ->onfi_get_features(ONFI_FEATURE_ADDR_TIMING_MODE). If it appears  
> > that the mode has not been applied, you should restore timing mode 0
> > and issue a RESET.  
> 
> Boris, thanks for the comment, I will fix that.
> 
> Han, could I have your input on this series? Aside Boris' comment of
> course.

Han, we really need your feedback on this series since you were the one
complaining that ONFI mode should be checked back after applying a new
mode. Miquel is reworking the framework to mimic what the GPMI driver,
but we need to be sure that you'll accept to transition to the generic
->setup_data_interface() solution.

Thanks,

Boris
