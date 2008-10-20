Subject: RE: goofy mtd m25p80 patches in GIT ...
From: David Woodhouse <dwmw2@infradead.org>
To: Chen Gong-B11801 <G.Chen@freescale.com>
In-Reply-To: <C3C4D3116BA1F84989E53FCF1F505187166DCB@zch01exm21.fsl.freescale.net>
References: <200810191535.05617.david-b@pacbell.net>
	<1224488403.6770.1517.camel@macbook.infradead.org>
	<C3C4D3116BA1F84989E53FCF1F505187166DB8@zch01exm21.fsl.freescale.net>
	<1224488640.6770.1524.camel@macbook.infradead.org>
	<C3C4D3116BA1F84989E53FCF1F505187166DCB@zch01exm21.fsl.freescale.net>
Content-Type: text/plain
Date: Mon, 20 Oct 2008 09:02:48 +0100
Message-Id: <1224489768.6770.1527.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-10-20 at 15:56 +0800, Chen Gong-B11801 wrote:
> I'm not sure whether I catch your word. Frankly I agree that we need a
> chip-erase command but in fact current MTD doesn't support this kind of interface
> (only one erase interface), so I can't give you a new patch :-(

I think the interface is fine -- if you ask it to erase the whole chip
(start == 0, len == size), then it'll use a chip erase command if it has
one, or fall back to erasing individual blocks.

I think David just wanted a cleanup to the nomenclature -- renaming
'erase_block' to 'erase_chip', perhaps, and changing the #define for the
command?

Or did I misunderstand?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
