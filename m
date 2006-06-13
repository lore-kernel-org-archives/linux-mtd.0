Subject: Re: DiskOn Chip Millennium Plus 32MB + INFTL
From: David Woodhouse <dwmw2@infradead.org>
To: Husam <husamsenussi@gmail.com>
In-Reply-To: <200606132042.44659.husamsenussi@gmail.com>
References: <4488665D.5010908@kalikstein.com>
	<200606101321.37502.husamsenussi@gmail.com>
	<1149977115.18635.158.camel@shinybook.infradead.org>
	<200606132042.44659.husamsenussi@gmail.com>
Content-Type: text/plain
Date: Tue, 13 Jun 2006 20:56:27 +0100
Message-Id: <1150228587.11159.103.camel@shinybook.infradead.org>
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

On Tue, 2006-06-13 at 20:42 +0100, Husam wrote:
> Yes it's not single 16-bit, could we add anther flag to NAND say 
> "NAND_INTERLEAVE" .. or maybe pass number  of chips from device layer to NAND 
> layer.
> 
> All we need to do I guess is to pass the right information so the NAND layer 
> can calculate the right size for page and to block. 

Can we do this by providing our own command function?

-- 
dwmw2
