Received: from mail-qc0-x235.google.com ([2607:f8b0:400d:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WyzPt-0001bv-9l
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 08:15:54 +0000
Received: by mail-qc0-f181.google.com with SMTP id x13so5687079qcv.26
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jun 2014 01:15:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAF6A08@DBDE04.ent.ti.com>
References: <1403259137-22171-1-git-send-email-david@protonic.nl>
 <CAE94FHELXgoZ9Jm1E3_YT6D1SB=VAGWthZSjbsR+qqkUWn97PA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF6A08@DBDE04.ent.ti.com>
Date: Mon, 23 Jun 2014 16:15:30 +0800
Message-ID: <CAE94FHGNHDVygoviGgEtE2ZDyumjwa73tZiDnEBdSnnWCE03YQ@mail.gmail.com>
Subject: Re: [FRC] [PATCH] MTD: nand_base.c: Enable support for Samsung E-die
 SLC NAND
From: Ted Juan <ted.juan@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Jander <david@protonic.nl>,
 "sjhill@realitydiluted.com" <sjhill@realitydiluted.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Pekon,

Thanks help me to debug the issue.

I need some time to reproduce the problem again since the NAND flash
data have been covered.

I add the test code to dump the data, so the data should be not the raw data.
The dump data of last mail is erase page since I confirmed the value
of the read_ecc2[].
The problem not only happen in erase page, but also in some data page.
The erase page is easily to observed for me.
I'll try to read the raw data next time to verify the issue. Thanks much.


@@ -1298,12 +1307,16 @@ static int omap_elm_correct_data(struct
mtd_info *mtd, u_char *data,
        enum omap_bch_ecc type;
        bool is_error_reported = false;
        int err,bitflip_count;
+        char read_ecc2[52];
+        char calc_ecc2[52];
+
+        memcpy(read_ecc2, read_ecc, 52);
+        memcpy(calc_ecc2, calc_ecc, 52);

@@ -1395,24 +1406,31 @@ static int omap_elm_correct_data(struct
mtd_info *mtd, u_char *data,
        err = 0;
        for (i = 0; i < eccsteps; i++) {
        if (err_vec[i].error_uncorrectable) {
+#if 1 // debug
+                          u_char *dat = &data[0];
+                          int k=0;
+                          for (k = 0; k < 512 ; k+=16)
+                                        printk("[0x%04x] 0x%08x
0x%08x 0x%08x 0x%08x \n",
+                                                k, *(int *)&dat[k],
*(int *)&dat[k+4], *(int *)&dat[k+8], *(int *)&dat[k+0xc]);
+
+                                printk("i=%d read_ecc2=0x%08x 0x%08x
0x%08x calc_ecc2=0x%08x 0x%08x 0x%08x\n",
+                                        i, *(int
*)&read_ecc2[i*0xc+0], *(int *)&read_ecc2[i*0xc+4], *(int
*)&read_ecc2[i*0xc+8],
+                                        *(int *)&calc_ecc2[i*0xc+0],
*(int *)&calc_ecc2[i*0xc+4], *(int *)&calc_ecc2[i*0xc+8]);
+                                printk("nand: uncorrectable bit-flips
found\n");
+#endif
                          err = -EBADMSG;
                 } else if (err_vec[i].error_reported) {


2014-06-23 12:05 GMT+08:00 Gupta, Pekon <pekon@ti.com>:
> Hi Ted,
>
>>Hi All,
>>   I recently do the power cut test with this Samsung NAND flash
>>K9F1G08U0E with TI AM3352 chip.
>>I have set the NAND_NO_SUBPAGE_WRITE parameter and checked all the
>>flash timing that are all correct.
>>But it still happened uncorrectable error that bit-flip more than 8
>>bits no matter erase page or not.
>>The below is the wrong data with erase page that bit-flip more than 8 bits .
>>
>>Does anyone have the same experience?
>>
>>PS. The Samsung D-die SLC NAND is test OK in the same environment. And
>>the TI driver code is base on the latest l2-mtd git tree.
>>
>>regards,
>>Ted
>>
>>
>>[    7.129791] [0x0000] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.136138] [0x0010] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.142486] [0x0020] 0xfbfdffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.148864] [0x0030] 0xffbfffff 0xffff7fff 0xffffffff 0xffffffff
>>[    7.155212] [0x0040] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.161590] [0x0050] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.167938] [0x0060] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.174316] [0x0070] 0xf7ffffff 0xfffffcff 0xffffffff 0xffffffff
>>[    7.180664] [0x0080] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.187042] [0x0090] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.193389] [0x00a0] 0xffbfffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.199737] [0x00b0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.206115] [0x00c0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.212463] [0x00d0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.218841] [0x00e0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.225189] [0x00f0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.231567] [0x0100] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.237915] [0x0110] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.244293] [0x0120] 0xffdfffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.250640] [0x0130] 0xffffffff 0xffff7fff 0xffffffff 0xffffffff
>>[    7.256988] [0x0140] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.263366] [0x0150] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.269714] [0x0160] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.276092] [0x0170] 0xffffffff 0xffffffdf 0xffffffff 0xffffffff
>>[    7.282440] [0x0180] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.288818] [0x0190] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.295166] [0x01a0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.301544] [0x01b0] 0xffffffff 0xffffdfff 0xffffffff 0xffffffff
>>[    7.307891] [0x01c0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.314270] [0x01d0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.320617] [0x01e0] 0xbfffffff 0xffffffff 0xffffffff 0xffffffff
>>[    7.326995] [0x01f0] 0xffffffff 0xfffff7af 0xffffffff 0xffffffff
>>
> Is this the dump of an erased page (with ECC correction),
> I mean NAND raw read with ECC correction suppressed ?
> If yes,
> then if seems that the page was not properly erased, as so many
> bit-flips should not be seen on a freshly erasing a block. plz check
> device datasheet for "max possible bit-flips per page or block".
>
> If no,
> Then this can be bit-flips introduced due to incorrect interpretation
> of ECC syndrome, for that can you plz use below command to
> dump raw page using below command.
> nand dump -N -l <page_size> -f <output_file> <device>
>
>
> with regards, pekon
