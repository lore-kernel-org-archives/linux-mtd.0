Received: from [202.54.124.152] (helo=mailFA7.rediffmail.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Zol9-0006q5-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Feb 2002 07:50:52 +0000
Date: 10 Feb 2002 08:02:19 -0000
Message-ID: <20020210080219.17898.qmail@mailFA7.rediffmail.com>
MIME-Version: 1.0
From: "raja" <mahadoc@rediffmail.com>
Reply-To: "raja" <mahadoc@rediffmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: GRUB and DOC
Content-type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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

=0AHi,=0A=0A Thanks a lot for your explanation.=0AI've got a DOC which i am=
 able to format using doc121.exb=0Aand am able to mount and read write on i=
t.but unable to recognize it at the bootup.=0A =0A1. Is there any problem w=
ith IPL ROM ?=0A2. If I replace the firmware with GRUB will my DOC get reco=
gnized at bootup ?=0A=0Ai am probing into these possibilities now and i wou=
ld happy to get your suggestions on this issue.=0A=0A=0A=0A=0AOn Fri, 08 Fe=
b 2002 David Woodhouse wrote :=0A> On 7 Feb 2002, raja wrote:=0A> =0A> >  i=
 have a DiskOnChip 2000 and i have the firmware =0A> doc504.exb loaded in i=
t.=0A> >   i am new to this and I have a few elementary doubts.=0A> > =0A> =
> 1. Actually what does this firmware do inside the DOC =0A> ?=0A> =0A> The=
 firmware provides a BIOS extension, which allocates =0A> lots of sub-640K =
=0A> memory and installs an extra handler for the INT 13h =0A> disc service=
 =0A> interrupt. Using this, it pretends to be a hard drive =0A> for the be=
nefit of =0A> anything which uses the standard BIOS interfaces (i.e. =0A> D=
OS and =0A> bootloaders).=0A> =0A> > 2. Can this firmware be replaced with =
some other one =0A> (i.e. can i format=0A> > the DOC with some other open s=
ource firmwares )=0A> =0A> Yes. You can install the Grub bootloader in plac=
e of =0A> the M-Systems BIOS =0A> extension. Rather than installing an INT =
13h handler =0A> and continuing to let =0A> the machine boot as normal, it =
hooks the INT 18h =0A> bootstrap handler to =0A> start Grub instead of tryi=
ng to boot from floppy or INT =0A> 13h device as =0A> normal. Grub can driv=
e the DiskOnChip directly, without =0A> the assistance of =0A> the original=
 firmware extension, and hence boot a =0A> kernel from it.=0A> =0A> > 3. Ho=
w does the BIOS recognize the DOC (is BIOS =0A> recognition related to=0A> =
> firmware ) ?=0A> =0A> The DiskOnChip is mapped into the host memory in th=
e =0A> Upper Memory Blocks =0A> used for BIOS extensions - the first few by=
tes of it =0A> have the BIOS =0A> extension signature that has been defined=
 since the =0A> first IBM BIOS to =0A> persuade the BIOS to run extra stuff=
 at startup.=0A> =0A> > I will be grateful if you could clarify my intial =
=0A> doubts ( cause i am=0A> > stuck up with a DOC which has BIOS and firmw=
are =0A> problems)=0A> =0A> -- =0A> dwmw2=0A> =0A> =0A =0A
