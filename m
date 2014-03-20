Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQdLa-0007ou-Kb
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 13:49:27 +0000
Date: Thu, 20 Mar 2014 10:48:28 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v8 0/4] mtd: devices: elm: add checks ELM H/W constrains,
 driver code cleanup
Message-ID: <20140320134828.GA1585@arch.cereza>
References: <1395321517-4490-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1395321517-4490-1-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 20, Pekon Gupta wrote:
> *changes v7 -> v8*
> Incorporated feedbacks from Brian Norris <computersforpeace@gmail.com>
>  - renamed ecc_step_bytes -> ecc_syndrome_size
> 
> 
> *changes v6 -> v7*
> Incorporated feedbacks from Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>  - using dev_err() instead of pr_err()
>  - moved un-related addition of info->ecc_steps, info->ecc_step_bytes,
>    info->ecc_step_size from [PATCH v6 1/4] into subsequent patches
>  - dropped pr_fmt() change
> 
> 
> *changes v5 -> v6*
> [PATCH 02/04] minor cleanup
> 
> *changes v4 -> v5*
> This patch series is split version from earlier series [1].
> This series refactors and cleans ELM driver which is used by Hardware
> based BCHx ecc-schemes.
>  - Undo: introduction of 'struct mtd_info' and 'struct nand_chip'. Instead
>          keep ELM driver independent of mtd_info and nand_chip structs and
>          pass only required ECC configurations as elm_config() arguments
>          elm_config(..., int ecc_steps, int ecc_step_size, int ecc_step_bytes)
>  - Undo: re-writing of elm_load_syndrome() ECC register configurations.
> 
> *changes v3 -> v4 [1]*
>  - in-corporated feedbacks from Brian Norris <computersforpeace@gmail.com>
>  - updated: use 'pr_fmt(fmt)' to suffix DRIVER_NAME
>  - removed: local 'eccsteps' in ELM driver, instead using nand_chip->ecc.steps
>  - undo: irrelavant white-space changes
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2013-November/050242.html
> 
> Pekon Gupta (4):
>   mtd: devices: elm: check for hardware engine's design constraints
>   mtd: devices: elm: clean elm_load_syndrome
>   mtd: devices: elm: configure parallel channels based on ecc_steps
>   mtd: devices: elm: update DRIVER_NAME as "omap-elm"
> 

For the whole series:

Reviewed-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
