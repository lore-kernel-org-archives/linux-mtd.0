Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRRDk-0005ca-N1
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 16:55:38 +0000
Received: by laap9 with SMTP id p9so1000486laa.36
 for <linux-mtd@lists.infradead.org>; Mon, 07 May 2012 09:55:33 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 7 May 2012 18:55:33 +0200
Message-ID: <CADZ6=asqEUUe3zbZY+NE-Ew2e4Cymfnq+UqgmF2VHesBek3-XQ@mail.gmail.com>
Subject: Why kernel tasks for each MTD partition?
From: Thilo Fromm <fromm@dresearch-fe.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello *.*,

while playing around with mtdblock and blockrom (see my other mail[1])
I noticed that a separate kernel process is active for each "mtdblock"
partition (e.g. ps shows "[mtdblock0]", "[mtdblock1]" kernel processes
if you have two MTD partitions and you use mtdblock). These also exist
for my blockrom device nodes. Since I see comparable processes for all
storage on my Linux workstation I suppose the Linux storage stack runs
these. Can somebody please fill me in on what they are?

Also, more importantly, I notice accesses on all my device nodes (the
"blockrom" ones) upon system start originating from the corresponding
kernel process. However, the "mtdblock" nodes are not touched by their
kernel processes. How come?

Regards,
Thilo

[1] <http://comments.gmane.org/gmane.linux.drivers.mtd/41008>

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle
