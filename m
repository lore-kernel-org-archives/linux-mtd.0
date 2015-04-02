Received: from mail1.bemta12.messagelabs.com ([216.82.251.7])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdWuY-0000no-TX
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 04:39:23 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: Youxin Su <suyouxin@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Date: Thu, 2 Apr 2015 15:38:54 +1100
Subject: RE: GPMI driver ecc_write_page with oob data problem
Message-ID: <EACD232272DA4849B060F0828564D13B6EB7D55F5F@ntcex01.corp.netcomm.com.au>
References: <CAJMQpAesoRsuV8i0HnGNy63vmhHeULcXTh9aXnpBGM-HJ6cneA@mail.gmail.com>
In-Reply-To: <CAJMQpAesoRsuV8i0HnGNy63vmhHeULcXTh9aXnpBGM-HJ6cneA@mail.gmail.com>
Content-Language: en-AU
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

Hi Youxin,


I have only encountered the GPMI controller on the IMX28
processor, but I assume that it hasn't changed.

The GPMI controller is weird - it calculates ECC on small
subpages (512byte) at a time and *must* store / read
the ECC bytes immediately after the respective data block.

Since the controller does this on the fly, during DMA, you
can't influence the layout - all you transfer is the page
payload. The result is a strange physical layout in the NAND:

XX SPARE D512 ECC D512 ECC D512 ECC, etc.

In other words, ECC is interleaved with the data and
the whole thing spills over into the OOB. This interferes
with the bad block marker (first 2 bytes in OOB), so
the corresponding data bytes are set to 0 and relocated
into the 'XX' area above.

There is a little spare space at the beginning of the page
and maybe at the end of the OOB, but because everything
must be written in a single operation, you don't get to
write the OOB separately. So the MTD driver pretends
the OOB is read-only.

So, in summary, on the GPMI hardware, you can't have
OOB access independent of the data area. The driver
'solves' that by not giving you OOB access.

YAFFS2 inband tags are required.


Best regards,

Iwo


________________________________________
From: linux-mtd [linux-mtd-bounces@lists.infradead.org] On Behalf Of Youxin=
 Su [suyouxin@gmail.com]
Sent: Thursday, 2 April 2015 10:03 AM
To: linux-mtd@lists.infradead.org
Subject: GPMI driver ecc_write_page with oob data problem

Hello all,

I am attempting to mount Yaffs2 on a GPMI controlled NAND flash on
IMX6. Unfortunately, I'm not able to mount it with default settings,
instead I have to mount it with "inband-tags" which means don't use
OOB area on NAND page to store data.

Then I am running into check why yaffs2 can't use OOB area.

We use MICRON MT29F32G08CBADAWP it has 8192 bytes payload and 744
bytes OOB as log show below:

[    0.982938] nand: Micron MT29F32G08CBADAWP
[    0.987056] nand: 4096MiB, MLC, page size: 8192, OOB size: 744
[    0.993508] gpmi-nand 112000.gpmi-nand: enable the asynchronous EDO mode=
 5

Since the IMX6 only support up to 40bits ECC corrections, we don't
want all the OOB used by BCH for ECC correction data. So we enabled
"fsl,use-minimum-ecc" which is still use the max 40 bits corrections
in BCH, after set_geometry_by_ecc_info does the calculation, its end
up following geometry:

page_size =3D 8762
write_size =3D 8129
metadat_size =3D 10
auxiliary_size =3D 24
oob_free->offset =3D 570
oob_free->length =3D 174

Which means we do have 174 bytes free OOB area can be used by file
system. After a few days tracing and debugging I've found out the GPMI
driver method gpmi_ecc_write_page actually does not write oob data(the
174 bytes area) to NAND flash at all? The flags "oob_required" never
been used in the method.

Does anybody else used GPMI with OOB data read/write before? Does it
work fine or Am I missing something?

Best regards,
Youxin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
