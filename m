From: David Woodhouse <dwmw2@infradead.org>
To: Surjan Singh <surj@surj.net>
In-Reply-To: <1075210425.2325.14.camel@tank>
References: <1075210425.2325.14.camel@tank>
Content-Type: text/plain
Message-Id: <1075210820.1633.81.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 27 Jan 2004 13:40:20 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Using MTD to flash mainboard BIOS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-27 at 13:33 +0000, Surjan Singh wrote:
> Hi,
> 
> I have an EPIA 5000 mainboard
> (http://www.viavpsd.com/product/epia_mini_itx_spec.jsp?motherboardId=21), which uses a SST39SF020A-70-4C-NH BIOS chip.
> 
> Is it possible to flash this chip using MTD? If so, can someone offer
> some pointers?

Yes, probably -- you need to know how to enable the WE# and write-enable
lines to the flash chip, which are often hidden deeply in chipset magic.
See the other BIOS map drivers, e.g. ichxrom.c and l440gx.c, for
examples.

-- 
dwmw2
