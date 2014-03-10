Received: from snecma9.snecma.fr ([217.108.170.9] helo=snecma10.snecma.fr)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WN4CG-0006ei-8v
 for linux-mtd@lists.infradead.org; Mon, 10 Mar 2014 17:41:04 +0000
MIME-Version: 1.0
Subject: Corrupt empty space
Date: Mon, 10 Mar 2014 18:35:27 +0100
Message-ID: <D2D3E4C4A672E847B422D1E5F695E1A402E61608@sreublc136.eu.labinal.snecma>
From: =?iso-8859-1?Q?HOUR_Fr=E9deric?= <frederic.hour@safran-engineering.com>
To: <linux-mtd@lists.infradead.org>
Content-class: urn:content-classes:message
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm working on UBIFS ( linux 3.3, omap138 ). I need some help with a proble=
m on a custom board (omapl138).
I have a software that runs in background and writes data in a UBIFS volume=
. I can not control when the power cut happens.
Sometimes, when booting my board, I got this "common" error:

UBI: background thread "ubi_bgt0d" started, PID 391
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 0, name "log"
UBIFS: file system size:=A0=A0 3174400 bytes (3100 KiB, 3 MiB, 25 LEBs)
UBIFS: journal size:=A0=A0=A0=A0=A0=A0 1015809 bytes (992 KiB, 0 MiB, 6 LEB=
s)
UBIFS: media format:=A0=A0=A0=A0=A0=A0 w4/r0 (latest is w4/r0)
UBIFS: default compressor: none
UBIFS: reserved for root:=A0 149934 bytes (146 KiB)
UBIFS: recovery needed
UBIFS error (pid 395): ubifs_scan: corrupt empty space at LEB 1534:125170
UBIFS error (pid 395): ubifs_scanned_corruption: corruption at LEB 1534:125=
170
00000000: ffffff7f ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ff=
ffffff=A0 ................................
00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ff=
ffffff=A0 ................................
[..]
UBIFS error (pid 395): ubifs_scan: LEB 1534 scanning failed

My NAND volume could not be mounted. My problem is that I want to have an a=
ccess to the files stored in this UBIFS volume.

So I had some questions : =

- What are the risk of commenting out the 'goto corrupted' in the fonction =
ubifs_scan? (in order to mount my partition and have an access to my files)
- Is this the "unstable bits issue"? (http://www.linux-mtd.infradead.org/do=
c/ubifs.html#L_unstable_bits) =

- What could be a proper solution to get my files?
- Is there a solution using U-Boot?

Thanks for your help.

Regards,

Frederic

#
" Ce courriel et les documents qui lui sont joints peuvent contenir des inf=
ormations confidentielles, =EAtre soumis aux r=E8glementations relatives au=
 contr=F4le des exportations ou ayant un caract=E8re priv=E9. S'ils ne vous=
 sont pas destin=E9s, nous vous signalons qu'il est strictement interdit de=
 les divulguer, de les reproduire ou d'en utiliser de quelque mani=E8re que=
 ce soit le contenu. Toute exportation ou r=E9exportation non autoris=E9e e=
st interdite Si ce message vous a =E9t=E9 transmis par erreur, merci d'en i=
nformer l'exp=E9diteur et de supprimer imm=E9diatement de votre syst=E8me i=
nformatique ce courriel ainsi que tous les documents qui y sont attach=E9s."
******
" This e-mail and any attached documents may contain confidential or propri=
etary information and may be subject to export control laws and regulations=
. If you are not the intended recipient, you are notified that any dissemin=
ation, copying of this e-mail and any attachments thereto or use of their c=
ontents by any means whatsoever is strictly prohibited. Unauthorized export=
 or re-export is prohibited. If you have received this e-mail in error, ple=
ase advise the sender immediately and delete this e-mail and all attached d=
ocuments from your computer system."
#
