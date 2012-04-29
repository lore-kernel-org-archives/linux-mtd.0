Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOTX2-00008G-7M
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2012 12:47:16 +0000
Received: by lagy4 with SMTP id y4so1667774lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 29 Apr 2012 05:47:12 -0700 (PDT)
Date: Sun, 29 Apr 2012 15:47:07 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 09/10] mtd: nand: utilize oob_required parameter
Message-ID: <20120429154707.01c7be55@pixies.home.jungo.com>
In-Reply-To: <1335576594-25267-10-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-10-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Fri, 27 Apr 2012 18:29:53 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> Don't read/write OOB if the caller doesn't requre it.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 13a6355..5b390ae 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1075,7 +1075,8 @@ static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  			      uint8_t *buf, int oob_required, int page)
>  {
>  	chip->read_buf(mtd, buf, mtd->writesize);
> -	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +	if (oob_required)
> +		chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>  	return 0;
>  }

Re-thinking this, I think this might be incorrect.
Sorry I havn't noticed this earlier.

Suppose the nand chip is working in "sequential" (aka "incremental")
mode.
Meaning, a NAND_CMD_READ0 command is issued, and then adjacent pages are
read sequencially, without having to re-issue NAND_CMD_READ0.

(see for example the loop within 'nand_do_read_ops', especially the
'sndcmd' variable).

In that case, we MUST read the 'oob', because the OOB bytes will always
arrive on the bus following the inband data.
(on bus, data will appear as: page, spare, page, spare, and so on...)

If we do not read into 'oob_poi', then the OOB bytes arriving on the bus
will be set by the software into next page's 'buf'...

I have no idea if this issue is also relevant for 'read_page' implementors
other than of nand_base.c; should carefully review.

There are 2 options for fixing the issue in nand_base.c:

- Disregard the 'oob_required' parameter in all nand_base's
  'read_page' implementations (not future proof, someone might miss the
  nuance; also bug might still exist in the non-default implementations)

- Fix your 02/10 patch, in away that the passed 'oob_required' argument
  will be somehow set according to the 'snd_cmd'

Regards,
Shmulik
