Received: from mtiwmhc13.worldnet.att.net ([204.127.131.117])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192jiG-0008HH-Gg
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 04:23:56 +0100
From: "Gregg C Levine" <hansolofalcon@worldnet.att.net>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 7 Apr 2003 23:23:42 -0400
Message-ID: <000001c2fd7e$420dc320$90a0580c@who5>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Is this normal?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello from Gregg C Levine
As the subject says, "Is this normal?". I have a DOC-2000, installed
on an ISA based carrier board. I have also replaced its flakey M-SYS
firmware with the GRUB based one.
Since I have Lilo installed on the drive, as well as a currently
inactive grub, I half expected to see the Lilo multiple kernel boot
prompt. Instead I saw the grub menu that I have placed there. As it
happens I do not have an image placed on the DOC-2000.
Also, when I re-installed the card after removing it, it did the same
thing, and this filesystem is newer then the firmware. (An engineering
casualty occurred, and I needed to reinstall Linux on the drive.)

Now the question remains: Any suggestions, again, for constructing
that image to place on the DOC-2000? And how would I tell the computer
to boot it, or the resident hard drive?
-------------------
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )
