Received: from [61.5.4.148] (helo=enterprise.terasign.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16tirp-00085U-00
	for <linux-mtd@lists.infradead.org>; Sat, 06 Apr 2002 06:36:04 +0100
Message-ID: <01C1DD64.091DCAA0@SENLIANG>
From: Sulung Chang <sulung@terasign.com>
To: 'Scott Kapu' <kapus1@yahoo.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: LILO booting (L 40 40 40)
Date: Sat, 6 Apr 2002 12:10:24 +0700
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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


Hi all,

	I'm new with mtd. Is it possible to boot without using any BIOS but =
replace it with DoCMillenium or DOC2000 with GRUB or 	LILO.=20

	Has anyone try that .... thanks


	Sulung

-----Original Message-----
From:	Scott Kapu [SMTP:kapus1@yahoo.com]
Sent:	Thursday, March 21, 2002 11:02 PM
To:	linux-mtd@lists.infradead.org
Subject:	LILO booting (L 40 40 40)

I was having a problem booting using the stock lilo.
I was getting "L 40 40 40 40 40 40 4"

lilo 22.2
After adding the following to lilo.conf;

disk=3D/dev/nftla
bios=3D0x80
disk=3D/dev/hda
bios=3D0x81
lba32
(dual booting from doc and hda)

Lilo appears to work...
Hope this helps someone out there

-Scott

__________________________________________________
Do You Yahoo!?
Yahoo! Movies - coverage of the 74th Academy Awards=AE
http://movies.yahoo.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
