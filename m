Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnuav-0008Ko-TP
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 15:07:38 +0000
Received: by fxm19 with SMTP id 19so2868026fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 07:07:36 -0800 (PST)
Subject: Re: [PATCH] mtd: jedec_probe: initialise make sector erase command
	variable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Antony Pavlov <antony@niisi.msk.ru>
In-Reply-To: <1297418437-23553-1-git-send-email-antony@niisi.msk.ru>
References: <1297418437-23553-1-git-send-email-antony@niisi.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 17:06:27 +0200
Message-ID: <1297436787.2760.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, w.sang@pengutronix.de,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-11 at 13:00 +0300, Antony Pavlov wrote:
> In the commit 08968041bef437ec363623cd3218c2b083537ada
>  (mtd: cfi_cmdset_0002: make sector erase command variable)
> introdused a field sector_erase_cmd. In the same commit initialisation
> of cfi->sector_erase_cmd made in cfi_chip_setup()
> (file drivers/mtd/chips/cfi_probe.c), so the CFI chip has no problem:
> 
> ...
>         cfi->cfi_mode = CFI_MODE_CFI;
>         cfi->sector_erase_cmd = CMD(0x30);
> ...
> 
> But for the JEDEC chips this initialisation is not carried out,
> so the JEDEC chips have sector_erase_cmd == 0.
> 
> It's not possible symply add the line
>         p_cfi->sector_erase_cmd = CMD(0x30);
> to the cfi_jedec_setup() function be cause CMD() macros needs
> map and cfi variables. So this patch makes necessary changes.
> 
> Signed-off-by: Antony Pavlov <antony@niisi.msk.ru>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
