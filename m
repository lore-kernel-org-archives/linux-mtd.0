From: David Woodhouse <dwmw2@infradead.org>
To: art@sigrand.ru
In-Reply-To: <1147665263.6999.7.camel@localhost>
References: <1147665263.6999.7.camel@localhost>
Content-Type: text/plain
Date: Wed, 17 May 2006 00:36:46 +0100
Message-Id: <1147822606.30771.15.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Reading data from NAND FLASH without ECC is not recommended
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-05-15 at 03:54 +0000, Polyakov Artem wrote:
> But my debug messages shows this:
> > write oob(00001890): 65 55 97 5a ffff 69 57 ff ff ff ff ff ff ff ff
> bytes for ECC are not equal 0xFF!
> but system dont use this bytes for ECC correction:
> > Reading data from NAND FLASH without ECC is not recommended 

You're saying that the system _writes_ ECC data to the flash, but does
not use ECC when reading from the flash?

Please show your NAND board driver, and also the code you used for
reading from the flash.

-- 
dwmw2
