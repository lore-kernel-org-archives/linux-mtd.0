Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U8SkY-0003Va-Bt
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 09:47:35 +0000
Message-ID: <5125ED30.3020305@parrot.com>
Date: Thu, 21 Feb 2013 10:47:28 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RFC] mtd/nand: implement user otp for Micron chips
References: <1361394332-19415-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1361394332-19415-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Uwe Kleine-König a écrit :
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> there are some things to clean up before this patch can be applied. See
> the respective comments in the code, most of them are marked with XXX,
> but I'm sure you'll find things to criticize that I didn't mark :-)
> 
> About the unsuitablity of nand_do_read_ops and nand_do_write_ops I'd like to
> hear your thoughts. Would you prefer a new function that does only the
> necessary stuff, or should I add another parameter to make them do the
> right thing for me?
> 
> BTW, to make use of this patch you'd need
> 	http://patchwork.ozlabs.org/patch/221191/
> 
> Best regards
> Uwe
> 
>  drivers/mtd/nand/nand_base.c |  126 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 3766682..10e51f3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2753,6 +2753,116 @@ static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
>  	return 0;
Shouldn't vendor specific code go in another file ?


Matthieu
