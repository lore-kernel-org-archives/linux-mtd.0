Received: from mail.gmx.de ([213.165.64.20] helo=mail.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B45aX-0000Ge-MG
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 22:02:05 +0000
From: dkey <dk.dbox2@gmx.net>
To: linux-mtd@lists.infradead.org,
 dvrabel@arcom.com
Date: Thu, 18 Mar 2004 23:02:45 +0100
References: <E1B3wBv-0005HA-9d@pentafluge.infradead.org>
In-Reply-To: <E1B3wBv-0005HA-9d@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200403182302.45350.dk.dbox2@gmx.net>
Subject: Re: Erasebug on AMD flashes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

here is a picture of the flashes
http://www.dietmar-h.net/img/nokia_2xAMD_Pin12.jpg
and their configuration
http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/21534.pdf

greets


On Thursday 18 March 2004 13:00, linux-mtd-request@lists.infradead.org wrote:
> Message: 4
> Date: Thu, 18 Mar 2004 10:25:17 +0000
> From: David Vrabel <dvrabel@arcom.com>
> Subject: Re: Erasebug on AMD flashes
> To: linux-mtd@lists.infradead.org
> Message-ID: <4059790D.4020904@arcom.com>
> Content-Type: text/plain; charset=us-ascii; format=flowed
>
> dkey wrote:
> > we are using jffs2 on the dbox2 and AMD flash chips, but since rev. 1.96
> > of cfi_cmdset_0002.c we can't erase the flashes. rev. 1.94 works without
> > problems.
>
> "since 1.96" doesn't make sense.  Any breakage would be from 1.95.
>
> > here are some debug infos, tell me if you need more!
>
> Part numbers of the flash chips and their configuration (interleaved etc.).
>
> > would be please if anybody can take a look over the code or revert
> > revision of cfi_cmdset_0002.c to 1.94.
>
> There's no reason why you can't revert to 1.94 yourself.
>
> FWIW, I'm now of the opinion that chip_status() is definately broken for
> interleaved chips and probably cannot be made to work without ending up
> with a mess.
>
> I would suggest using the data polling algorithm instead (where
> applicable).
>
> Also, ignoring the internal flash timeout (DQ5 toggling) and instead
> relying on the software timeout might be acceptable.  However, a
> repeatedly suspended erase keeps getting its software timeout extended
> and thus there is a possibility of the software timeout never occuring.
>   Hmmm.  An internal timeout requires a chip reset and thus we can't
> actually suspend an internally timed-out erase so the software timeout
> won't be extended.
>
> David Vrabel
> --
> David Vrabel, Design Engineer
>
> Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
> Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
>
>
>
> ------------------------------
>
> Message: 5
> Date: Thu, 18 Mar 2004 11:56:47 +0100
> From: Thomas Gleixner <tglx@linutronix.de>
> Subject: Re: Bug in nand_select_chip?
> To: llandre <r&d@wawnet.biz>, David Woodhouse <dwmw2@infradead.org>
> Cc: Andrea Scian <andrea.scian@wawnet.biz>
> Message-ID: <200403181156.47289.tglx@linutronix.de>
> Content-Type: text/plain; charset=iso-8859-1
>
> On Thursday 18 March 2004 10:56, llandre wrote:
> > >That's correct, but you unfortunaly relied on code, which was in a heavy
> > >modifciation phase. If you use leading edge code, be aware, that things
> > > might be broken from time to time. The fix for this was committed 10
> > > days after the first rework.
> >
> > Ok, thanks for the advice.
> > To avoid such problems, is it possible to download "stable" releases? Are
> > they tagged in the CVS repository?
>
> Yep, but the NAND stuff is quite new and not always up to date in the
> stable versions.
>
> You can subscribe on the CVS mailinglist, which informs you of all changes
> in the repository.
> http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs
