Date: Thu, 14 Nov 2013 19:37:52 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 03/14] mtd: nand: pxa3xx: Add bad block handling
Message-ID: <20131114223751.GA24184@localhost>
References: <1384464339-6817-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1384464339-6817-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131114221212.GR9468@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131114221212.GR9468@ld-irv-0074.broadcom.com>
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

On Thu, Nov 14, 2013 at 02:12:12PM -0800, Brian Norris wrote:
> On Thu, Nov 14, 2013 at 06:25:28PM -0300, Ezequiel Garcia wrote:
> > --- a/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
> > @@ -15,6 +15,8 @@ Optional properties:
> >   - marvell,nand-keep-config:	Set to keep the NAND controller config as set
> >  				by the bootloader
> >   - num-cs:			Number of chipselect lines to usw
> > + - nand-on-flash-bbt: 		boolean to enable on flash bbt option if
> > +				not present false
> 
> It's not really your problem, but I just noticed that this binding
> description is particularly badly worded! No need to change it in this
> patch, since it's a copy-and-paste from the generic nand.txt, but it's
> probably worth rewriting all of them sometime.
> 

Indeed. And it's a bit embarrasing that I did such obviously mediocre
copy-paste.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
