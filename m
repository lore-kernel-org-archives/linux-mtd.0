Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeBlj-0001uf-ED
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2011 19:58:52 +0000
Received: by vxd3 with SMTP id 3so5547003vxd.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Jul 2011 12:58:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110617163442.204348a0@schlenkerla.am.freescale.net>
References: <BANLkTikyKObukzVw+c10HyDz+Q=PH4jozA@mail.gmail.com>
	<20110617163442.204348a0@schlenkerla.am.freescale.net>
Date: Tue, 5 Jul 2011 15:58:46 -0400
Message-ID: <CAPBSBxqRywJjCfk_iuDLxn1HbuqPjJRJS=SkRQ3-Ge7SinbSBg@mail.gmail.com>
Subject: Re: NAND BBT corruption on MPC83xx
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 17, 2011 at 5:34 PM, Scott Wood <scottwood@freescale.com> wrote=
:
>
> It seems that the generic code always passes -1 with PAGEPROG, and only
> provides the actual page address on SEQIN.
>
> I don't think the ECC readback is needed, and the fact that it looks like
> it has always been broken would seem to confirm that. =A0It's broken in
> other ways, too -- it assumes a particular ECC layout. =A0Let's get rid o=
f it.
>
> As for the corruption, could it be degradation from repeated reads of tha=
t
> one page?
>

I modified nanddump to do repeated reads, and compare the data
obtained from the first iteration with that obtained later (to detect
bit-flips).  I tried 3 different variations:

- one which reads the first page (2k) of the last block
- one which reads the second page (2k) of the last block
- one which reads the entire last block (128k), just for comparison

As I understand it, read-disturb would primarily come into play when
the second page is read, since it's adjacent to the first page (please
correct me if I'm wrong there).  Anyway, all 3 of these tests were run
for at least 50 million read cycles, with no bit-flips detected.  So
I'm somewhat doubtful that this is the cause of the BBT corruption
I've been seeing.

=3D=3D=3D=3D

Separately, I set up 2 test devices to run while I was away last week.
 One of them contained 2 patches:

- Mike Hench's patch which eliminates this block of code in fsl_elbc_nand.c
- Adam Thomson's patch
(http://lists.infradead.org/pipermail/linux-mtd/2011-June/036427.html)
which initializes oob_poi correctly

Upon my return, the device with these patches saw no problems at all,
and had no additional bad blocks.  The device without these patches
had some 200+ blocks which had been newly marked as bad in the BBT
over the course of 10 days.  After rebooting, this latter device then
failed to boot, as shown here:

http://mcreech.com/work/bbt-ecc-error4.txt

I'm currently running another test to verify which of the two patches
actually fixed this problem (which might take a few days), but it
seems like removing that block of code in fsl_elbc_nand.c is a good
idea.

--=20
Matthew L. Creech
