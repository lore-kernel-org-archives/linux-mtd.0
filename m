Received: from web30207.mail.mud.yahoo.com ([209.191.69.54])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pn5TZ-0000YI-UB
	for linux-mtd@lists.infradead.org; Wed, 09 Feb 2011 08:32:39 +0000
Message-ID: <421430.70003.qm@web30207.mail.mud.yahoo.com>
Date: Wed, 9 Feb 2011 00:32:34 -0800 (PST)
From: Lars Michael <lh_post@yahoo.com>
Subject: mount ubi volume fails: No such device
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Mon, 2011-02-07 at 07:05 -0800, Lars Michael wrote:=0A> > UBI: scrubbe=
d PEB 863, data moved to PEB 1097 UBI warning:=0A> ubi_eba_copy_leb: read d=
ata back from PEB 1092 and it is different UBI=0A> error: wear_leveling_wor=
ker: error -22 while moving PEB 868 to PEB 1092=0A> UBI warning: ubi_ro_mod=
e: switch to read-only mode UBI error: do_work:=0A> work failed with error =
code -22 UBI error: ubi_thread: ubi_bgt0d: work=0A> failed with error code =
-22=0A> =0A> It says you that it wrote some date, then read it back, compar=
ed, and=0A> the data did not match. You need to start with validating your =
falash=0A> drivers - use mtd tests:=0A> =0A> http://www.linux-mtd.infradead=
.org/doc/general.html#L_mtd_tests=0A> =0A=0AThe speedtest, stresstest, read=
test, pagetest ran ok, but showing 1 bad eraseblock. I guess that is accept=
able?=0A=0AThe oobtest and subpagetest found 3 errors, see below. Does it e=
xplain=0Amy initial problem?=0A=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0Amtd_oobtest: MTD device: 0=0Amtd_oobtes=
t: MTD device size 1048576, eraseblock size 131072, page size 2048, count o=
f eraseblocks 8, pages per eraseblock 64, OOB size 64=0Amtd_oobtest: scanni=
ng for bad eraseblocks=0Amtd_oobtest: block 0 is bad=0Amtd_oobtest: scanned=
 8 eraseblocks, 1 are bad=0Amtd_oobtest: test 1 of 5=0Amtd_oobtest: erasing=
 whole device=0Amtd_oobtest: erased 8 eraseblocks=0Amtd_oobtest: writing OO=
Bs of whole device=0Amtd_oobtest: written 8 eraseblocks=0Amtd_oobtest: veri=
fying all eraseblocks=0Amtd_oobtest: error: verify failed at 0xa0000=0Amtd_=
oobtest: verified 8 eraseblocks=0Amtd_oobtest: test 2 of 5=0Amtd_oobtest: e=
rasing whole device=0Amtd_oobtest: erased 8 eraseblocks=0Amtd_oobtest: writ=
ing OOBs of whole device=0Amtd_oobtest: written 8 eraseblocks=0Amtd_oobtest=
: verifying all eraseblocks=0Amtd_oobtest: verified 8 eraseblocks=0Amtd_oob=
test: test 3 of 5=0Amtd_oobtest: erasing whole device=0Amtd_oobtest: erased=
 8 eraseblocks=0Amtd_oobtest: writing OOBs of whole device=0Amtd_oobtest: w=
ritten 8 eraseblocks=0Amtd_oobtest: verifying all eraseblocks=0Amtd_oobtest=
: verified 8 eraseblocks=0Amtd_oobtest: test 4 of 5=0Amtd_oobtest: erasing =
whole device=0Amtd_oobtest: erased 8 eraseblocks=0Amtd_oobtest: attempting =
to start write past end of OOB=0Amtd_oobtest: an error is expected...=0Amtd=
_oobtest: error occurred as expected=0Amtd_oobtest: attempting to start rea=
d past end of OOB=0Amtd_oobtest: an error is expected...=0Amtd_oobtest: err=
or occurred as expected=0Amtd_oobtest: attempting to write past end of devi=
ce=0Amtd_oobtest: an error is expected...=0Amtd_oobtest: error occurred as =
expected=0Amtd_oobtest: attempting to read past end of device=0Amtd_oobtest=
: an error is expected...=0Amtd_oobtest: error: read past end of device=0Am=
td_oobtest: attempting to write past end of device=0Amtd_oobtest: an error =
is expected...=0Amtd_oobtest: error occurred as expected=0Amtd_oobtest: att=
empting to read past end of device=0Amtd_oobtest: an error is expected...=
=0Amtd_oobtest: error: read past end of device=0Amtd_oobtest: test 5 of 5=
=0Amtd_oobtest: erasing whole device=0Amtd_oobtest: erased 8 eraseblocks=0A=
mtd_oobtest: writing OOBs of whole device=0Amtd_oobtest: written 7 eraseblo=
cks=0Amtd_oobtest: verifying all eraseblocks=0Amtd_oobtest: verified 7 eras=
eblocks=0Amtd_oobtest: finished with 3 errors=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0Amtd_subpagetest: MTD device=
: 0=0Amtd_subpagetest: MTD device size 1048576, eraseblock size 131072, pag=
e size 2048, subpage size 2048, count of eraseblocks 0, pages per erasebloc=
k 0, OOB size 64=0Amtd_subpagetest: scanning for bad eraseblocks=0Amtd_subp=
agetest: block 0 is bad=0Amtd_subpagetest: scanned 8 eraseblocks, 1 are bad=
=0Amtd_subpagetest: erasing whole device=0Amtd_subpagetest: erased 8 eraseb=
locks=0Amtd_subpagetest: writing whole device=0Amtd_subpagetest: written 8 =
eraseblocks=0Amtd_subpagetest: verifying all eraseblocks=0Amtd_subpagetest:=
 error: verify failed at 0xa0000=0Amtd_subpagetest: ------------- written--=
--------------=0A290a823d1a832f294f3a152962dc06ad94bbe2a0556a0c65921a9092c1=
b7106f=0A<cut>=0A0d4441159c41f58ff943fe9fc93847c9f6d46b283a2b27736d1381b18f=
37b4bc=0Amtd_subpagetest: -------------------------------------=0Amtd_subpa=
getest: verified 8 eraseblocks=0Amtd_subpagetest: erasing whole device=0Amt=
d_subpagetest: erased 8 eraseblocks=0Amtd_subpagetest: verifying all eraseb=
locks for 0xff=0Amtd_subpagetest: verified 8 eraseblocks=0Amtd_subpagetest:=
 writing whole device=0Amtd_subpagetest: written 8 eraseblocks=0Amtd_subpag=
etest: verifying all eraseblocks=0Amtd_subpagetest: error: verify failed at=
 0x40000=0Amtd_subpagetest: error: verify failed at 0xc0000=0Amtd_subpagete=
st: verified 8 eraseblocks=0Amtd_subpagetest: erasing whole device=0Amtd_su=
bpagetest: erased 8 eraseblocks=0Amtd_subpagetest: verifying all eraseblock=
s for 0xff=0Amtd_subpagetest: verified 8 eraseblocks=0Amtd_subpagetest: fin=
ished with 3 errors=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=0A=0A=0A=0A      
