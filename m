Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF551C3600B
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xfxw57svMfzU5SkWnF0xUUIQzc7nf9x0iIgr29YYibk=; b=aCfV+Gob9UPCaQ
	hLUMtjnkHLoMxBxyWtS/Ms6kmPJrZtuLAVoAOtj3pj+jTaeKzpNeqc1Uae5aq331rPB5wXpehwvKq
	Db0+6EG1htLyT8BbqwyAd+6XWDdSwW+xOmA0dTz5mpqZZ/DbFZodTxizC+YxQlkd4TIsjskKNYRGB
	+Rp/4IX6jehgcCuY/EClfdfDhxeG2MudYp/p2vf12q+qEKUvYRQ8cis3JCPVmBYfuaNAnH/Wf5skL
	WhPgIY9QhmipUWsccGepG/tfLeX9kfwDooLanburwh0Wsmf18N0IO/yJ7xrtyE4TlB732X32x1cjM
	sXlfR+MajehYCx1pXz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0L-0000000006d-2UrY;
	Mon, 31 Mar 2025 10:04:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBjM-0000000HYnT-3g55
	for linux-mtd@lists.infradead.org;
	Mon, 31 Mar 2025 09:46:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso32320495e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2025 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414415; x=1744019215; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gCmCfHgALkIn11bLlq11JsPex9XCVpiuT2YA0g7Yt20=;
        b=VxbS/Xqz9aEPAQWlaxx51m7769tF91QK8EKCtfG11pLzL9zKfrXmoCFZgC5RhGil05
         gyqAp+84AG81ufaqFKaqPFQeYRKAlkX7sz28JXl/PrYNDlgbXgAbU4a75j1N9OPkA4pu
         5FzlSNKXejzEboA6zdAxy5yGnSrHhAnPmBQ09fNDtz8eCFQgO0W+OUY+V3J7mtDuRG1L
         9irAFeF25DsdUgHYLmWsh4abFkkBRd3xeKZ2lN2e7YwPkm1Z7un6T5Fn0UoDXj/fYa1G
         5YanAku0plg5/PuQ5YePKkYgOGRuMvyPFMZUp77c+4lKI1f8Vy0E3cPYWA7bn5pGWC3c
         fEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414415; x=1744019215;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCmCfHgALkIn11bLlq11JsPex9XCVpiuT2YA0g7Yt20=;
        b=E3pqRdY1MgmGyeh0OG1wT2U8w3/MIYgb2i0cj/HucLS2FLUYUKgMFt/ASfB+a38Q45
         Zmnmhyy8sQOXCMo2rWtO0KL2l5SECeYp5GFoJDN9ej7YnmeOo0lQbIRHZYX/7tpayy3L
         PnIEGkXKIwg42Uk1LKXl6vvwGM4gwKGrBqm6G17kumKr2r8RKV2F0ugcKOOF407esSFx
         kBC3lZ0t6sjkT9a6roBaHsvGPDkQVQ/25Xlm2hVqysXzxX1fXXkKD7121Bc6Hul1p8cK
         a2M0IWFO8SoF6/Yi7c3Rgs8vET2TEk7oE7NGdtLPWrBNE9a4MogGY1N+3SV+nJ6SLP9h
         ESIw==
X-Gm-Message-State: AOJu0Yycvb4s30uwRt5O2SQs/4fw94hpnsGIfqFsBXd+3gq0FOO3eEIK
	dkm8JgclMBQ4Bw9jJkj/kPklgmTUiHqSi2CjcGLw7GmBrHdCrS0r0Fk3pjPVwHM=
