Received: from web41001.mail.yahoo.com ([66.218.93.0])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18G8bB-0007Vf-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 02:03:45 +0000
Message-ID: <20021125023343.82844.qmail@web41001.mail.yahoo.com>
Date: Mon, 25 Nov 2002 10:33:43 +0800 (CST)
From: =?big5?q?tin=20man=20chan?= <chantinman40@yahoo.com.hk>
Subject: Problem in using DOC2000
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=big5
Content-Transfer-Encoding: 8bit
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

Hello Gregg C Levine,

Here is my machine config.

motherboard model: PCA-6179
bios: Pheonix Bios
cpu: PIII 700MHz
ram: 512MB

Thanks.

William

Hello from Gregg C Levine
You will need to supply us with more information with
your project. Such
as, what motherboard does it use, and what
distribution you are using.
And yes it might be a conflict. The first IDE drive in
a Linux system,
is typically /dev/hda. Most DOCs are typically set to
/dev//hdd, so as
to use the IDE chain that the CD drive is attached to.
-------------------
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan
Kenobi )
(This company dedicates this E-Mail to Master Yoda )



> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-
> admin@lists.infradead.org] On Behalf Of tin man chan
> Sent: Saturday, November 23, 2002 10:54 AM
> To: linux-mtd@lists.infradead.org
> Subject: Problem in using DOC2000
>=20
> Hi,
>=20
> I have compiled a linux kernel 2.4.19 with mtd
driver
> built-in and wish to use such kernel to probe the
DOC
> and use the DOC to boot my PC later by transferring
> the kernel to DOC. However, after I insert the DOC
> chip to the socket and start my PC, the PC will hang
> in the booting message "Loading linux............."
>=20
> Is it related to my PC BIOS? Or IDE harddisk
conflict
> with DOC? Any comment or idea? Thanks.
>=20
> William
>=20
>=20
>=20
>=20
>
_________________________________________________________
> =A4H=AE=F0=A5=E6=A4=CD=BC=F6=BDu#9351
=B8=DC=A1u=A4=CD=A1v=B4N=A6=B3
> http://hk.yahoo.com/promotions/personals/9351
>=20
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/






_________________________________________________________
人氣交友熱線#9351 話「友」就有
http://hk.yahoo.com/promotions/personals/9351
