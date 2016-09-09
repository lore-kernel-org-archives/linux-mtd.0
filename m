MIME-Version: 1.0
In-Reply-To: <1473422712-12359-2-git-send-email-s.hauer@pengutronix.de>
References: <1473422712-12359-1-git-send-email-s.hauer@pengutronix.de>
 <1473422712-12359-2-git-send-email-s.hauer@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 9 Sep 2016 09:15:52 -0300
Message-ID: <CAOMZO5DfSU5rhf45Vcs7Sit=v2FdQtm=nhdfstZdYwizP6C-=w@mail.gmail.com>
Subject: Re: [PATCH 1/9] mtd: nand: Create a NAND reset function
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

On Fri, Sep 9, 2016 at 9:05 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:

>  /**
> + * nand_reset - Reset and initialize a NAND device
> + * @chip: The NAND chip
> + *
> + * Returns 0 for success or negative error code otherwise
> + */
> +int nand_reset(struct nand_chip *chip)
> +{
> +       chip->cmdfunc(&chip->mtd, NAND_CMD_RESET, -1, -1);
> +
> +       return 0;

It always return 0 here, so the comment and code do not match.
