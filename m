Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q0aWV-00085B-Kd
	for linux-mtd@lists.infradead.org; Fri, 18 Mar 2011 14:19:28 +0000
Received: by wwc33 with SMTP id 33so3464357wwc.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Mar 2011 07:19:25 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 18 Mar 2011 19:49:25 +0530
Message-ID: <AANLkTi=hrqqOZEu8DF8jm9q0E44fRG5_y9j-sdnBorgP@mail.gmail.com>
Subject: UBI - EBA table (Erase block association table) - wear leveling
From: Navaneethan P <pnavanee@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: navaneethan.p@aricent.com, "shenbaga.nathan" <shenbaga.nathan@aricent.com>,
	Stefan.Bigler@keymile.com, Sundararajan.Somasundaram@aricent.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=A0Hi Linux-Mtd users,

We are using UBI over NAND Flash. I have the following dubts.

1) UBI stores the volume id table & EBA table in some PEB of the NAND Flash=
.
My assumption is that volume id table will always be stored in LEB
'X'. and UBI will go & read the information during initialization.
Is my undersatnding correct?

2) One of the assumption is that EBA table is always stored in an PEB.
Is my assumption correct?

3) I read from the wear leveling subsystem (wl.c), the maximum
difference between the erase counters of erase blocks will be
CONFIG_MTD_UBI_WL_THRESHOLD (defined as 4096).
If the difference exceeds then it will move the data from high EC
block to low EC block.
Let me take the case of PEB 'A' stores the EBA table. Because of the
writting to the flash, EC of PEB 'A' reaches to 4096. As per the
documentation, it has to be wear leveled to lower EC block. Let me
assume that this PEB is 'B'. My doubt is "In the next initialization,
how does the UBI understands that EBA is stored in PEB 'B' instead of
PEB 'A'?"

4) What happens when PEB which holds EBA table, becomes bad? At that
time, will system become unusable?

Please help us to clarify the doubt.
thanks in advance for helping us.

Regards,
Navaneethan
