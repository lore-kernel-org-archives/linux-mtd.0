Received: from n6-vm1.bullet.mail.in.yahoo.com ([202.86.4.133])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfZeH-0004fX-Sd
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 13:31:54 +0000
Message-ID: <83474.55755.qm@web94803.mail.in2.yahoo.com>
References: <4A9223BA.4020201@tataelxsi.co.in>
	<136203.4177.qm@web94808.mail.in2.yahoo.com>
	<4A923BC6.3000806@tataelxsi.co.in>
	<323485.33669.qm@web94802.mail.in2.yahoo.com>
	<4A92624A.9030801@tataelxsi.co.in>
Date: Mon, 24 Aug 2009 19:01:47 +0530 (IST)
From: Radha Mohan <radhamohan_ch@yahoo.com>
Subject: Re: Unale to  get MTD device info
To: Rahanesh <rahanesh@tataelxsi.co.in>
In-Reply-To: <4A92624A.9030801@tataelxsi.co.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=0A=0AEven I do not know many things regarding your queries but I will t=
ry to tell what I know. Maybe someone from this group can add.=0A=0A>I thou=
ght Flashes are block devices. How come we treat this as char =0A>devices? =
Why should we treat as char device?=0ATo mount a filesystem and all you nee=
d the devices as block device so I think mtdblock is for this. Using char d=
evice method you can directly=0Acontrol the MTD device like a RAM and there=
 are some ioctls. But I think the read,write calls will of both will be eve=
ntually calling underlying MTD device=0Adriver's read and write.=0A=0A>why =
minor mumber should be incremented by  2?=0A  I do not know why the minor n=
umber is increment by 2. Maybe this is how it is in the char implementation=
 inside kernel=0A=0A>What happens when we do a mknod /dev/mtd0 c 90 0?=0A  =
 this is how we create device nodes for any device type in linux. Search ab=
out this in google.=0A=0A>Do we need to do anything with the /dev/mtdblock0=
 while erasing and =0A>reflashing ?=0A I do not think so.=0A=0A-- Mohan=0A=
=0A=0A=0A----- Original Message ----=0AFrom: Rahanesh <rahanesh@tataelxsi.c=
o.in>=0ATo: Radha Mohan <radhamohan_ch@yahoo.com>=0ACc: linux-mtd@lists.inf=
radead.org=0ASent: Monday, 24 August, 2009 3:20:02 PM=0ASubject: Re: Unale =
to  get MTD device info=0A=0AHi Mohan,=0A=0AThat was really very helpful..=
=0A=0AAfter doing this i am nw able to erase flash.=0A=0AFew doubts:=0A=0AI=
 thought Flashes are block devices. How come we treat this as char =0Adevic=
es? Why should we treat as char device?=0A=0Awhy minor mumber should be inc=
remented by  2?=0A=0AWhat happens when we do a mknod /dev/mtd0 c 90 0?=0A=
=0ADo we need to do anything with the /dev/mtdblock0 while erasing and =0Ar=
eflashing ?=0A=0AThanks=0ARahanesh=0A=0A=0ARadha Mohan wrote:=0A> Hi,=0A>=
=0A> Create char mtd devices=0A>=0A> mknod /dev/mtd0 c 90 0=0A> mknod /dev/=
mtd1 c 90 2=0A> ..=0A> ..=0A> Note that the minor number increments by 2.=
=0A> Before that you will need to confirm whether CONFIG_MTD_CHAR is set in=
 your kernel or not. This will enable char device access=0A> to your mtdblo=
ck device. Or else you will not be able to write to mtd0 char device.=0A>=
=0A> You can erase and copy anything to the mtd devices. You can use "flash=
cp" from the mtd-utils. Else you can write your own code to write to=0A> th=
e flash. You can take help of the flashcp code in mtd-utils. =0A>=0A> -- Mo=
han=0A>=0A> ________________________________=0A> From: Rahanesh <rahanesh@t=
ataelxsi.co.in>=0A> To: Radha Mohan <radhamohan_ch@yahoo.com>=0A> Cc: linux=
-mtd@lists.infradead.org=0A> Sent: Monday, 24 August, 2009 12:35:42 PM=0A> =
Subject: Re: Unale to  get MTD device info=0A>=0A> Hi Radha Mohan ,=0A>=0A>=
 Thanks a lot for responding.=0A>=0A> I have few doubts regarding your repl=
y.=0A>=0A> In the /dev/ partition of Linux i cannot see any mtd char device=
.. Only =0A> mtdblock is there.=0A>=0A> Can i convert the block devices to c=
haracter devices? if so how?=0A>=0A> Is it possible for me to erase mtdbloc=
k0 and copy to mtdblock0 using any =0A> other utilities?=0A>=0A> I am a new=
bie to all this. Please give your valuable suggestions=0A>=0A> Thanks=0A> R=
ahanesh=0A>=0A>=0A> Radha Mohan wrote:=0A>  =0A>> hi rahanesh,=0A>>=0A>> Th=
e mtd-utils do not work on block devices like mtdblock0. Use mtd0 =0A>> ins=
tead. The mtd0 is char device of mtdblock0.=0A>>=0A>> -- Mohan=0A>>=0A>> --=
----------------------------------------------------------------------=0A>>=
 *From:* Rahanesh <rahanesh@tataelxsi.co.in>=0A>> *To:* linux-mtd@lists.inf=
radead.org=0A>> *Sent:* Monday, 24 August, 2009 10:53:06 AM=0A>> *Subject:*=
 Unale to get MTD device info=0A>>=0A>> Hi all,=0A>>=0A>> I have four mtdbl=
ocks in my flash .=0A>> mtdblock0 -> Primary bootloader=0A>> mtdblock1 -> u=
boot=0A>> mtdblock2 -> JFFS=0A>> mtdbloack3-> config=0A>>=0A>> During Linux=
 booting , it mounts mtdblock2 to a temp folder which can =0A>> be seen as =
a part of ramdisk(root file system of linux)=0A>>=0A>> Now from Linux i nee=
d to flash a new jffs image to mtdblock2 itself.=0A>>=0A>> With the support=
 from this mailing list i have copied mtd-utilities =0A>> package into Linu=
x. Now i have flash_eraseall and flash_cp commands.=0A>>=0A>> But when i ru=
n flash_eraseall  i gett the following error=0A>>=0A>>=0A>> flash_eraseall:=
 /dev/mtdblock1: *unable to get MTD device info=0A>>=0A>> *Please help on t=
his!!!!!!!=0A>>=0A>> Thanks=0A>> Rahanesh=0A>>=0A>>=0A>>=0A>>=0A>> ________=
______________________________________________=0A>> Linux MTD discussion ma=
iling list=0A>> http://lists.infradead.org/mailman/listinfo/linux-mtd/=0A>>=
=0A>> ---------------------------------------------------------------------=
---=0A>> Looking for local information? Find it on Yahoo! Local =0A>> <http=
://in.rd.yahoo.com/tagline_local_1/*http://in.local.yahoo.com/>=0A>>    =0A=
>=0A>=0A>       See the Web's breaking stories, chosen by people like you. =
Check out Yahoo! Buzz. http://in.buzz.yahoo.com/=0A>=0A>=0A> ______________=
________________________________________=0A> Linux MTD discussion mailing l=
ist=0A> http://lists.infradead.org/mailman/listinfo/linux-mtd/=0A>=0A>  =0A=
=0A=0A      Looking for local information? Find it on Yahoo! Local http://i=
n.local.yahoo.com/
