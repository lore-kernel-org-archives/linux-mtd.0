Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdbcO-00061D-Rz
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 09:40:57 +0000
Received: by iedfl3 with SMTP id fl3so72439130ied.1
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2015 02:40:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EACD232272DA4849B060F0828564D13B6EB7D55F5F@ntcex01.corp.netcomm.com.au>
References: <CAJMQpAesoRsuV8i0HnGNy63vmhHeULcXTh9aXnpBGM-HJ6cneA@mail.gmail.com>
 <EACD232272DA4849B060F0828564D13B6EB7D55F5F@ntcex01.corp.netcomm.com.au>
Date: Thu, 2 Apr 2015 22:40:32 +1300
Message-ID: <CAJMQpAceAw8cS+mzMQbE-pk3dAQY7pQ5+z-C1o9i6x59QmG-GA@mail.gmail.com>
Subject: Re: GPMI driver ecc_write_page with oob data problem
From: Youxin Su <suyouxin@gmail.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Iwo,

Thank you for your explanation.

On 2 April 2015 at 17:38, Iwo Mergler <Iwo.Mergler@netcommwireless.com> wrote:
> Hi Youxin,
>
>
> I have only encountered the GPMI controller on the IMX28
> processor, but I assume that it hasn't changed.
>
> The GPMI controller is weird - it calculates ECC on small
> subpages (512byte) at a time and *must* store / read
> the ECC bytes immediately after the respective data block.
>
> Since the controller does this on the fly, during DMA, you
> can't influence the layout - all you transfer is the page
> payload. The result is a strange physical layout in the NAND:
>
> XX SPARE D512 ECC D512 ECC D512 ECC, etc.

I've read the data sheet and have a brief idea of this BCH layout
stuff. My question is why don't use SPARE area above as OOB area since
in IMX6 BCH controller can support SPARE size up to 255 bytes. DMA can
transfer this area if you make it bigger? What we need to do is just
prepare OOB data to this SPARE area.

>
> In other words, ECC is interleaved with the data and
> the whole thing spills over into the OOB. This interferes
> with the bad block marker (first 2 bytes in OOB), so
> the corresponding data bytes are set to 0 and relocated
> into the 'XX' area above.
>
> There is a little spare space at the beginning of the page
> and maybe at the end of the OOB, but because everything
> must be written in a single operation, you don't get to
> write the OOB separately. So the MTD driver pretends
> the OOB is read-only.

I am not really understand why pretends the OOB is read-only. In my
mind it's not read-only. The GPMI driver provided a gpmi_ecc_write_oob
method which MTD driver can use it to write OOB area separately. It
may use by file system when it only needs to read/write only OOB data
I believe.

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/nand/gpmi-nand/gpmi-nand.c?id=refs/tags/v4.0-rc6#n1326

Regards,
Youxin


> Sent: Thursday, 2 April 2015 10:03 AM
> To: linux-mtd@lists.infradead.org
> Subject: GPMI driver ecc_write_page with oob data problem
>
> Hello all,
>
> I am attempting to mount Yaffs2 on a GPMI controlled NAND flash on
> IMX6. Unfortunately, I'm not able to mount it with default settings,
> instead I have to mount it with "inband-tags" which means don't use
> OOB area on NAND page to store data.
>
> Then I am running into check why yaffs2 can't use OOB area.
>
> We use MICRON MT29F32G08CBADAWP it has 8192 bytes payload and 744
> bytes OOB as log show below:
>
> [    0.982938] nand: Micron MT29F32G08CBADAWP
> [    0.987056] nand: 4096MiB, MLC, page size: 8192, OOB size: 744
> [    0.993508] gpmi-nand 112000.gpmi-nand: enable the asynchronous EDO mode 5
>
> Since the IMX6 only support up to 40bits ECC corrections, we don't
> want all the OOB used by BCH for ECC correction data. So we enabled
> "fsl,use-minimum-ecc" which is still use the max 40 bits corrections
> in BCH, after set_geometry_by_ecc_info does the calculation, its end
> up following geometry:
>
> page_size = 8762
> write_size = 8129
> metadat_size = 10
> auxiliary_size = 24
> oob_free->offset = 570
> oob_free->length = 174
>
> Which means we do have 174 bytes free OOB area can be used by file
> system. After a few days tracing and debugging I've found out the GPMI
> driver method gpmi_ecc_write_page actually does not write oob data(the
> 174 bytes area) to NAND flash at all? The flags "oob_required" never
> been used in the method.
>
> Does anybody else used GPMI with OOB data read/write before? Does it
> work fine or Am I missing something?
>
> Best regards,
> Youxin
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
