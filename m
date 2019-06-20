Return-Path: <SRS0=7m8F=UT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF851C43613
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 13:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F5D2082C
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2019 13:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gqd6yP3X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zg7Yhg1I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94F5D2082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JsraXvnJPAxQPakekrEwdr9HBh3tWcbzAUnaOfiDazs=; b=gqd6yP3XWsSfBR
	CPvobMUmrGwLuSKqSgrzpAep8poJy5l51QthPXquY2/21he1nfCcnXunxmT8GHQMVML+y8CMZXPPe
	aygiD6YY2hAlosVVaTPUuorRKyzuFKHC45QZu6yG7NzSTpGhYj6lZGWK3wnf0Z/rZUIwARpiWBJiV
	We2o/rVzJcfhq1JU3nd0qpE58vWOMsU89HkkNjYqZOAnGy04gXB/zPpqyPi+seO8045bh2XQVvf7y
	/KgY8FsXLETOysSWdr7Sa1aig4dITH3Uqr5XAntDwWXeuuDlTxQY8DcDlg0qrjpz6fC3GAkJ0JWVr
	uNDy6LrHYc4NG4w9t9eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdx6n-0008I0-K0; Thu, 20 Jun 2019 13:28:09 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdx6k-0008HN-GZ
 for linux-mtd@lists.infradead.org; Thu, 20 Jun 2019 13:28:07 +0000
Received: by mail-lj1-x244.google.com with SMTP id v18so2701690ljh.6
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2019 06:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Edl6/9YUfncAcft4KNYb5hW5dDKnUz0n2iSRd7mAkVA=;
 b=Zg7Yhg1I96PwSYMpJNLaRngMHgRYEMZrKE5ii047fr/8fAJlfnrOBce940TA4Hpkkk
 BSTX3urHyEBfAUBWWdpdZCE/KbtrKUinncM45lMCG8VUnqo2ib5Cx05KTQ2E8Z82+J2W
 GlMR3rpwC/JVfkv/bjxlla2edr5ExalaY7vi2y/aAHZ6y3sLyelE7Sudn1ykW7OS6an7
 fp8ryYFP9LWK8iVBrc2DTqBQGVxCDegnNEpRdl7FKFHl6GfrqIU67TQvu0l7kG1eJNMb
 t0vUu4Epu+GhyJIqzrkimnpCXKirZeuJYgDJm5i27F92pk8VIa8tgTBwud2+Vqt3Na7u
 l3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Edl6/9YUfncAcft4KNYb5hW5dDKnUz0n2iSRd7mAkVA=;
 b=IAMhEFLfJGivL/JSM+Sr3SlZD3203q+GBxSzDdttVvTxAaMCsolr1iLLEhcRBL//Kx
 lhOIe8LI4+Xz1JAdUJZ5ydHNZACUwdP6DUqnVFBkO2YcemDQhNXKlTh1HdUd2/VWbSEp
 LKz+DtCK8pPpB84aFDeMzphBvGukNM0HJeasUcTL5M6QYrkwkPw7faES91XFCmmJT8S7
 lqCGXF6XB5nWT9vLBCgW1WUSeeuUbooMQHmbjWp2RtHzSQuKIQYlL3LTK1dd1c33xbAp
 QZAukNg4D+6cRGw/wCymp6iD/QpHlgs14ZsPbccgWx8wXw4yavkbpaPfvQOgcs3cM5Yy
 BGgQ==
X-Gm-Message-State: APjAAAWps0JHo3234265ULXb5x3BVfEtUdGdYMna3bfJGTvfHFPH2+Ny
 MzvsdPJrLQqm1vxm+NB3FBc=
X-Google-Smtp-Source: APXvYqyn6/r+MCop52fPiRBSbH06B3hz8koA+dOMWBmtY3nbJdVTGarykUg1qjdsqCWvbi+httN+BA==
X-Received: by 2002:a05:651c:150:: with SMTP id
 c16mr27807461ljd.193.1561037283355; 
 Thu, 20 Jun 2019 06:28:03 -0700 (PDT)
Received: from laska.lan ([217.71.226.214])
 by smtp.gmail.com with ESMTPSA id t21sm3555540ljg.60.2019.06.20.06.28.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 06:28:02 -0700 (PDT)
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd/ubi: fix initialization order of ubi subsystems
Date: Thu, 20 Jun 2019 16:27:52 +0300
Message-Id: <20190620132753.19538-1-mikhail.kshevetskiy@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_062806_555190_B9F76B94 
X-CRM114-Status: GOOD (  11.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

during ubi initialization we have a following calling sequence

1) ubi_attach()

   ----------------------------------------------------------------
   err = ubi_wl_init(ubi, ai);
   if (err) goto out_vtbl;

   err = ubi_eba_init(ubi, ai);
   if (err) goto out_wl;
   ----------------------------------------------------------------

   As we can see "eba" subsytem is NOT initialized at the moment of
   initializing of "wl" subsystem

2) ubi_wl_init()

   it call ensure_wear_leveling() at some moment

3) ensure_wear_leveling()

   ---------------------------------------------------------------
   e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
   e2 = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
   if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD)) goto out_unlock;
   dbg_wl("schedule wear-leveling");
   ---------------------------------------------------------------

   so, if no wear-leveling is scheduled than everything is OK

   and a little bit below

   ---------------------------------------------------------------
   wrk->anchor = 0;
   wrk->func = &wear_leveling_worker;
   if (nested) __schedule_ubi_work(ubi, wrk);
   else schedule_ubi_work(ubi, wrk);
   ---------------------------------------------------------------

   as result we enter to wear_leveling_worker() function

4) wear_leveling_worker()

   ---------------------------------------------------------------
   /*
    * Now pick the least worn-out used physical eraseblock and a
    * highly worn-out free physical eraseblock. If the erase
    * counters differ much enough, start wear-leveling.
    */
   e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
   e2 = get_peb_for_wl(ubi);
   if (!e2) goto out_cancel;

   if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD)) {
       dbg_wl("no WL needed: min used EC %d, max free EC %d", e1->ec, e2->ec);
       /* Give the unused PEB back */
       wl_tree_add(e2, &ubi->free);
       ubi->free_count++;
       goto out_cancel;
   }
   ---------------------------------------------------------------

   so, if no WL needed than everything is OK

   and a little bit below

   ---------------------------------------------------------------
   err = ubi_eba_copy_leb(ubi, e1->pnum, e2->pnum, vid_hdr);
   ---------------------------------------------------------------

   OPS, eba sybsystem is not initialized yet (see (1))

From the other side, it looks like eba sybsystem does not require wl sybsystem
during initialization, so just fix ordering and proper handle error path.
---
 drivers/mtd/ubi/attach.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 10b2459f8951..8c1d629c0e1d 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1602,13 +1602,13 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 	if (err)
 		goto out_ai;
 
-	err = ubi_wl_init(ubi, ai);
+	err = ubi_eba_init(ubi, ai);
 	if (err)
 		goto out_vtbl;
 
-	err = ubi_eba_init(ubi, ai);
+	err = ubi_wl_init(ubi, ai);
 	if (err)
-		goto out_wl;
+		goto out_vtbl;
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	if (ubi->fm && ubi_dbg_chk_fastmap(ubi)) {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
