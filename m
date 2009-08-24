Received: from n14-vm0.bullet.mail.in.yahoo.com ([202.86.5.219])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfTpD-0003t4-Sa
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 07:18:48 +0000
Message-ID: <323485.33669.qm@web94802.mail.in2.yahoo.com>
References: <4A9223BA.4020201@tataelxsi.co.in>
	<136203.4177.qm@web94808.mail.in2.yahoo.com>
	<4A923BC6.3000806@tataelxsi.co.in>
Date: Mon, 24 Aug 2009 12:48:41 +0530 (IST)
From: Radha Mohan <radhamohan_ch@yahoo.com>
Subject: Re: Unale to  get MTD device info
To: Rahanesh <rahanesh@tataelxsi.co.in>
In-Reply-To: <4A923BC6.3000806@tataelxsi.co.in>
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

=0AHi,=0A=0ACreate char mtd devices=0A=0Amknod /dev/mtd0 c 90 0=0Amknod /de=
v/mtd1 c 90 2=0A..=0A..=0ANote that the minor number increments by 2.=0ABef=
ore that you will need to confirm whether CONFIG_MTD_CHAR is set in your ke=
rnel or not. This will enable char device access=0Ato your mtdblock device.=
 Or else you will not be able to write to mtd0 char device.=0A=0AYou can er=
ase and copy anything to the mtd devices. You can use "flashcp" from the mt=
d-utils. Else you can write your own code to write to=0Athe flash. You can =
take help of the flashcp code in mtd-utils. =0A=0A-- Mohan=0A=0A___________=
_____________________=0AFrom: Rahanesh <rahanesh@tataelxsi.co.in>=0ATo: Rad=
ha Mohan <radhamohan_ch@yahoo.com>=0ACc: linux-mtd@lists.infradead.org=0ASe=
nt: Monday, 24 August, 2009 12:35:42 PM=0ASubject: Re: Unale to  get MTD de=
vice info=0A=0AHi Radha Mohan ,=0A=0AThanks a lot for responding.=0A=0AI ha=
ve few doubts regarding your reply.=0A=0AIn the /dev/ partition of Linux i =
cannot see any mtd char device. Only =0Amtdblock is there.=0A=0ACan i conve=
rt the block devices to character devices? if so how?=0A=0AIs it possible f=
or me to erase mtdblock0 and copy to mtdblock0 using any =0Aother utilities=
?=0A=0AI am a newbie to all this. Please give your valuable suggestions=0A=
=0AThanks=0ARahanesh=0A=0A=0ARadha Mohan wrote:=0A> hi rahanesh,=0A>=0A> Th=
e mtd-utils do not work on block devices like mtdblock0. Use mtd0 =0A> inst=
ead. The mtd0 is char device of mtdblock0.=0A>=0A> -- Mohan=0A>=0A> -------=
-----------------------------------------------------------------=0A> *From=
:* Rahanesh <rahanesh@tataelxsi.co.in>=0A> *To:* linux-mtd@lists.infradead.=
org=0A> *Sent:* Monday, 24 August, 2009 10:53:06 AM=0A> *Subject:* Unale to=
 get MTD device info=0A>=0A> Hi all,=0A>=0A> I have four mtdblocks in my fl=
ash .=0A> mtdblock0 -> Primary bootloader=0A> mtdblock1 -> uboot=0A> mtdblo=
ck2 -> JFFS=0A> mtdbloack3-> config=0A>=0A> During Linux booting , it mount=
s mtdblock2 to a temp folder which can =0A> be seen as a part of ramdisk(ro=
ot file system of linux)=0A>=0A> Now from Linux i need to flash a new jffs =
image to mtdblock2 itself.=0A>=0A> With the support from this mailing list =
i have copied mtd-utilities =0A> package into Linux. Now i have flash_erase=
all and flash_cp commands.=0A>=0A> But when i run flash_eraseall  i gett th=
e following error=0A>=0A>=0A> flash_eraseall: /dev/mtdblock1: *unable to ge=
t MTD device info=0A>=0A> *Please help on this!!!!!!!=0A>=0A> Thanks=0A> Ra=
hanesh=0A>=0A>=0A>=0A>=0A> ________________________________________________=
______=0A> Linux MTD discussion mailing list=0A> http://lists.infradead.org=
/mailman/listinfo/linux-mtd/=0A>=0A> --------------------------------------=
----------------------------------=0A> Looking for local information? Find =
it on Yahoo! Local =0A> <http://in.rd.yahoo.com/tagline_local_1/*http://in.=
local.yahoo.com/>=0A=0A=0A      See the Web&#39;s breaking stories, chosen =
by people like you. Check out Yahoo! Buzz. http://in.buzz.yahoo.com/
