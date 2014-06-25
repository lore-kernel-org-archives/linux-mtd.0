Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzgWi-0004pV-1b
 for linux-mtd@lists.infradead.org; Wed, 25 Jun 2014 06:17:49 +0000
Received: by mail-qa0-f53.google.com with SMTP id j15so1136473qaq.26
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2014 23:17:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE94FHGNHDVygoviGgEtE2ZDyumjwa73tZiDnEBdSnnWCE03YQ@mail.gmail.com>
References: <1403259137-22171-1-git-send-email-david@protonic.nl>
 <CAE94FHELXgoZ9Jm1E3_YT6D1SB=VAGWthZSjbsR+qqkUWn97PA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF6A08@DBDE04.ent.ti.com>
 <CAE94FHGNHDVygoviGgEtE2ZDyumjwa73tZiDnEBdSnnWCE03YQ@mail.gmail.com>
Date: Wed, 25 Jun 2014 14:17:26 +0800
Message-ID: <CAE94FHFvCoZyawRC=LL+PdBR3ig10crKJN6c_M_q=yGdOXnR9A@mail.gmail.com>
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

I backup the raw data to data2[] before doing elm_decode_bch_error_page();
Dump  code is as below. The raw data is the same with the correction
data that all more than 8 bit-flips.

The full data log is put as below but include some useless dump data.
https://drive.google.com/file/d/0BwVGpNFs7l22RmZXTHhJWXFYYWs/edit?usp=sharing


The K9F1G08U0E datasheet is also put as below.
https://drive.google.com/file/d/0BwVGpNFs7l22SUwtc3BPYTVyLWM/edit?usp=sharing


The datasheet say ECC requirement : 1 bit / 528bytes but I doubt what it say.



