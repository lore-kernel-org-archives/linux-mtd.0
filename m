Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdRfk-00068r-Ev
 for linux-mtd@lists.infradead.org; Wed, 01 Apr 2015 23:03:45 +0000
Received: by ierf6 with SMTP id f6so55969626ier.2
 for <linux-mtd@lists.infradead.org>; Wed, 01 Apr 2015 16:03:19 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 2 Apr 2015 12:03:18 +1300
Message-ID: <CAJMQpAesoRsuV8i0HnGNy63vmhHeULcXTh9aXnpBGM-HJ6cneA@mail.gmail.com>
Subject: GPMI driver ecc_write_page with oob data problem
From: Youxin Su <suyouxin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
[    0.993508] gpmi-nand 112000.gpmi-nand: enable the asynchronous EDO mode 5

Since the IMX6 only support up to 40bits ECC corrections, we don't
want all the OOB used by BCH for ECC correction data. So we enabled
"fsl,use-minimum-ecc" which is still use the max 40 bits corrections
in BCH, after set_geometry_by_ecc_info does the calculation, its end
up following geometry:

page_size = 8762
write_size = 8129
metadat_size = 10
auxiliary_size = 24
oob_free->offset = 570
oob_free->length = 174

Which means we do have 174 bytes free OOB area can be used by file
system. After a few days tracing and debugging I've found out the GPMI
driver method gpmi_ecc_write_page actually does not write oob data(the
174 bytes area) to NAND flash at all? The flags "oob_required" never
been used in the method.

Does anybody else used GPMI with OOB data read/write before? Does it
work fine or Am I missing something?

Best regards,
Youxin
