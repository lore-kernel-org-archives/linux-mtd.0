Received: from [195.41.59.254] (helo=rkbexch01.vws.vestas.dom)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CGwuv-0001hX-BT
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2004 05:56:41 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Oct 2004 11:56:04 +0200
Message-ID: <98223556A08BA64E8C969246704EEE3B17FE85@aarexch01.vws.vestas.dom>
From: "Esben Nielsen" <ESN@vestas.com>
To: <linux-mtd@lists.infradead.org>
Subject: Booting from DOC Millenium
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hya all,
 I see that Linux now have support for DOC Millenium(?). I have a PPC =
board here with 1 Mb NOR flash supposed to contain the bootsector and 64 =
DOC-M to hold the filesystem.

As I can see it I have the following options for booting:

1)  Have a small bootsector and used a compressed kernel in the 1Mb NOR. =
I don't like this solution, as I will only be able to have 1 kernel =
available. There is no room for a fall-back image if an update fails. I =
don't like this.

2) Get a bootsector which can read the kernel from the filesystem on the =
DOC.  Is there any such bootsector anywhere?

3) Go for a 3 stage boot: Have  a small bootsector which boots a small, =
never changed Linux kernel from the 1Mb NOR. That small kernel does one =
thing: read out the real kernel from the DOC. Do anyone have experience =
with such a strategy?

4) Use a small Linux as a bootsector. Compile the initial hardware setup =
in before decompression and instead of starting initrd make something =
like "kexec" to start the real, runtime kernel. Has anyone been playing =
with this?

Having to have a seperate bootsector for Linux is not very good. We =
otherwise use VxWorks here. In that context the bootsector is simply a =
scaled down version of VxWorks itself. I.e. we only have to worry about =
fitting one system to our hardware and just have to compile it in two =
versions. Last time I made Linux run on one of our boards (SA1110, NOR =
flash). I had to first to fit a bootsector, then fit Linux. Double work =
:-(

Regards,
Esben
