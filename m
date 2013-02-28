Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UAxBP-0003Tn-Hv
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 06:41:37 +0000
Received: from dbdp20.itg.ti.com ([172.24.170.38])
 by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1S6fWFf007040
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2013 00:41:33 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
 by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1S6fVG5023104
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2013 12:11:31 +0530 (IST)
From: "Gupta, Pekon" <pekon@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: NAND subpage write support interface
Date: Thu, 28 Feb 2013 06:41:31 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E99AFBE@DBDE01.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Need a suggestion, based on my understanding of following flow in NAND driv=
er:

MTD Writes: (Currently implemented)
nand_write [Interface]
    +-- nand_do_write_ops  [Internal]
              +-- chip->write_page   [Replacable]
                        +-- chip->ecc.write_page_raw  [Replaceable]
                        +-- chip->ecc.write_page [Replaceable]


MTD Read: (Currently implemented)
nand_read [Interface]
    +-- nand_do_read_ops  [Internal]
                +-- chip->ecc.read_page_raw  [Replaceable]
                +-- chip->ecc.read_subpage [Replaceable]
                +-- chip->ecc.write_page [Replaceable]


As per above, the 'MTD_Write' data-path is not same as 'MTD_Read'.
There is extra interface of  'chip->write_page', which was probably kept=20
for different programming modes on MLC/SLC nands.


My queries:=20
 (1) Going forward, Can the MLC and SLC programming sequence be merged=20
In generic 'nand_do_write_ops' ?=20
And 'chip->write_page' interface can be deprecated?
Currently I do not see any driver  except 'lpc32xx_mlc.c' using this interf=
ace.=20

--------------------------------------------------

MTD Writes: (with deprecated chip->write_page interface)
nand_write [Interface]
    +-- nand_do_write_ops  [Internal]
               +-- chip->ecc.write_page_raw  [Replaceable]
               +-- chip->ecc.write_page [Replaceable]

--------------------------------------------------


 (2) To add support for NAND subpage writes, I need to pass 'column' offset=
=20
also till chip->ecc.nand_subpage_write. So I need to either update existing=
=20
'chip->write_page' interface, =20
OR add a new interface 'chip->write_subpage' in parallel.

--------------------------------------------------

MTD Writes: (including chip->write_subpage in addition to chip->write_page)
nand_write [Interface]
    +-- nand_do_write_ops  [Internal]
              +-- chip->write_page   [Replacable]
                         +-- chip->ecc.write_page_raw  [Replaceable]
                         +-- chip->ecc.write_page [Replaceable]
              +-- chip->write_subpage_page   [Replacable]
                         +-- chip->ecc.write_subpage [Replaceable]

--------------------------------------------------

Please suggest which is approach is more scalable, and clean going forward.
(Apologies if the mail formatting was messed up)


with regards, pekon
