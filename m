Received: from va-65-40-217-47.sta.embarqhsd.net ([65.40.217.47]
	helo=CVAEX1.VERTICAL.COM)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IZZoj-0007cF-DA
	for linux-mtd@lists.infradead.org; Sun, 23 Sep 2007 18:20:46 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Clobbered file after jffs2 mount
Date: Sun, 23 Sep 2007 18:20:40 -0400
Message-ID: <4DD3AF7ECBBC43409BA36508938D01851B0072@CVAEX1.VERTICAL.COM>
In-Reply-To: <03f301c7fd26$edcd5570$0260a8c0@p4p800>
From: "Jon Ringle" <JRingle@vertical.com>
To: "Brian T" <btuch@usa.net>,
	"David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday, September 22, 2007 10:43, Brian T wrote:
> Been reading this thread, and I was wondering what kind of hardware
this
> is running on? I remember running into something like this a few years
ago > on my companies own embedded hardware, and the cause turned out to
be a
> problem with an internal Multitech modem's firmware on the same bus
which > was interfering with reading the jffs2 file system.
>=20
> I would see many ( but not all ) of the sym links on the file system
> pointing to garbage links like syslogd ->
/m/m/m/m/m/m/m/s/s/s/s/e/e/e/
> and also other programs on the system would not run properly.  After a
> reboot they would be fine for days to weeks.
>=20
> Thought I would offer that up.

Brian, I find that quite interesting. This is on our companies own
hardware. We have an IXP455 in PCI option mode using an Intel
StrataFlash P30 that is on CS0 of the IXP's expansion bus. The PCI host
does perform some read-only access of the P30 flash via a PCI bus ->
Expansion bus -> P30 flash data path to read info such as serial number,
mac address and IP address of the IXP that is stored on the flash. We
know that sometimes when the PCI host does this, it happens to do so
when the IXP happens to be doing a write operation to flash, so the read
operation by the PCI host returns "garbage". This is ok, because the
data that the PCI host is reading is checksumed and all that the PCI
host needs to do is retry the read again later.

I've been pouring over the P30 datasheet flowcharts to see if there is
some race condition where a spurious flash read operation by the PCI
host could interfere with the way that the IXP reads the contents of
flash. So far, I haven't been able to find something like that.

How did you determine that the modem was causing your problem? It sure
sounds like similar symptoms.

I decided to create a script that allows me to scan all the files in the
jffs2 image and have found that when this problem doesn't appear in
sshd, that I see this in other files with the same replacement of either
0x00000023 or 0x00000073 on some 32 bit value. I've seen this now show
up in /etc/sshd_config and also /lib/libcrypto.so.0.9.7

When I get to the office tomorrow, I'll hook up the JTAG and try some of
the things that David suggested.

Jon