+static char data2[2048];
@@ -1298,12 +1308,17 @@ static int omap_elm_correct_data(struct
mtd_info *mtd, u_char *data,
        enum omap_bch_ecc type;
        bool is_error_reported = false;
        int err,bitflip_count;
+        char read_ecc2[52];
+        char calc_ecc2[52];
+
+        memcpy(read_ecc2, read_ecc, 52);
+        memcpy(calc_ecc2, calc_ecc, 52);
+        memcpy(data2, data, 2048);

@@ -1395,24 +1408,37 @@ static int omap_elm_correct_data(struct
mtd_info *mtd, u_char *data,
        err = 0;
        for (i = 0; i < eccsteps; i++) {
        if (err_vec[i].error_uncorrectable) {

+                          u_char *dat = &data[0];
+                          int k=0;
+                          for (k = 0; k < 512 ; k+=16)
+                                        printk("[0x%04x] 0x%08x
0x%08x 0x%08x 0x%08x \n",
+                                                k, *(int *)&dat[k],
*(int *)&dat[k+4], *(int *)&dat[k+8], *(int *)&dat[k+0xc]);
+
+                          dat = &data2[i*512];
+                          for (k = 0; k < 512 ; k+=16)
+                                        printk("[0x%04x] 0x%08x
0x%08x 0x%08x 0x%08x \n",
+                                                k, *(int *)&dat[k],
*(int *)&dat[k+4], *(int *)&dat[k+8], *(int *)&dat[k+0xc]);
+
                          printk("nand: uncorrectable bit-flips found\n");
                          err = -EBADMSG;
                 } else if (err_vec[i].error_reported) {


========after correction data (data[])

[    5.842346] [0x0000] 0xffffffff 0xffffefbf 0xffffffff 0xffffffff
[    5.848999] [0x0010] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.855651] [0x0020] 0xffffffff 0xffffffff 0xffffffff 0xfffffbef
[    5.862274] [0x0030] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.868927] [0x0040] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.875579] [0x0050] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.882232] [0x0060] 0xffffffff 0xffffffff 0xffffffff 0xfffff7ff
[    5.888854] [0x0070] 0xffffffff 0xffffffff 0xfffffffe 0xffffffff
[    5.895507] [0x0080] 0xffffffff 0xfffff7df 0xffffffff 0xffffffff
[    5.902160] [0x0090] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.908813] [0x00a0] 0xffffffff 0xffffffff 0xffffffff 0xffffbfff
[    5.915466] [0x00b0] 0xffffffff 0xffffffff 0xfffff7ff 0xffffffff
[    5.922088] [0x00c0] 0xffffffff 0xfffffffe 0xffffffff 0xffffffff
[    5.928741] [0x00d0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.935394] [0x00e0] 0xffffffff 0xffffffff 0xffffffff 0xffffffbf
[    5.942016] [0x00f0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.948669] [0x0100] 0xffffffff 0xffffffeb 0xffffffff 0xffffffff
[    5.955322] [0x0110] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.961975] [0x0120] 0xffffffff 0xffffffff 0xffffffff 0xfffffefd
[    5.968627] [0x0130] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.975280] [0x0140] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.982025] [0x0150] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    5.988739] [0x0160] 0xffffffff 0xffffffff 0xffffffff 0xffff3fff
[    5.995391] [0x0170] 0xffffffff 0xffffffff 0xffffff7f 0xffffffff
[    6.002014] [0x0180] 0xffffffff 0xfffffdff 0xffffffff 0xffffffff
[    6.008666] [0x0190] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.015319] [0x01a0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.021972] [0x01b0] 0xffffffff 0xffffffff 0xffffefff 0xffffffff
[    6.028625] [0x01c0] 0xffffffff 0xfffffeff 0xefffffff 0xffffffff
[    6.035278] [0x01d0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.041900] [0x01e0] 0xffffffff 0xffffffff 0xffffffff 0xffffff7f
[    6.048553] [0x01f0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff

=======raw data (data2[]) , before correction

[    6.065338] [0x0000] 0xffffffff 0xffffefbf 0xffffffff 0xffffffff
[    6.071960] [0x0010] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.078613] [0x0020] 0xffffffff 0xffffffff 0xffffffff 0xfffffbef
[    6.085266] [0x0030] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.091918] [0x0040] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.098571] [0x0050] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.105224] [0x0060] 0xffffffff 0xffffffff 0xffffffff 0xfffff7ff
[    6.111846] [0x0070] 0xffffffff 0xffffffff 0xfffffffe 0xffffffff
[    6.118499] [0x0080] 0xffffffff 0xfffff7df 0xffffffff 0xffffffff
[    6.125152] [0x0090] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.131774] [0x00a0] 0xffffffff 0xffffffff 0xffffffff 0xffffbfff
[    6.138427] [0x00b0] 0xffffffff 0xffffffff 0xfffff7ff 0xffffffff
[    6.145080] [0x00c0] 0xffffffff 0xfffffffe 0xffffffff 0xffffffff
[    6.151763] [0x00d0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.158416] [0x00e0] 0xffffffff 0xffffffff 0xffffffff 0xffffffbf
[    6.165069] [0x00f0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.171691] [0x0100] 0xffffffff 0xffffffeb 0xffffffff 0xffffffff
[    6.178375] [0x0110] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.185028] [0x0120] 0xffffffff 0xffffffff 0xffffffff 0xfffffefd
[    6.191680] [0x0130] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.198364] [0x0140] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.205017] [0x0150] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.211639] [0x0160] 0xffffffff 0xffffffff 0xffffffff 0xffff3fff
[    6.218292] [0x0170] 0xffffffff 0xffffffff 0xffffff7f 0xffffffff
[    6.224945] [0x0180] 0xffffffff 0xfffffdff 0xffffffff 0xffffffff
[    6.231597] [0x0190] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.238250] [0x01a0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.244873] [0x01b0] 0xffffffff 0xffffffff 0xffffefff 0xffffffff
[    6.251525] [0x01c0] 0xffffffff 0xfffffeff 0xefffffff 0xffffffff
[    6.258178] [0x01d0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
[    6.264831] [0x01e0] 0xffffffff 0xffffffff 0xffffffff 0xffffff7f
[    6.271453] [0x01f0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff

2014-06-23 16:15 GMT+08:00 Ted Juan <ted.juan@gmail.com>:
> Dear Pekon,
>
> Thanks help me to debug the issue.
>
> I need some time to reproduce the problem again since the NAND flash
> data have been covered.
>
> I add the test code to dump the data, so the data should be not the raw data.
> The dump data of last mail is erase page since I confirmed the value
> of the read_ecc2[].
> The problem not only happen in erase page, but also in some data page.
> The erase page is easily to observed for me.
> I'll try to read the raw data next time to verify the issue. Thanks much.
>
>
> @@ -1298,12 +1307,16 @@ static int omap_elm_correct_data(struct
> mtd_info *mtd, u_char *data,
>         enum omap_bch_ecc type;
>         bool is_error_reported = false;
>         int err,bitflip_count;
> +        char read_ecc2[52];
> +        char calc_ecc2[52];
> +
> +        memcpy(read_ecc2, read_ecc, 52);
> +        memcpy(calc_ecc2, calc_ecc, 52);
>
> @@ -1395,24 +1406,31 @@ static int omap_elm_correct_data(struct
> mtd_info *mtd, u_char *data,
>         err = 0;
>         for (i = 0; i < eccsteps; i++) {
>         if (err_vec[i].error_uncorrectable) {
> +#if 1 // debug
> +                          u_char *dat = &data[0];
> +                          int k=0;
> +                          for (k = 0; k < 512 ; k+=16)
> +                                        printk("[0x%04x] 0x%08x
> 0x%08x 0x%08x 0x%08x \n",
> +                                                k, *(int *)&dat[k],
> *(int *)&dat[k+4], *(int *)&dat[k+8], *(int *)&dat[k+0xc]);
> +
> +                                printk("i=%d read_ecc2=0x%08x 0x%08x
> 0x%08x calc_ecc2=0x%08x 0x%08x 0x%08x\n",
> +                                        i, *(int
> *)&read_ecc2[i*0xc+0], *(int *)&read_ecc2[i*0xc+4], *(int
> *)&read_ecc2[i*0xc+8],
> +                                        *(int *)&calc_ecc2[i*0xc+0],
> *(int *)&calc_ecc2[i*0xc+4], *(int *)&calc_ecc2[i*0xc+8]);
> +                                printk("nand: uncorrectable bit-flips
> found\n");
> +#endif
>                           err = -EBADMSG;
>                  } else if (err_vec[i].error_reported) {
>
>
> 2014-06-23 12:05 GMT+08:00 Gupta, Pekon <pekon@ti.com>:
>> Hi Ted,
>>
>>>Hi All,
>>>   I recently do the power cut test with this Samsung NAND flash
>>>K9F1G08U0E with TI AM3352 chip.
>>>I have set the NAND_NO_SUBPAGE_WRITE parameter and checked all the
>>>flash timing that are all correct.
>>>But it still happened uncorrectable error that bit-flip more than 8
>>>bits no matter erase page or not.
>>>The below is the wrong data with erase page that bit-flip more than 8 bits .
>>>
>>>Does anyone have the same experience?
>>>
>>>PS. The Samsung D-die SLC NAND is test OK in the same environment. And
>>>the TI driver code is base on the latest l2-mtd git tree.
>>>
>>>regards,
>>>Ted
>>>
>>>
>>>[    7.129791] [0x0000] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.136138] [0x0010] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.142486] [0x0020] 0xfbfdffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.148864] [0x0030] 0xffbfffff 0xffff7fff 0xffffffff 0xffffffff
>>>[    7.155212] [0x0040] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.161590] [0x0050] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.167938] [0x0060] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.174316] [0x0070] 0xf7ffffff 0xfffffcff 0xffffffff 0xffffffff
>>>[    7.180664] [0x0080] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.187042] [0x0090] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.193389] [0x00a0] 0xffbfffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.199737] [0x00b0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.206115] [0x00c0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.212463] [0x00d0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.218841] [0x00e0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.225189] [0x00f0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.231567] [0x0100] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.237915] [0x0110] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.244293] [0x0120] 0xffdfffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.250640] [0x0130] 0xffffffff 0xffff7fff 0xffffffff 0xffffffff
>>>[    7.256988] [0x0140] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.263366] [0x0150] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.269714] [0x0160] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.276092] [0x0170] 0xffffffff 0xffffffdf 0xffffffff 0xffffffff
>>>[    7.282440] [0x0180] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.288818] [0x0190] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.295166] [0x01a0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.301544] [0x01b0] 0xffffffff 0xffffdfff 0xffffffff 0xffffffff
>>>[    7.307891] [0x01c0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.314270] [0x01d0] 0xffffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.320617] [0x01e0] 0xbfffffff 0xffffffff 0xffffffff 0xffffffff
>>>[    7.326995] [0x01f0] 0xffffffff 0xfffff7af 0xffffffff 0xffffffff
>>>
>> Is this the dump of an erased page (with ECC correction),
>> I mean NAND raw read with ECC correction suppressed ?
>> If yes,
>> then if seems that the page was not properly erased, as so many
>> bit-flips should not be seen on a freshly erasing a block. plz check
>> device datasheet for "max possible bit-flips per page or block".
>>
>> If no,
>> Then this can be bit-flips introduced due to incorrect interpretation
>> of ECC syndrome, for that can you plz use below command to
>> dump raw page using below command.
>> nand dump -N -l <page_size> -f <output_file> <device>
>>
>>
>> with regards, pekon
