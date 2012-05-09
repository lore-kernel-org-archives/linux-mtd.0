Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SS2DJ-0006X7-4A
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 08:29:07 +0000
Received: by laap9 with SMTP id p9so5998laa.36
 for <linux-mtd@lists.infradead.org>; Wed, 09 May 2012 01:24:57 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 9 May 2012 10:24:57 +0200
Message-ID: <CADZ6=assx9zniZsw4feUh-D3HXjj+iBJuWidFOWc1o8Va-23Ww@mail.gmail.com>
Subject: mtd_blkdev.c: Why is .blksize a member of mtd_blktrans_ops instead of
 mtd_blktrans_dev?
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

Hello list,

I really don't see why .blksize (and .blkshift for that matter) is a
member of struct mtd_blktrans_ops. I feel like it should be in
mtd_blktrans_dev.

I'm asking because in our FTL I'd like to set blksize to the page size
of the underlying flash. I understand I could manipulate tr->blksize
and tr->blkshift in my add_mtd() callback implementation (because
these fields do not seem to be used beforehand by mtd_blkdevs.c
anyway), but it feels kind of hacky.

So why are blksize and blkshift members of the struct providing
callback functions of a device instead of the struct providing device
data?

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle
