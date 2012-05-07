Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRKh7-000892-7z
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 09:57:29 +0000
Received: by laap9 with SMTP id p9so647690laa.36
 for <linux-mtd@lists.infradead.org>; Mon, 07 May 2012 02:57:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1336379956-17052-1-git-send-email-github@thilo-fromm.de>
References: <1336379956-17052-1-git-send-email-github@thilo-fromm.de>
Date: Mon, 7 May 2012 11:57:26 +0200
Message-ID: <CADZ6=asxeFoKjoCYCRjWrsw2wOoDLJo8ro1+GJB-+oaCcOB_9Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] Blockrom: badblock-free RO MTD blockdev access
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

On 7 May 2012 10:39, Thilo Fromm <github@thilo-fromm.de> wrote:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0The blockrom MTD driver provides bad block fre=
e read access to MTDs via
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/blockromX device files. Bad blocks are au=
tomatically skipped upon read,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0and reading continues with the next good block=
.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0This allows for read-only filesystems to exist=
 in MTDs with bad blocks:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0usually the baddies are skipped when writing t=
he filesystem into MTD by
> =C2=A0 =C2=A0 =C2=A0 =C2=A0the tool performing the write (e.g. nandwrite)=
. To successfully mount
> =C2=A0 =C2=A0 =C2=A0 =C2=A0these filesystems, however, you will need a tr=
anslation layer that skips
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bad blocks upon read as well. blockrom is such=
 a translation layer.
>

Some remarks:
- moved bad block mapping table generation to driver initialisation time.
  Further optimization opportunities include e.g. doing table generation
  in the background (work queue or kernel task).
  The original driver did lazy block mapping, i.e. mapped when a block
  was accessed for the first time.
- driver handle already has "spare blocks" and "management blocks" fields
  which are currently unused but provide for addiition of a very simple
  scrubbing mechanism later on.

I understand that the main focus of the linux-mtd community is on
ubi_blk for generic r/w block access, one layer above MTD. I provide
this FTL for simple bad block-free r/o access directly on the MTD
level in the hope that it is useful for generic read-only FS. Comments
and suggestions are welcome.

I'm willing to put extra effort into blockrom should the linux-mtd
community be interested into a merge despite of ubi_blk.

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
