Received: from juicer13.bigpond.com ([139.134.6.21] helo=mailin1.bigpond.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MPGw-0000UC-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2001 08:27:59 +0100
Received: from adsl ([139.134.4.58]) by mailin1.bigpond.com
          (Netscape Messaging Server 4.15) with SMTP id GGLX8W00.5EH for
          <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2001 17:38:56 +1000
Reply-To: <cabcam@optusnet.com.au>
From: "Colin Durey" <cabcam@optusnet.com.au>
To: "MTD List Admin (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Recovery of crashed DoC???
Date: Tue, 17 Jul 2001 17:34:33 +1000
Message-ID: <000901c10e92$eca169e0$4c418990@adsl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

I have a 40mb DoC which contains critical information that I really, really,
need to get hold of.
Linux fails to boot after discovering damaged blocks. The DoC is set as the
boot device on an embedded SBU (Advantech 4825).

Plugging in a floppy and booting DOS, then using the DoC utility DINFO.EXE
returns the following info:
Drive Name:  C:
Disk Size 40,072 kb
Software Version 1.10
TrueFFS Compatibility 3.3.2
Firmware size 48kb

which suggest that the chip is still alive, at least.

Is there any way in which to read the data files from the DoC?  I have been
told to use the utility DUPDATE.EXE to change the drive name to D: or
something other than C:, so that I can then connect another HD and boot it
as C: and then mount the DoC as a secondary drive and subsequently recover
the precious files. DUPDATE.EXE doesn't seem to want to let me do that.

Anyone know what to do?

Colin Durey
Cabcam - Tech Division
+61-2-96984711 (T)  +61-2-96984674 (F)
