Received: from nm12.bullet.mail.ne1.yahoo.com ([98.138.90.75])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P87Ud-0000SX-Uc
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2010 08:24:25 +0000
Message-ID: <968604.60195.qm@web120213.mail.ne1.yahoo.com>
References: <4CBCBA9D.4040202@jeppesens.com> <1287465154.1911.2.camel@brekeke>
Date: Tue, 19 Oct 2010 01:17:51 -0700 (PDT)
From: Karsten Jeppesen <arm9263@yahoo.com>
Subject: Re: Expanding UBI fs to maxavailable size
To: linux-mtd@lists.infradead.org
In-Reply-To: <1287465154.1911.2.camel@brekeke>
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

Hi Artem,=0A=0AThis is Karsten Jeppesen, just using an out-of-the-house acc=
ount,=0Aand thanks for your very quick reply.=0A=0AThe short answer to your=
 question about dmesg is: no messages at any point from =0AUBI whatsoever.=
=0A=0AHere is a more detailed answer:=0AThis part is executed on the develo=
pment machine which is a Fedora running on an =0Ax86:=0A[root@vserver09 ubi=
fs]# rm -rf work *.img 2>/dev/null=0A[root@vserver09 ubifs]# mkdir work=0A[=
root@vserver09 ubifs]# tar xzf /tftpboot/SKOV/armroot-stripped.tar.gz =0A--=
directory work=0A[root@vserver09 ubifs]# mkfs.ubifs --root=3Dwork --min-io-=
size=3D1 --leb-size=3D130944 =0A--max-leb-cnt=3D232 -o kjp.img -x zlib=0A[r=
oot@vserver09 ubifs]# ubinize -o ubi.img --min-io-size=3D1 --peb-size=3D131=
072 =0Aubinize.cfg=0Aubinize: volume size was not specified in section "kjp=
_ubi", assume minimum to =0Afit image "kjp.img"14272896 bytes (13.6 MiB)=0A=
=0AContent of ubinize.cfg is:=0A[kjp_ubi]=0Amode=3Dubi=0Aimage=3Dkjp.img=0A=
vol_id=3D0=0Avol_type=3Ddynamic=0Avol_name=3Drootfs=0Avol_flags=3Dautoresiz=
e=0A=0ANext part is executed on the target ARM 9263 with the 64MB FLASH fit=
ted, running =0Amy distribution (Fedora based) via NFS (so the FLASH is not=
 used)=0ALogging rerouted to console so it intermixes commands:=0Aubiformat=
: mtd4 (nor), size 63700992 bytes (60.8 MiB), 486 eraseblocks of 131072 =0A=
bytes (128.0 KiB), min. I/O size 1 bytes=0Alibscan: scanning eraseblock 485=
 -- 100 % complete=0Aubiformat: 485 eraseblocks have valid erase counter, m=
ean value is 0=0Aubiformat: 1 eraseblocks are supposedly empty=0Aubiformat:=
 use erase counter 0 for all eraseblocks=0Aubiformat: flashing eraseblock 1=
10 -- 100 % complete=0Aubiformat: formatting eraseblock 485 -- 100 % comple=
te=0A# ubiattach /dev/ubi_ctrl -m 4=0AUBI device number 0, total 486 LEBs (=
63638784 bytes, 60.7 MiB), available 0 LEBs =0A(0 bytes), LEB size 130944 b=
ytes (127.9 KiB)=0A# mkdir -p /skov/mnt/ubi=0A# mount -t ubifs ubi0:rootfs =
/skov/mnt/ubi=0A=0AAs of this point no messages has been received via syslo=
g from the UBI system=0A=0AHere comes what I don't like. Meaning that I can=
 see the rationale, but its not =0Awhat I hoped for:=0AUbinfo shows that ub=
iformat correctly=0A=0A# ubinfo -a=0AUBI version:                    1=0ACo=
unt of UBI devices:           1=0AUBI control device major/minor: 10:63=0AP=
resent UBI devices:            ubi0=0A=0Aubi0=0AVolumes count:             =
              1=0ALogical eraseblock size:                 130944 bytes, 12=
7.9 KiB=0ATotal amount of logical eraseblocks:     486 (63638784 bytes, 60.=
7 MiB)=0AAmount of available logical eraseblocks: 0 (0 bytes)=0AMaximum cou=
nt of volumes                 128=0ACount of bad physical eraseblocks:     =
  0=0ACount of reserved physical eraseblocks:  0=0ACurrent maximum erase co=
unter value:     1=0AMinimum input/output unit size:          1 byte=0AChar=
acter device major/minor:            251:0=0APresent volumes:              =
           0=0A=0AVolume ID:   0 (on ubi0)=0AType:        dynamic=0AAlignme=
nt:   1=0ASize:        482 LEBs (63115008 bytes, 60.2 MiB)=0AState:       O=
K=0AName:        rootfs=0ACharacter device major/minor: 251:1=0A=0ABut df r=
eveils that the rootfs partition still is only 25MB where I had surely =0Ah=
oped for near 64MB=0A# df -h=0AFilesystem                Size      Used Ava=
ilable Use% Mounted on=0A/dev/root               120.9G     43.8G     75.9G=
  37% /=0Anone                     61.3M         0     61.3M   0% /dev=0Ano=
ne                     61.3M    116.0K     61.2M   0% /var/run=0A/skov/dev/=
sdcard1         1.8G     34.9M      1.7G   2% /skov/mnt/data=0Aubi0:rootfs =
             25.0M     11.7M     13.3M  47% /skov/mnt/ubi=0A=0AIt seems lik=
e the autoresize flag says: OK - you made a 25MB partition and I =0Apacked =
this down at 13MB and now I will autoresize it to 25MB again. O - so you =
=0Ahave 64MB - Cool then you have additional useless empty space.=0A=0AI am=
 looking for: Ok - so I packed your partition to 13MB and format now shows =
=0Ame full 64 MB. I will autoresize to the 64MB.=0A=0A=0A=0A=0A=0A=0A=0A=0A=
=0A----- Original Message ----=0AFrom: Artem Bityutskiy <dedekind1@gmail.co=
m>=0ATo: Karsten Jeppesen <karsten@jeppesens.com>=0ACc: linux-mtd@lists.inf=
radead.org=0ASent: Tue, October 19, 2010 7:12:34 AM=0ASubject: Re: Expandin=
g UBI fs to maxavailable size=0A=0AOn Mon, 2010-10-18 at 23:22 +0200, Karst=
en Jeppesen wrote:=0A> Hi there,=0A> ....I think I found an error :-)=0A> =
=0A> I have an ARM platform with either 32 or 64MB FLASH, and I want to mak=
e =0A> an image that I can burn more or less directly (ie: not tar) into th=
e =0A> flash regardless if its the 32 or the 64MB edition.=0A> So I assumed=
 that is what the autoresize flag is about, but maybe I am =0A> wrong here.=
=0A> I can get ubiformat to burn the image to the flash, but subsequently t=
he =0A> filesystem doesn't expand to occupy the max available area.=0A> Wha=
t am I doing wrong - and how is it supposed to be achieved? Or is =0A> this=
 an error or a missing feature?=0A=0AWhat do you see in dmesg from UBI/UBIF=
S?=0A=0A-- =0ABest Regards,=0AArtem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=
=86=D0=BA=D0=B8=D0=B9 =D0=90=D1=80=D1=82=D1=91=D0=BC)=0A=0A=0A_____________=
_________________________________________=0ALinux MTD discussion mailing li=
st=0Ahttp://lists.infradead.org/mailman/listinfo/linux-mtd/=0A=0A=0A=0A    =
  