X-Gm-Gg: ASbGnctlMN6vgRA5IOLnN4+Se3W2c1Y3SfHe70MDeSagF/MJ7f0YpDrExfsfBOC9ihb
	T1IIHwCc0TSGMJMrCFAHNRh+OON+lHaM9WWkshan0NLBUyNgByYnDd0CHfjO40XrKEJBlJML1m+
	asKafNsyuYukHhVFbaHyrZnN7s1wO+FWBU9zlsmVuuO9WJGdfx8Ag9OtGxZNOjRYhGkju4XObRi
	c6pDKW08aDh/PR+fSi2g2xq0Ti66wHfzry00CG4BBT3QimkQF0ne/9mHC6nPljL5tZFLTwSW+CR
	tWnvm18CPyq35yb19BUnpgogBNr+epdUVhENw08TxsP+uHpsOg==
X-Google-Smtp-Source: AGHT+IEXqC68QGiEq2w12Go6mcipaa/eX+DAMVb2jB6Hhlk0JDRZgpb7xSCIg1EqDTMW9A39XEm5/g==
X-Received: by 2002:a05:600c:83ce:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43db61d8310mr78354715e9.4.1743414415156;
        Mon, 31 Mar 2025 02:46:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d8fbc1716sm115108765e9.15.2025.03.31.02.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:46:54 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:46:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Artem B. Bityutskiy" <dedekind@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] UBI: Unsorted Block Images
Message-ID: <b2e341b8-519a-4136-9717-9aa00c90efb1@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_024656_922048_FEAA94F2 
X-CRM114-Status: GOOD (  17.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Artem B. Bityutskiy,

Commit 801c135ce73d ("UBI: Unsorted Block Images") from Jun 27, 2006
(linux-next), leads to the following Smatch static checker warning:

	drivers/mtd/ubi/vtbl.c:844 ubi_read_volume_table()
	warn: 'ubi->vtbl' can also be NULL

drivers/mtd/ubi/vtbl.c
    826                 if (av->leb_count > UBI_LAYOUT_VOLUME_EBS) {
    827                         /* This must not happen with proper UBI images */
    828                         ubi_err(ubi, "too many LEBs (%d) in layout volume",
    829                                 av->leb_count);
    830                         return -EINVAL;
    831                 }
    832 
    833                 ubi->vtbl = process_lvol(ubi, ai, av);
                        ^^^^^^^^^^^^^^^^^^^^^^^^
If process_lvol() returns a NULL then it leads to a crash.

    834                 if (IS_ERR(ubi->vtbl))
    835                         return PTR_ERR(ubi->vtbl);
    836         }

The process_lvol() function looks like this:

