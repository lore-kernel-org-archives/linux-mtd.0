Received: from nm18.bullet.mail.sp2.yahoo.com ([98.139.91.88])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4wc9-0006xm-JA
	for linux-mtd@lists.infradead.org; Wed, 30 Mar 2011 14:43:18 +0000
Message-ID: <581860.7993.qm@web114007.mail.gq1.yahoo.com>
Date: Wed, 30 Mar 2011 07:43:15 -0700 (PDT)
From: Jose Nimni <jose_nimni@yahoo.com>
Subject: UBI: why was UBI reboot notifier removed
To: Artem.Bityutskiy@nokia.com, cernekee@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

hi guys,=0A=0AI wanted to ask you a question regarding the change you made =
in UBI, when you =0Aremoved the UBI reboot notifier. (commit "UBI: remove r=
eboot notifier")=0A=0AI have omap3530 processor, working with numonyx NOR f=
lashe PF2800AP33EF (intel =0Acommand set).=0AI am working with linux omap k=
ernel 2.6.34, but patched it with the newest UBI =0Adirectory (i needed the=
 new patches for NOR PEBs).=0A=0Ai have seen that if i write a lot data to =
the NOR flash, 2 things happen:=0A1. UBIFS thread are flushing the data to =
the flash for quite some time.=0A2. ubi_bgt0d is working after that, cleani=
ng up some PEBs.=0A=0Aif i reboot just=A0after the write process returned, =
the flashed are unmounted =0A(after waiting for ubifs to finish flushing).=
=0Abut when the sigkills are sent,=A0 a UBI error is occuring:=0AUBI error:=
 ubi_io_read: error -5 while reading 64 bytes from PEB x:y, read 0 =0Abytes=
.=0AUBI error: nor_erase_prepare: cannot invalidate PEB X, write returned -=
5 read =0Areturned -5=0A....=0Aubi_thread: ubi_bgt0d: work failed with erro=
r code -5.=0A=0Aafter some research, i saw that you removed the UBI reboot =
notifier, that used =0Ato kill ubi_bgt thread.=0Anow,=A0during shutdown, th=
e cfi_cmdset_0001.c driver does not allow any =0Acommunication with the fla=
sh - but the bgt thread is still alive, so it gets a =0Aread/write error (-=
EIO).=0A=0AI am working with UBI that is compiled into the kernel - not as =
a module, so =0Amodule_exit isn't being called=0A=0Awho=A0should stop the b=
gt=A0threads?=0Aam i missing anything or is this a bug?=0A=0AThanks,=0AJose
