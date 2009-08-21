Received: from mo-p05-ob.rzone.de ([81.169.146.182])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MeP21-0001Xg-7p
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 07:59:33 +0000
From: Stefan Roese <sr@denx.de>
To: u-boot@lists.denx.de
Subject: Re: [U-Boot] NAND  ECC Error with wrong SMC ording bug
Date: Fri, 21 Aug 2009 09:59:21 +0200
References: <19081.57584.173693.798535@cargo.ozlabs.ibm.com>
	<200908200701.21076.sr@denx.de> <4A8DDF72.2080808@amcc.com>
In-Reply-To: <4A8DDF72.2080808@amcc.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200908210959.21740.sr@denx.de>
Cc: linuxppc-dev@ozlabs.org, Feng Kan <fkan@amcc.com>,
	linux-mtd@lists.infradead.org, Sean MacLennan <smaclennan@pikatech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Feng,

On Friday 21 August 2009 01:42:42 Feng Kan wrote:
> We had a board with high number of correctable ECC errors. Which crashed
> the jffs when it
> was miss correcting the wrong byte location.

OK, thanks.

> Do you want me to submit a patch for this, or do you prefer to do it.

Sure, please go ahead and send a patch to fix this in U-Boot as well.

Thanks.

Cheers,
Stefan

--
DENX Software Engineering GmbH,      MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich,  Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-0 Fax: (+49)-8142-66989-80 Email: office@denx.de
