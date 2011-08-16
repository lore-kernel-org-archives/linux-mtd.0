Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtF2o-0008MW-SK
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 08:30:43 +0000
Received: by fxd20 with SMTP id 20so5210122fxd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 01:30:39 -0700 (PDT)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Tue, 16 Aug 2011 11:30:36 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI FS on 2MiB eraseblock Hynix MLC NAND
Message-ID: <20110816083035.GA8459@jeknote.loshitsa1.net>
References: <CAKa7sPRir5YTdPCYAHEYvPGA5GhfTuyv0Z9ynDUtEmy=YHA2XQ@mail.gmail.com>
	<1313424117.8691.19.camel@sauron>
	<CAKa7sPSB+p6Zxk8uM9famKsg_Bhdv7=LirUimaV+Jti2aRRPZA@mail.gmail.com>
	<1313482105.5993.1.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1313482105.5993.1.camel@sauron>
Cc: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>,
	Ben Gardiner <bengardiner@nanometrics.ca>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 16, 2011 at 11:08:20AM +0300, Artem Bityutskiy wrote:
> Hi,
> 
> On Tue, 2011-08-16 at 10:48 +0300, Viktar Palstsiuk wrote:
> > The problem was caused by behavior of H27UBG8T2ATR Hynix MLC NAND
> > while UBI FS was trying to do page write operation. UBI FS was trying
> > to write data to the first empty page assuming that 0xFF page is
> > erased and writable. But this type of NAND returns error on page write
> > operation even if it was entirely written with 0xFF before. As far as
> > I'm using U-boot's 'nand write' to flash UBI image I've added skip if
> > U-boot trying to write 0xFF-page.
> > 
> > --- drivers/mtd/nand/nand_base.c
> > +++ drivers/mtd/nand/nand_base.c	(working copy)
> > @@ -1761,7 +1761,18 @@
> >  			   const uint8_t *buf, int page, int cached, int raw)
> >  {
> >  	int status;
> > +	int i;
> > 
> > +	/* Skip empty page */
> > +	for (i = 0; i < mtd->writesize; i++)
> > +                if (buf[i] != 0xFF)
> > +                        break;
> > +	
> > +	if (i == mtd->writesize) {
> > +		printf ("nand_write_page: Skip 0xFF page\n");
> > +		return 0;
> > +	}
> > +	
> 
> This solution is not acceptable as we are currently discussing in the
> "GPMI-NAND Status" thread in this mailing list.
> 
> Instead, you should just change u-boot, and I believe someone has done
> this recently - ask the u-boot mailing list. I think that was Ben -
> CCed.

As I understood, above Victor's patch is for U-Boot, not for kernel.


-- 
Yauhen Kharuzhy
-----------------------------------------------------------
Promwad Innovation Company
22, Olshevskogo St.
Office 809
220073, Minsk, Belarus
Phone/Fax: +375 (17) 312-1246
E-mail: yauhen.kharuzhy@promwad.com
Skype: jekhor
Web: www.promwad.com
