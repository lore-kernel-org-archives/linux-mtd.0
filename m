Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Vfs4-0005aZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2003 22:37:24 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: m.neiger@synergie-inf.com,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: 16 NANDS
Date: Tue, 7 Jan 2003 12:03:48 +1300
References: <515CABE7496FD111AA3300201829FCBE3552DD@archie.gsi.synergie-inf.com>
In-Reply-To: <515CABE7496FD111AA3300201829FCBE3552DD@archie.gsi.synergie-inf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20030106230808.9E85F439D@tiger.actrix.co.nz>
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

I believe Thomas has this on his TBD list, but - like everyone - he is rather 
busy so it might take a while before this comes to the top of his priority 
list. 

Hey why not give it a shot? One way to get experience is to just jump in 
(especially on something like this which looks relatively simple). There are 
many nice people in mtd land who will provide support.

-- CHarles


On Tue, 07 Jan 2003 11:42, Marc Neiger wrote:
> Hi Charles,
>
> Of course you properly understood I forgot to type "16bits wide".
>
> I was thinking about products such as Samsung K9F5616U0B wich is a 256Mbit
> NAND flash. Page size is 512 + 16 OOB bytes. So the problem is just
> regarding the data transfer width as the page size are the same as the
> already supported chips/architectures. Moreover it is quite complicated as
> the commands and addresses are still transfered as 8 bits, only data are
> transfered as 16bits.
>
> However, as a newcomer in the embbeded linux world, and although I feel
> like it should be quite simple, I don't feel like doing the software
> modification myself...
>
> Cheers,
> Marc Neiger
>
> > -----Message d'origine-----
> > De : Charles Manning [mailto:manningc2@actrix.gen.nz]
> > Envoyé : lundi 6 janvier 2003 22:15
> > À : m.neiger@synergie-inf.com; 'linux-mtd@lists.infradead.org'
> > Objet : Re: 16 NANDS
> >
> >
> > By this I expect you mean the NAND chips with a 16-bit wide interface.
> >
> > There are really two sub-issues:
> > * Hook-up to the chips themselves (ie. doing x16 instead of
> > x8 trasfers).
> > * The 16-bit wide chips have larger pages and blocks (2kB
> > pages, 128kB
> > blocks) than the previous generation stuff. This needs to be
> > handled too at
> > both the mtd and file system level. I believe (but don't
> > quote me) that JFFS2
> > will work as it is now. YAFFS is currently undergoing
> > extensions/mods to
> > support the larger pages/blocks.
> >
> > -- Charles
> >
> > On Fri, 03 Jan 2003 23:27, Marc Neiger wrote:
> > > Hi,
> > >
> > > what are the current status/plan regarding the use of 16 NAND Flash,
> > > including with JFFS2
> > >
> > > Cheers and happy new year,
> > > Marc Neiger
> > >
> > > Marc Neiger
> > >
> > >
> > >
> > > ______________________________________________________
> > > Linux MTD discussion mailing list
> > > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
