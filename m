Received: from smtp-102.noc.nerim.net ([62.4.17.102] helo=mallaury.noc.nerim.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eAne-0000Vu-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 09:15:58 +0000
Date: Thu, 30 Jan 2003 10:46:58 +0100
From: Stephane List <stephane.list@lilotux.net>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Intel Strataflash
Message-ID: <20030130094658.GB11189@lilotux.net>
References: <20030129161457.GA9083@lilotux.net> <Pine.LNX.4.44.0301292233430.4791-100000@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0301292233430.4791-100000@imladris.demon.co.uk>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On mer, jan 29, 2003 at 10:36:13 +0000,
David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 29 Jan 2003, Stephane List wrote:
> 
> > PS : I couldn't compile my kernel with the CVS code...
> 
> Details?
> 

my grep doesn't know the "-m option" so I think that the patch isn't correctly applied.
I will look at "patchin.sh" to correct this.

sh patchin.sh /opt/hardhat/devkit/lsp/idt-79s334a-mips_fp_le-mips_fp_le/linux-2.4.17_sherman_cvs_mtd
grep: option invalide -- m
Usage: grep [OPTION]... PATRON [FICHIER]...
Pour en savoir davantage, faites: `grep --help'.
grep: option invalide -- m
Usage: grep [OPTION]... PATRON [FICHIER]...
Pour en savoir davantage, faites: `grep --help'.
grep: option invalide -- m
Usage: grep [OPTION]... PATRON [FICHIER]...
Pour en savoir davantage, faites: `grep --help'.
patchin.sh: test: too many arguments
patchin.sh: test: -gt: unary operator expected
grep: option invalide -- m
Usage: grep [OPTION]... PATRON [FICHIER]...
Pour en savoir davantage, faites: `grep --help'.
patchin.sh: test: too many arguments
patchin.sh: test: -eq: unary operator expected
Patching /opt/hardhat/devkit/lsp/idt-79s334a-mips_fp_le-mips_fp_le/linux-2.4.17_sherman_cvs_mtd
Include Filesytems: yes
Zlib-Patch needed: yes
Can we start now ? [y/N]y


 
> > #Because my flash chip data bus is 2 bytes width
> > CONFIG_MTD_PHYSMAP_BUSWIDTH=2
> 
> No, your CPU data bus is 4 bytes width (cf. CFI_B4 above) and has two 
> chips on it so
>  CONFIG_MTD_PHYSMAP_BUSWIDTH=4
>

OK, thanks

-- 
Stephane List
http://slist.lilotux.net