drivers/mtd/ubi/vtbl.c
   351  /**
   352   * process_lvol - process the layout volume.
   353   * @ubi: UBI device description object
   354   * @ai: attaching information
   355   * @av: layout volume attaching information
   356   *
   357   * This function is responsible for reading the layout volume, ensuring it is
   358   * not corrupted, and recovering from corruptions if needed. Returns volume
   359   * table in case of success and a negative error code in case of failure.

As I read it, this comment says that it returns error pointers or valid.

   360   */
   361  static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
   362                                              struct ubi_attach_info *ai,
   363                                              struct ubi_ainf_volume *av)
   364  {
   365          int err;
   366          struct rb_node *rb;
   367          struct ubi_ainf_peb *aeb;
   368          struct ubi_vtbl_record *leb[UBI_LAYOUT_VOLUME_EBS] = { NULL, NULL };
   369          int leb_corrupted[UBI_LAYOUT_VOLUME_EBS] = {1, 1};
   370  
   371          /*
   372           * UBI goes through the following steps when it changes the layout
   373           * volume:
   374           * a. erase LEB 0;
   375           * b. write new data to LEB 0;
   376           * c. erase LEB 1;
   377           * d. write new data to LEB 1.
   378           *
   379           * Before the change, both LEBs contain the same data.
   380           *
   381           * Due to unclean reboots, the contents of LEB 0 may be lost, but there
   382           * should LEB 1. So it is OK if LEB 0 is corrupted while LEB 1 is not.
   383           * Similarly, LEB 1 may be lost, but there should be LEB 0. And
   384           * finally, unclean reboots may result in a situation when neither LEB
   385           * 0 nor LEB 1 are corrupted, but they are different. In this case, LEB
   386           * 0 contains more recent information.
   387           *
   388           * So the plan is to first check LEB 0. Then
   389           * a. if LEB 0 is OK, it must be containing the most recent data; then
   390           *    we compare it with LEB 1, and if they are different, we copy LEB
   391           *    0 to LEB 1;
   392           * b. if LEB 0 is corrupted, but LEB 1 has to be OK, and we copy LEB 1
   393           *    to LEB 0.
   394           */
   395  
   396          dbg_gen("check layout volume");
   397  
   398          /* Read both LEB 0 and LEB 1 into memory */
   399          ubi_rb_for_each_entry(rb, aeb, &av->root, u.rb) {
   400                  leb[aeb->lnum] = vzalloc(ubi->vtbl_size);
   401                  if (!leb[aeb->lnum]) {
   402                          err = -ENOMEM;
   403                          goto out_free;
   404                  }
   405  
   406                  err = ubi_io_read_data(ubi, leb[aeb->lnum], aeb->pnum, 0,
   407                                         ubi->vtbl_size);
   408                  if (err == UBI_IO_BITFLIPS || mtd_is_eccerr(err))
   409                          /*
   410                           * Scrub the PEB later. Note, -EBADMSG indicates an
   411                           * uncorrectable ECC error, but we have our own CRC and
   412                           * the data will be checked later. If the data is OK,
   413                           * the PEB will be scrubbed (because we set
   414                           * aeb->scrub). If the data is not OK, the contents of
   415                           * the PEB will be recovered from the second copy, and
   416                           * aeb->scrub will be cleared in
   417                           * 'ubi_add_to_av()'.
   418                           */
   419                          aeb->scrub = 1;
   420                  else if (err)
   421                          goto out_free;
   422          }
   423  
   424          err = -EINVAL;
   425          if (leb[0]) {
   426                  leb_corrupted[0] = vtbl_check(ubi, leb[0]);
   427                  if (leb_corrupted[0] < 0)
   428                          goto out_free;
   429          }
   430  
   431          if (!leb_corrupted[0]) {
   432                  /* LEB 0 is OK */
   433                  if (leb[1])
   434                          leb_corrupted[1] = memcmp(leb[0], leb[1],
   435                                                    ubi->vtbl_size);
   436                  if (leb_corrupted[1]) {
   437                          ubi_warn(ubi, "volume table copy #2 is corrupted");
   438                          err = create_vtbl(ubi, ai, 1, leb[0]);
   439                          if (err)
   440                                  goto out_free;
   441                          ubi_msg(ubi, "volume table was restored");
   442                  }
   443  
   444                  /* Both LEB 1 and LEB 2 are OK and consistent */
   445                  vfree(leb[1]);
   446                  return leb[0];
   447          } else {
   448                  /* LEB 0 is corrupted or does not exist */
   449                  if (leb[1]) {
                            ^^^^^^
Is this NULL check required?

   450                          leb_corrupted[1] = vtbl_check(ubi, leb[1]);
   451                          if (leb_corrupted[1] < 0)
   452                                  goto out_free;
   453                  }
   454                  if (leb_corrupted[1]) {
   455                          /* Both LEB 0 and LEB 1 are corrupted */
   456                          ubi_err(ubi, "both volume tables are corrupted");
   457                          goto out_free;
   458                  }
   459  
   460                  ubi_warn(ubi, "volume table copy #1 is corrupted");
                                                         ^^
This should say #0 I think?

   461                  err = create_vtbl(ubi, ai, 0, leb[1]);
                                                      ^^^^^^
   462                  if (err)
   463                          goto out_free;
   464                  ubi_msg(ubi, "volume table was restored");
   465  
   466                  vfree(leb[0]);
   467                  return leb[1];
                               ^^^^^^
The NULL check on line 449 makes Smatch think this can be NULL.

   468          }
   469  
   470  out_free:
   471          vfree(leb[0]);
   472          vfree(leb[1]);
   473          return ERR_PTR(err);
   474  }


regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
