Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AC2C001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4z0utBrAQe+mikMWJG9pJst5pwqHnihntx1sDyP1Tfs=; b=EMD
	oPr5fHiS4oAqKH7Uo8wJQ9s0IU5iW+sZ+Gm6LDzUGiXeHCBDrKUydxT9+tCfe3FNYTOsVDmhx+aD+
	PQvfwhj8iefKryfxICn7XEKvjtycx6mNVeS7ggNJIql9iuCnO3N9Ak15ql3jp+vJhaKoFs+FkjCx3
	Ib0j1pGDSpLZugUgulZR97of+tNdQ4Lyd16uZNgFcIO3CFD3u7/GpdbQmYvZqKG/OxQ86zq6Ipxpl
	Fi4CuDRRfD0TibmeEpikt91YgF2AhW3B2KdmJPPNfZJFqrO7h7vdQ90aLh3lh5B5b2eJWGCmnarUw
	b/0jAQGT9oLTRrurr1N8K1BiG6AOCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQU0Z-00G9DW-3A;
	Mon, 31 Jul 2023 14:36:27 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQU0X-00G9D9-0q
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 14:36:26 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a3efebcc24so3475178b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 31 Jul 2023 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690814182; x=1691418982;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r/HrygybJEUkegHeYgop8WuPc50rmBm6nd/wtHLV2U4=;
        b=P+xBD2q+e8eQVQ1/jRQcTCXhiiWuXpDSr0iAOHC74NuGSKeEHsiGR363HmT+iI6S9a
         oB2mYY3FjeF3/RNPRZ1X+gY33OvKqTjivEhPBLEfGTMCuWKWGjKot/4QTasXP5i7x3W2
         VVULK8S1rJnQRQh9u1qJ56ttsIGOF6Sluf1cNNWKA2m+y2z1MYeBpMJBel+DjBqMCEjo
         ryVOl7kr3Wt8CC/QOSWtKh5WpBd5O+rdbtgzZP0pKyK9AaJQKLbf1ZZE4gxDFTwn4CuE
         MzciC76hdSeOdgmiItVStxAsuKBeD7Zh+2EdI1JskbBYX5fBtzajggr/7CECTsEcVA7i
         msbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690814182; x=1691418982;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/HrygybJEUkegHeYgop8WuPc50rmBm6nd/wtHLV2U4=;
        b=PuyIEj/SmAtfkCNai6kF9GuY7FoQ/TrkfgQHFPxIWUTcflfHfSuW4cUq3VHWnZRK4d
         Tod5FLfKXaKiNac1PKMuABHUlKcubM47Qab2lFzkIPbxGSSl/sEU0L7fzSIG6yO2udaH
         +BCmIpCMUR+50g0xd5DiiB0NFjAckddUy9K9lSryGFexgza24sPSoUkrJ6Qd7ZpmU5oz
         oMu6m4SNenpa5KNc/1GIwOrmvQKQQ1CohaD41jyg70u3YMU1JDh5Lg2hPY+/x80tW7b8
         /5RBC94dGLzYJKWHC0ZOmJg+7fRg3BV9FBZzb1jxKl95R6G1TaJ9BdBQ+HoHVyL//zIe
         sbLA==
X-Gm-Message-State: ABy/qLaA/BuACpc5Mnya1EnqqXlJbkdbBLuDIDVlGvytuiZnRSC6S1DL
	itj7YBY3FPh7mey0ofVw43F0nahuOQAFlaj8y0eNz4qSit8=
X-Google-Smtp-Source: APBJJlGYlus7Hv6fLyuu1Efvm69GFdyClVPo/Mu7ifCM/EkZ0uuxjTqNl6JWNdSvaBz9HC3HkmGpmMqu0u65wrtcuNA=
X-Received: by 2002:a05:6808:14d4:b0:398:4761:20d with SMTP id
 f20-20020a05680814d400b003984761020dmr12771199oiw.19.1690814182340; Mon, 31
 Jul 2023 07:36:22 -0700 (PDT)
MIME-Version: 1.0
From: Eric Kenny <eric.kenny@gmail.com>
Date: Mon, 31 Jul 2023 10:36:11 -0400
Message-ID: <CAKj80Vd-DPPfSmZCeXd4OV9nqETYW7RNw-02fd33Yh+xQ2ucvA@mail.gmail.com>
Subject: mtd-utils flash_erase progress
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_073625_297470_50B4CB91 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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

There seems to be a problem with flash_erase in that it does not
update progress.  I believe this patch fixes it:

diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
index 49a880f..8cdefaf 100644
--- a/misc-utils/flash_erase.c
+++ b/misc-utils/flash_erase.c
@@ -53,8 +53,10 @@ int target_endian = __BYTE_ORDER;

 static void show_progress(off_t start, int eb, int eb_start, int
eb_cnt, int step)
 {
-       bareverbose(!quiet, "\rErasing %d Kibyte @ %llx -- %2i %% complete ",
-               step / 1024, (unsigned long long)start, ((eb -
eb_start) * 100) / eb_cnt);
+       printf("\rErasing %d Kibyte @ %"PRIxoff_t" -- %2.0f %% complete ",
+         mtd->eb_size / 1024,
+         (unsigned long long)start + (eb * mtd->eb_size),
+         ((float)(eb - eb_start)*100 / eb_cnt));
        fflush(stdout);
 }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
