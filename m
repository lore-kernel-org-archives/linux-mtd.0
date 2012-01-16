Received: from nm12-vm3.bullet.mail.ne1.yahoo.com ([98.138.91.142])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rmlrs-00042i-1f
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 12:40:56 +0000
References: <1326376049.44121.YahooMailNeo@web121502.mail.ne1.yahoo.com>
 <1326630286.2201.3.camel@koala>
 <1326701907.78896.YahooMailNeo@web121503.mail.ne1.yahoo.com>
 <1326709475.14299.34.camel@sauron.fi.intel.com>
Message-ID: <1326717654.83444.YahooMailNeo@web121506.mail.ne1.yahoo.com>
Date: Mon, 16 Jan 2012 04:40:54 -0800 (PST)
From: Karsten Jeppesen <arm9263@yahoo.com>
Subject: Re: Corrupted UBIFS, bad CRC
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1326709475.14299.34.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: Karsten Jeppesen <arm9263@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,=0A=0AOO something bad happened here. We must have lost track of e=
ach other.=0A=0AWhat I sent you was ***NOT*** produced by our standard 2.6.=
32.8 kernel.=0AI spent quite some efforts in adapting the new 3.2.0=A0 kern=
el.=0AI wrote that in my original email, but you may have drifted off to th=
e emails from November.=0ATo make life easier for you I assumed you would r=
ather look at data including the newest stuff rather than backported stuff.=
=0A=0ADebug was enabled and included as was any other information you asked=
 for in the submission template.=0AAnd again: This is kernel 3.2.0 and all =
nondestructive tests were run with no errors.=0A=0A=0AThe originating email=
s for this issue were both sent on Thusday January 12th 2012=0A=0AOther not=
es:=0AWe use 2 variants of FLASH - both NOR.=A0 Spansion 29GL256P and 29GL5=
12P=0AI found the datasheets and the 29GL256P says 32word/64 byte write buf=
fer and the 29GL512P says the same.=0AWhen I attach the FLASH all ubiattach=
 reports is:=0AUBI: attaching mtd4 to ubi0=0AUBI: physical eraseblock size:=
=A0=A0 131072 bytes (128 KiB)=0AUBI: logical eraseblock size:=A0=A0=A0 1309=
44 bytes=0AUBI: smallest flash I/O unit:=A0=A0=A0 1=0AUBI: VID header offse=
t:=A0=A0=A0=A0=A0=A0=A0=A0=A0 64 (aligned 64)=0AUBI: data offset:=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 128=0AUBI: max. sequence number:=A0=A0=
=A0=A0=A0=A0 17653=0AUBI: attached mtd4 to ubi0=0AUBI: MTD device name:=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "User"=0AUBI: MTD device size:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 28 MiB=0AUBI: number of good PEBs:=A0=A0=A0=A0=A0=A0=
=A0 230=0AUBI: number of bad PEBs:=A0=A0=A0=A0=A0=A0=A0=A0 0=0AUBI: number =
of corrupted PEBs:=A0=A0 0=0AUBI: max. allowed volumes:=A0=A0=A0=A0=A0=A0 1=
28=0AUBI: wear-leveling threshold:=A0=A0=A0 4096=0AUBI: number of internal =
volumes: 1=0AUBI: number of user volumes:=A0=A0=A0=A0 1=0AUBI: available PE=
Bs:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0=0AUBI: total number of reserved P=
EBs: 230=0AUBI: number of PEBs reserved for bad PEB handling: 0=0AUBI: max/=
mean erase counter: 31/5=0AUBI: image sequence number:=A0 1704669600=0AUBI:=
 background thread "ubi_bgt0d" started, PID 18731=0ABut no=A0 max_write_siz=
e was reported. I take it that UBI debug has to be enabled as well for the =
system to report that - right?=0A=0ASorry for the confusion about the 3.2.0=
 kernel as opposed to the earlier 2.6.32.8 but I was as I wrote trying to t=
ake the backporting out of the equation,=0A=0A=0AKarsten=0A=0A=0A=0A=0A=0A=
=0A=0A=0A----- Original Message -----=0AFrom: Artem Bityutskiy <dedekind1@g=
mail.com>=0ATo: Karsten Jeppesen <arm9263@yahoo.com>=0ACc: ubifs <linux-mtd=
@lists.infradead.org>=0ASent: Monday, January 16, 2012 11:24 AM=0ASubject: =
Re: Corrupted UBIFS, bad CRC=0A=0AOn Mon, 2012-01-16 at 00:18 -0800, Karste=
n Jeppesen wrote:=0A> Hi Artem,=0A> =0A> Of course I can. Anything I can do=
 to help.=0A> =0A> I put it on one of my outside servers and I put as well =
the /dev/mtd4 as the ubi0_0 you asked for:=0A> =0A> <http://download.gnist.=
skov.com/corrupt_mtd4_20120116.img>=0A> and=0A> <http://download.gnist.skov=
.com/ubi0_0_20120116.img>=0A=0AThanks.=0A=0AI've taken a look by using mtdr=
am. You have a strange corruption: 144=0Abytes of 0xFFs, then 32 bytes of z=
eroes, and then all 0xFFs. This looks=0Alike some oddity of your NOR flash.=
=0A=0AMy theory is that your flash has write buffer and its size is 256 or=
=0Alarger.=0A=0AAnyway, first of all - start with pulling the latest ubifs-=
v2.6.32 tree=0A- I've added few changes there very recently which fix UBI/U=
BIFS=0Adebugging messages.=0A=0AAlso, please, enable UIBFS debugging compil=
ation option.=0A=0AFrom now on I assume you have done this. Also I assume t=
hat you are=0Aaware that you need to look at dmesg to see all the UBIFS mes=
sages.=0AThere is some test in the MTD web site which explains this.=0A=0A=
=0ANext: if I hack UBIFS like this:=0A=0Adiff --git a/drivers/mtd/ubi/build=
.c b/drivers/mtd/ubi/build.c=0Aindex 6c3fb5a..58a49e7 100644=0A--- a/driver=
s/mtd/ubi/build.c=0A+++ b/drivers/mtd/ubi/build.c=0A@@ -691,6 +691,8 @@ sta=
tic int io_init(struct ubi_device *ubi)=0A=A0 =A0 =A0 =A0 ubi_assert(ubi->m=
in_io_size % ubi->hdrs_min_io_size =3D=3D 0);=0A=0A=A0 =A0 =A0 =A0 ubi->max=
_write_size =3D ubi->mtd->writebufsize;=0A+=A0 =A0 =A0  ubi->max_write_size=
 =3D 256;=0A+=0A=A0 =A0 =A0 =A0 /*=0A=A0 =A0 =A0 =A0  * Maximum write size =
has to be greater or equivalent to min. I/O=0A=A0 =A0 =A0 =A0  * size, and =
be multiple of min. I/O size.=0A=0AThen I can mount your image successfully=
.=0A=0AWhat is 'mtd->writebufsize' in your setup? You need to find out the=
=0Aright size and teach your driver to report it correctly.=0A=0AUBI report=
s max_write_size when you attach the MTD device. E.g., with=0Amtdram I have=
 the following:=0A=0A[493058.328443] UBI DBG (pid 18798): io_init: min_io_s=
ize=A0 =A0 =A0 1=0A[493058.328444] UBI DBG (pid 18798): io_init: max_write_=
size=A0  64=0A=0AWith my hack it is 256, of course. The mtdram module which=
 I use=0Ahard-codes it to 64.=0A=0A-- =0ABest Regards,=0AArtem Bityutskiy=
=0A
