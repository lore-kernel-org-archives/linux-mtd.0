Date: Fri, 9 Sep 2016 14:26:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/9] mtd: nand: Create a NAND reset function
Message-ID: <20160909142635.23a8c865@bbrezillon>
In-Reply-To: <CAOMZO5DfSU5rhf45Vcs7Sit=v2FdQtm=nhdfstZdYwizP6C-=w@mail.gmail.com>
References: <1473422712-12359-1-git-send-email-s.hauer@pengutronix.de>
 <1473422712-12359-2-git-send-email-s.hauer@pengutronix.de>
 <CAOMZO5DfSU5rhf45Vcs7Sit=v2FdQtm=nhdfstZdYwizP6C-=w@mail.gmail.com>
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

On Fri, 9 Sep 2016 09:15:52 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Hi Sascha,
> 
> On Fri, Sep 9, 2016 at 9:05 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> >  /**
> > + * nand_reset - Reset and initialize a NAND device
> > + * @chip: The NAND chip
> > + *
> > + * Returns 0 for success or negative error code otherwise
> > + */
> > +int nand_reset(struct nand_chip *chip)
> > +{
> > +       chip->cmdfunc(&chip->mtd, NAND_CMD_RESET, -1, -1);
> > +
> > +       return 0;  
> 
> It always return 0 here, so the comment and code do not match.

Not sure this is a big problem, because the function is updated in
patch 6 and after that it can return an error.
