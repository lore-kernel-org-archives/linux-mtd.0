From: David Woodhouse <dwmw2@infradead.org>
To: Vahid Fereydounkolahi <vahidf@istor.com>
In-Reply-To: <7D036BD3216A084DB1BD9D62BCEAF2905B13B0@mail1irv.inside.istor.com>
References: 
	 <7D036BD3216A084DB1BD9D62BCEAF2905B13B0@mail1irv.inside.istor.com>
Content-Type: text/plain
Message-Id: <1079459552.16952.52.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 16 Mar 2004 17:52:33 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Toshiba NAND Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-03-16 at 09:44 -0800, Vahid Fereydounkolahi wrote:
> Hi All,
>  I am trying to configure my Linux kernel to detect my Toshiba
> TC58256AFT NAND flash. I configured my kernel with MTD and JFFS2, but it
> does not detect my NAND flash.
> 
> Would you please let me know if this NAND flash is supported by kernel?
> If not what should be done?

The chip itself is supported -- but the kernel needs to know how to
communicate with it. Look at the examples in drivers/mtd/nand/ and make
one which works on your board.

-- 
dwmw2
