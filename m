Date: Thu, 14 Nov 2013 19:45:24 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 09/14] mtd: nand: pxa3xx: Move the data buffer clean
 to prepare_start_command()
Message-ID: <20131114224523.GB24184@localhost>
References: <1384464339-6817-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1384464339-6817-10-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131114222554.GT9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131114222554.GT9468@ld-irv-0074.broadcom.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 14, 2013 at 02:25:54PM -0800, Brian Norris wrote:
> On Thu, Nov 14, 2013 at 06:25:34PM -0300, Ezequiel Garcia wrote:
> > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -633,6 +636,19 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
> >  		info->ndcb2 = 0;
> >  		break;
> >  	}
> > +
> > +	/*
> > +	 * If we are about to isse a read command, or about to set
> 
> s/isse/issue/
> 

Ack.

> > +	 * the write address, then clean the data buffer.
> > +	 */
> > +	if (command == NAND_CMD_READ0 ||
> > +	    command == NAND_CMD_READOOB ||
> > +	    command == NAND_CMD_SEQIN) {
> > +
> 
> Superfluous blank line?
> 

No, I find blank lines increase readability. I know others might
disagree. Feel free to chop it.

> > +		info->buf_count = mtd->writesize + mtd->oobsize;
> > +		memset(info->data_buff, 0xFF, info->buf_count);
> > +	}
> > +
> >  }
> >  
> >  static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
> 
> I'll make these changes myself, if I take the series. The rest of the
> series is looking good so far (up to this point), so it's not worth a
> respin.
> 

OK.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
