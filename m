Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPpMA-0008Rv-Jx
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 06:17:39 +0000
Received: by lbbgg6 with SMTP id gg6so1267069lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 23:17:36 -0700 (PDT)
Date: Thu, 3 May 2012 09:17:24 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/3] mtd: nand: remove autoincrement 'sndcmd' code
Message-ID: <20120503091724.300723a7@pixies.home.jungo.com>
In-Reply-To: <1335917575-14953-2-git-send-email-computersforpeace@gmail.com>
References: <1335917575-14953-1-git-send-email-computersforpeace@gmail.com>
 <1335917575-14953-2-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Sorry for the late response.
(I'm following the posts, but obviously can't take a deep look
immediately)

On Tue,  1 May 2012 17:12:54 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> @@ -1842,20 +1823,15 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
>  
>  	while (1) {
>  		if (ops->mode == MTD_OPS_RAW)
> -			sndcmd = chip->ecc.read_oob_raw(mtd, chip, page, sndcmd);
> +			chip->ecc.read_oob_raw(mtd, chip, page, 1);
>  		else
> -			sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
> +			chip->ecc.read_oob(mtd, chip, page, 1);


Since '1' is always passed as 'sndcmd' argument, how about killing the
'sndcmd' parameter of of these interfaces:

	int (*read_oob_raw)(struct mtd_info *mtd, struct nand_chip *chip,
			int page, int sndcmd);
	int (*read_oob)(struct mtd_info *mtd, struct nand_chip *chip, int page,
			int sndcmd);

Looks as a simplification.
At least for current code which always passes '1'.
(Don't know if we might need the 'sndcmd' ability in the future)

I can come up with a patch, but currently I have very limited testing
capabilities.

Regards,
Shmulik
