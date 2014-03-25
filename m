Received: from mail-wg0-f45.google.com ([74.125.82.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSSoB-0007UB-NP
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 14:58:32 +0000
Received: by mail-wg0-f45.google.com with SMTP id l18so414910wgh.16
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 07:58:08 -0700 (PDT)
Date: Tue, 25 Mar 2014 14:58:02 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC 01/47] mtd: nand: export useful functions from core driver
Message-ID: <20140325145802.GC24823@lee--X1>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
 <1395735604-26706-2-git-send-email-lee.jones@linaro.org>
 <20140325125755.GD665@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140325125755.GD665@arch.cereza>
Cc: angus.clark@st.com, kernel@stlinux.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 25 Mar 2014, Ezequiel Garcia wrote:

> On Mar 25, Lee Jones wrote:
> > These functions are utilised by the STM BCH NAND Controller driver.
> > 
> [..]
> > -static int nand_suspend(struct mtd_info *mtd)
> > +int nand_suspend(struct mtd_info *mtd)
> >  {
> >  	return nand_get_device(mtd, FL_PM_SUSPENDED);
> >  }
> > +EXPORT_SYMBOL(nand_suspend);
> >  
> >  /**
> >   * nand_resume - [MTD Interface] Resume the NAND flash
> >   * @mtd: MTD device structure
> >   */
> > -static void nand_resume(struct mtd_info *mtd)
> > +void nand_resume(struct mtd_info *mtd)
> >  {
> >  	struct nand_chip *chip = mtd->priv;
> >  
> > @@ -2776,6 +2779,7 @@ static void nand_resume(struct mtd_info *mtd)
> >  		pr_err("%s called for a chip which is not in suspended state\n",
> >  			__func__);
> >  }
> > +EXPORT_SYMBOL(nand_resume);
> >  
> 
> The patch that adds the PM support for the driver makes no use of these.
> 
> Can you detail why do you need to export these?

Please see RFC PATCH 9:

mtd: nand: stm_nand_bch: introduce and initialise some important data structures

static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
                                   struct mtd_info *mtd, struct nand_chip *chip)
{

[...]
       mtd->_sync = nand_sync;
       mtd->_suspend = nand_suspend;
       mtd->_resume = nand_resume;
}

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
