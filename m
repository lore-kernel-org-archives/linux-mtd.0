Received: from gate.epygi.de ([212.126.211.241] helo=epygi.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vxed-0000xH-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 10:47:39 +0100
Received: from pcstephan (pc-stephan.epygi.de [192.168.13.32])
	by epygi.de (8.11.2/8.11.2) with SMTP id g3C9llM29648
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 11:47:47 +0200 (METDST)
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Linux-Mtd" <linux-mtd@lists.infradead.org>
Subject: FW: Re: mapping of boot loader offset
Date: Fri, 12 Apr 2002 11:47:48 +0200
Message-ID: <FCEAKDJJAPHPLJFINDAJOECDCEAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

> -----Original Message-----
> From: Stephan Linke [mailto:Stephan.Linke@epygi.de]
> Sent: Donnerstag, 11. April 2002 18:50
> To: Tino Keitel
> Cc: Linux-Mtd-Admin           <---------- :o) oops
> Subject: RE: mapping of boot loader offset
> 
> 
> Hi!
> 
> You may probably fix it by using the mapping file for your mtd 
> driver. I mean the stuff placed in drivers/mtd/maps.
> 
> Here you have the chance to manipulate the addresses of the flash 
> access. You have to call the real access function of the actual 
> flash driver. So you could simply check the offset of the access 
> and if its above the "magic" address of your boot loader you 
> could add an additional offset. That's it. I didn't do that yet 
> and I think it's not the basic intantion of that mapping files. 
> (I think they should be used to split up flash areas, not to 
> connect them.) But I think it could work.
> 
> Maybe someone else has an "official" idea ;-). If not...
> 
> Regards, Stephan
> 
> > -----Original Message-----
> > From: linux-mtd-admin@lists.infradead.org
> > [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Tino Keitel
> > Sent: Donnerstag, 11. April 2002 16:30
> > To: linux-mtd@lists.infradead.org
> > Subject: mapping of boot loader offset
> > 
> > 
> > Hi folks,
> > 
> > I wonder what to do if a processor looks for its BIOS/loader at a 
> > specified
> > address that is somewhere in the middle of a flash chip. The same 
> > chip will
> > contain one JFFS2. The boot loader area will have to be mapped 
> out of the
> > file system. Is there already something that MTD can do for me?
> > 
> > Regards,
> > Tino
> > 
> > -- 
> > tino.keitel@innominate.com
> > dipl.-inf.                        Innominate Security Technologies AG
> > software engineer                                   networking people
> > tel: +49.30.6392-3308                      http://www.innominate.com/
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
