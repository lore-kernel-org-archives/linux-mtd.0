Received: from mail-io0-x233.google.com ([2607:f8b0:4001:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvbVO-00022U-Tn
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2018 04:58:00 +0000
Received: by mail-io0-x233.google.com with SMTP id r196-v6so9488405iod.0
 for <linux-mtd@lists.infradead.org>; Thu, 30 Aug 2018 21:57:47 -0700 (PDT)
MIME-Version: 1.0
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
Date: Fri, 31 Aug 2018 10:27:46 +0530
Message-ID: <CAG6enPzUygjG5taj04g=zrmV-HooPp_kSADFgJkxFs3C2u07Rg@mail.gmail.com>
Subject: Query Regarding NOR flash page size calculation s25fl512s
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have query and concern regarding page_size calculation for the
underlying NOR flashes.

I have spansion, =E2=80=98s25fl512s=E2=80=99 flash connected on my target.

With SFDP param reading, page_size for this flash is assigned as 0x200
using below routine.
   /* Page size: this field specifies 'N' so the page size =3D 2^N bytes. *=
/
   params->page_size =3D bfpt.dwords[BFPT_DWORD(11)];
   params->page_size &=3D BFPT_DWORD11_PAGE_SIZE_MASK;
   params->page_size >>=3D BFPT_DWORD11_PAGE_SIZE_SHIFT;
   params->page_size =3D 1U << params->page_size;

As per the BG of S25FS512S_512_M flash and SFDP header info table
above calculation are correct.

But final value of the page_size for this flash is depends on the
configuration register CR3V[4], page buffer wrap, it can be either of
256 byte (0) or 512 byte (1).

For my case, this value is 0 and page_size becomes 0x100 bytes but
with SFDP header read, value for this is being assigned as 0x200.
Due to this, I am getting data corruption.

Please suggest, how can we check and proceed in these case. I guess
this is specific to spansion family of flashes.

IMO, for this flash we need to add flag SPI_NOR_SKIP_SFDP for entry of
this flash, s25fl512s.


Regards,
Yogesh
