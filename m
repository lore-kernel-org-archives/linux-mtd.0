Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15FWGY-00009d-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2001 08:31:09 +0100
Received: from mail.com1.fr ([62.161.40.252])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15FWLd-00023I-00
	for linux-mtd@lists.infradead.org; Thu, 28 Jun 2001 08:36:22 +0100
Received: from MSTEMPIN (ns.com1.fr [62.161.40.253])
	by mail.com1.fr (8.9.3/8.9.3) with SMTP id JAA20689
	for <mtd@infradead.org>; Thu, 28 Jun 2001 09:36:10 +0200
From: "Michel Stempin" <mstempin@com1.fr>
To: "mtd" <linux-mtd@lists.infradead.org>
Subject: RE: Block device as MTD
Date: Thu, 28 Jun 2001 09:39:03 +0200
Message-ID: <NEBBLPFMELCDALFMOJILAEDGCGAA.mstempin@com1.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 8bit
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

Hi,

I found in the past some very good data sheets from SanDisk and Hitachi
(among others). Of course, they are not the original specs, but they provide
some very usefull application examples.

CF and PCMCIA flash are very similar in programming: both can be used either
as an IDE drive, or as a raw flash device. I don't remember if it's a pin
selection or an init command that triggers the mode change.

--
Michel Stempin
MIS
COM One SA, 11 parc de Marticot, 33610 CESTAS, FRANCE
Tel: +33(0)5 57 97 72 72
Fax: +33(0)5 56 78 84 78
Email: mstempin@com1.fr

> -----Message d'origine-----
> De : linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]De la part de Simon Evans
> Envoyé : jeudi 28 juin 2001 00:03
> À : Felix Radensky
> Cc : linux-mtd@lists.infradead.org
> Objet : Re: Block device as MTD
>
>
>
> Hi,
>
> Basically it wont work. blkmtd isnt actually a driver more a translation
> layer. If you want to talk to CF cards directly, you'll have to write an
> MTD driver for it. I dont know much about CF cards as I have always used
> them as IDE drives, but you may want to look at the PCMCIA utils memory_cs
> driver. I think CF cards can appear as regular PCMCIA flash memory cards
> until a bit is enabled that puts them into IDE mode.
>
> I tried a test once using the memory_cs driver on a CF and whilst it
> gave me some memory regions, they werent the correct size. Basically,
> you'll have to do some hacking around on the driver to get it to work
> but I dont know where to find specs for CF cards.
>
> the PCMCIA stuff is at http://pcmcia-cs.sourceforge.net/
>
> My next project is to write an MTD driver for PCMCIA flash cards
> (not CF) and if I get that working, im going to try and have a go at
> CF after that.
>
> cheers
> si
>
> >Hi,
> >
> >We have CF slot on our board, but no IDE controllers. Can I
> still use your
> >blkmtd.c driver to access CF ? If not, what approach should I take to
> >utilize
> >CF (adding IDE controller is not an option) ?
> >
> >Thanks in advance.
> >
> >Felix.
> >
> >
> >
> >______________________________________________________
> >Linux MTD discussion mailing list
> >http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
