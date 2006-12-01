Received: from web37906.mail.mud.yahoo.com ([209.191.91.168])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GqAxN-0006CX-Eg
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 11:09:48 -0500
Message-ID: <20061201160244.61917.qmail@web37906.mail.mud.yahoo.com>
Date: Fri, 1 Dec 2006 08:02:44 -0800 (PST)
From: syed khader <khader_s_s@yahoo.com>
Subject: Problems with AM29LV641DL flash
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi =0A   I am facing the following problems with a 16MB AM29LV641DL flash o=
n a 2.6.11.12 kernel on a arm-920t board.=0A  1) I was able to root mount j=
ffs2 successfully on a partition but when I create files in the partition I=
 see =0A" Node totlen on flash (0xffffffff) !=3D totlen from node ref (0x00=
000030) "=0Aerrors, even if I ensure that there are no unclean reboots. The=
se files are eventually lost on reboot.=0A     I am using a native flash ut=
ility through ICE to program the flash with a jffs2 image.=0A  2) When I tr=
ied to erase the jffs2 flash partition using "flash_eraseall"=0AI see no er=
rors, but when I remount jffs2 I see that it does not erase anything and  a=
ll the files are intact. =0A  3) My mtd debug log show me the following mes=
sages(when I try to create a file):=0A=0AMTD do_write_oneword(): WRITE 0x00=
3601d8(0x00006ee6)=0AMTD do_write_oneword(): NOP=0AMTD do_write_oneword(): =
WRITE 0x003601da(0x00007d26)=0AMTD do_write_oneword(): NOP=0ANode totlen on=
 flash (0xffffffff) !=3D totlen from node ref (0x00000030)=0AMTD do_write_o=
neword(): WRITE 0x003601fc(0x00001985)=0AMTD do_write_oneword(): NOP=0AMTD =
do_write_oneword(): WRITE 0x003601fe(0x0000c002)=0AMTD do_write_oneword(): =
WRITE 0x00360200(0x00000044)=0AMTD do_write_oneword(): NOP=0AMTD do_write_o=
neword(): WRITE 0x00360202(0x00000000) =0A=0A4) I feel it is not a problem =
with jffs2/mtd but something to do with hardware. But how can I confirm tha=
t it is not mtd driver problem?=0AAlso how can I ensure that flash_eraseall=
 has really deleted data from flash?=0A=0A=0A =0A__________________________=
__________________________________________________________=0ACheap talk?=0A=
Check out Yahoo! Messenger's low PC-to-Phone call rates.=0Ahttp://voice.yah=
oo.com
