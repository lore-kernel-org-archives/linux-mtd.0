Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188hax-00064E-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2002 13:48:47 +0000
Date: Mon, 4 Nov 2002 15:17:47 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Brian J. Murrell" <ae211dd25992457126b87e47964e2ed8@interlinx.bc.ca>,
   linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: MTD Config.in items not escaped by bus availability
Message-ID: <20021104141747.GA31683@wohnheim.fh-wedel.de>
References: <D99C1FB421989A40818B6370E3187094040A3A91@tayexc19.americas.cpqcorp.net> <20021030185507.GA31547@wohnheim.fh-wedel.de> <20021030193834.GE27880@pc.ilinx> <20021030201608.GA28523@wohnheim.fh-wedel.de> <20021030204937.GG27880@pc.ilinx> <20021103115941.GJ16306@pc.ilinx>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021103115941.GJ16306@pc.ilinx>
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

On Sun, 3 November 2002 06:59:41 -0500, Brian J. Murrell wrote:
> On Thu, Oct 31, 2002 at 07:37:18PM +0100, Jörn Engel wrote:
> > 
> > All right. This patch will only create the mtd devices from ram and
> > block devices, unless $CONFIG_MEMORY_BUS is defined.
> > Brian, can you define this option for all platforms other tham uml?
> > 
> > Also, this might still be a little too broad for nand flash. Nand
> > needs more than just a memory bus, but I don't know what exactly.
> > But this should be close enough for now.
> 
> OK.  I have taken your patch and added the bits to define
> CONFIG_MEMORY_BUS on existing hardware architectures in the 2.4.19
> tree and sent the patch to Marcelo.  Let's see what happens.
> 
> I don't know what Marcelo's normal mode of operations is, whether he
> responds to patch sumbitters with a confirmation of the patch being
> applied or not (I still have not gotten response from a patch I sent a
> few weeks ago doing pretty much this same thing for PC Appletalk
> cards), but I guess we can just wait and see what's in 2.4.20 when
> it's released.

Could you also send the patch to David and to this list?

Usually, patches should go through the maintainer, which is David
Woodhouse in this case. Unless David ignores the patch completely for
some time, I would not send it directly to Marcelo.

And I would like to see the patch as well, as might some others. :-)

Jörn

-- 
If System.PrivateProfileString("",
"HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <>
"" Then  CommandBars("Macro").Controls("Security...").Enabled = False
-- from the Melissa-source
