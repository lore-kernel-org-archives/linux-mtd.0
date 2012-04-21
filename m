Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLeJy-0005ev-E3
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2012 17:42:10 +0000
Received: by lagy4 with SMTP id y4so9270423lag.36
 for <linux-mtd@lists.infradead.org>; Sat, 21 Apr 2012 10:42:03 -0700 (PDT)
Message-ID: <1335029970.28267.3.camel@brekeke>
Subject: Re: [PATCH] driver/mtd: IFC NAND: Add support of ONFI NAND flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Prabhakar Kushwaha <prabhakar@freescale.com>
Date: Sat, 21 Apr 2012 20:39:30 +0300
In-Reply-To: <1333949122-10401-1-git-send-email-prabhakar@freescale.com>
References: <1333949122-10401-1-git-send-email-prabhakar@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: scottwood@freescale.com, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2012-04-09 at 10:55 +0530, Prabhakar Kushwaha wrote:
> - Fix NAND_CMD_READID command for ONFI detect.
>   - Add NAND_CMD_PARAM command to read the ONFI parameter page.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>
> Acked-by: Scott Wood <scottwood@freescale.com>
> ---
>  Based upon git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git 
>  Branch master

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
