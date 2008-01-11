Subject: Re: MTD Make select_chip optional?
From: David Woodhouse <dwmw2@infradead.org>
To: Zhong Li <zql@glomationinc.com>
In-Reply-To: <F57D96A984C7417F88EC7A545CE40B46@Saturn>
References: <F57D96A984C7417F88EC7A545CE40B46@Saturn>
Content-Type: text/plain
Date: Fri, 11 Jan 2008 16:27:53 +0000
Message-Id: <1200068873.4839.27.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-01-11 at 08:47 -0500, Zhong Li wrote:
> As the NAND chip capacity grows it seems designs with multiple chips become
> less common than single chip.  Looking at the nand_base.c it seems the
> select_chip gets called a lot.  Wouldn't it make significant performance
> increase if the select_chip call is made optional only for hardware design
> with multiple chips?

In my experience the answer is likely to be 'no'. Feel free to benchmark
it and prove otherwise....

-- 
dwmw2
