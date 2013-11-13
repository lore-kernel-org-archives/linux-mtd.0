Received: from mail-qe0-x22d.google.com ([2607:f8b0:400d:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VghGc-0004r1-2W
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2013 20:42:26 +0000
Received: by mail-qe0-f45.google.com with SMTP id 8so652915qea.32
 for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2013 12:42:04 -0800 (PST)
Date: Wed, 13 Nov 2013 12:41:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: gpmi-lib: Make checkpatch happy
Message-ID: <20131113204159.GF9468@ld-irv-0074.broadcom.com>
References: <1383874123-30125-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383874123-30125-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 07, 2013 at 11:28:43PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Fix the following checkpatch warnings:
> 
> WARNING: line over 80 characters
> #268: FILE: mtd/nand/gpmi-nand/gpmi-lib.c:268:
> +	* consecutive reboots. The latter case has not been seen on the MX23 yet,
> 
> WARNING: space prohibited before semicolon
> #356: FILE: mtd/nand/gpmi-nand/gpmi-lib.c:356:
> +		(target.tRHOH_in_ns >= 0) ;
> 
> WARNING: space prohibited before semicolon
> #1006: FILE: mtd/nand/gpmi-nand/gpmi-lib.c:1006:
> +		BF_GPMI_TIMING0_DATA_SETUP(hw.data_setup_in_cycles)       ;
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git/next. Thanks!

Brian
