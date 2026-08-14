Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462D0C5B572
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 07:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6oZ4ktpRQUAL9R4lBWKa2+sIIJBHWOQdOQG4fZGCmc0=; b=0WX6ds0Jqyhc7p
	cO98dHf5B5feFYUZi98TZncSzSoXffW85RiLcV2ueg+/A7Dz9kbx8czi5j8X0mZYymRNQq5Lde2LN
	ixsRewJsenhRCtwUFT5ru14HW0iy/EJQlfWOcCSyBqInYXrqbHgdWm7C/cY0spacZK2h0Vrxi5ds2
	u/YXl7mSjnb3BY6zgjlZbxGPVxu5rPknfJmIX4nIhXnvPf7OynQkZiHniQD8Uh8cpQfdVB6O93cQX
	1Vv0PO2/CEBpUEpIkvEmPuDXfD3kD9bieuMHyyx3o3dOZ62oeX8PYQLEONcD3U4EiUt4XUKFC0wgt
	90RatBWyNBQjqj9MyhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumTR-00000002Bya-1eUT;
	Fri, 14 Aug 2026 07:37:05 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumTO-00000002By6-3wBR
	for linux-mtd@lists.infradead.org;
	Fri, 14 Aug 2026 07:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1786693018;
	bh=DQBILIokp41Hnnd0FuSsMc2RbkrOye+lGT0W0FCN+Xc=;
	h=From:To:Cc:Subject:Date:From;
	b=cU94Z1KR/kuacPQ5LdeTSqVwjqEFt54selLjaGk8gDCnwCDRvYm8hd962PEf23I3C
	 TcifhkzNWxesNHdwCLSonXfb5LW5qWii9MDsjY4Yag2m0YueumP/EuO2lPTViC0nPM
	 3hWoVig4T5/zVHUX/OP6Sg9fOYS60n3asN5LGufUBHMEZVw2W/8nk4V4LK57PFu32f
	 Qi6E4Uz/h8uuA3bZdDyCX2tOavLn684iFbgcPzfh53dwP5dg5Ve9KQgruqkiNs/mdR
	 S/+0zM5zCM28fC0GVkBmiCoTkETKqibvblhbizpqtUU1GDjoW55isW7H1pnZe9caKe
	 XSrreMaiLkB4g==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 52C6736C
	for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2026 16:36:58 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=j2cpwAnZ;
	dkim-atps=neutral
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 39A7436C
	for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2026 16:36:57 +0900 (JST)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1866424a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2026 00:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786693016; x=1787297816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VF9i6ayf0EBFHpjzgW0/fnUK9drmfZP21u1fBNwxuyE=;
        b=j2cpwAnZYLqcSoSBg2w55ZVR/9WQGyLlJOsWrWMjfpFJ+okTr7UmpqScFiuI1UQ3ty
         +3I/rYqjDr+no3UBOaKWodfuy98lS78fi8vhlAGZ8GNgW4RH0wQj0/gcRlsIKpvnEDFh
         dNapxB2Jx1nG5VM+cPdT6OFoMw2GGg+BczR/1DRyq5Bp0NAQjhieDTFdqpwAOoadDUZI
         33YWYQyUQoVjZn+XCB8wCDZT7+xWr7n2ilpeHdMloj5QtOxOn+1+dR+oFiy7YPDulRjg
         RpYba8op6uMchDQ3SRARvnLgRbLlzsSO2NTJQQICTAY+kAyN9DoQRwvTwfKH/DWR6WHe
         ld9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693016; x=1787297816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VF9i6ayf0EBFHpjzgW0/fnUK9drmfZP21u1fBNwxuyE=;
        b=MlEHTVQhh+QQLUDjEPOOTze1pGuGWnawBXxOVqfKT6e9m0V86q/GH21ODeHSXh7gfs
         7/6PFQ0+w9VH57T+gx2cnnS5d6+Bi5z5G40/idX+5YonZYGIbbu84PWNzuHLsYBf3TrM
         HkxBV4bRCxgQbO03HjD6rG3bsYX3X1j3u13Nwi+NVPaRYV4pQ4eZRBtxqL7t/+VZA7hM
         7P52Y16dVh6byoByMq0LRESs6KkKHCNm2YkL7AlmHsTgGjYduu+RnqJuiQvkLENhEep5
         SCVkOlkCXa+nEYIZIQToONoY8FezHcjdBEz+A8UdpTnwufcq8SjN8Uaea+d5iM7JJ3SQ
         LoNw==
X-Gm-Message-State: AOJu0Yx3ioWALwaiioaD21JGhR/Btq7jc4gk7K7m9AcdBiLj9oGW/TM9
	BcaAzSUh57ORX/VBl+lMEvGn4QaL+IG9Z73QSZAd76rFzVTls9b99roROsOlMSepHh/I1QyFRBb
	YG9IYQQcODpSI0an+YAKtsdaUgQi42u7ewi+v6s27Zw5Pt4AO26nr0D0x1BQtcSvd9XaJ8xnrvg
	xe
X-Gm-Gg: AR+sD10v2tiyVpfjXRO018RtdUD8Ycwu94tciK/gjSbgjgL24jeyrONhwGgqQYccTb6
	Qb87Iyx5fiiLEVmQMv+cqKJK152PMtGwYqeFDC1Gh9lxaS1yb4Pp++85AajKUp+ndIFlR4l1brg
	fF1vndVK8Xj2baJGZ+oV+mMhEgIyE6Cx9yhgtjtqi8yC2UI86+er3QnSyutRPokT00lIWVxVN29
	NMqkcy73B9BMPBnnTSYjjqM4gDKl8Idtqfums0gaZfdf1vDUcFr1Y9NMuirgZvgDC/EFw601TSS
	YaFmoC1QrPq5tNzmRbtPC8sUgewgEvEDzONcOGgL5vlc78FftJG2LBySzzLzuzoLEb5inbgguqa
	B7yPa9B7CgsPPAltZoNyw0t5HSVtaakX0dfR0LtCTtp8Dh5b1
X-Received: by 2002:a17:90b:4d8f:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-3933affc039mr2900125a91.9.1786693016058;
        Fri, 14 Aug 2026 00:36:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8f:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-3933affc039mr2900095a91.9.1786693015494;
        Fri, 14 Aug 2026 00:36:55 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-394ea995222sm1549613a91.6.2026.08.14.00.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:36:55 -0700 (PDT)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: linux-mtd@lists.infradead.org
Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: [PATCH mtd-utils] mtd-tests/flash_stress: allow picking any erase block
Date: Fri, 14 Aug 2026 07:36:53 +0000
Message-ID: <20260814073653.7-1-dominique.martinet@atmark-techno.com>
X-Mailer: git-send-email 2.55.0.dirty
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003703_106519_165D2220 
X-CRM114-Status: GOOD (  12.25  )
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

unlike the kernel module mtd_stresstest, the read and write operations
in this test program only ever span a single erase block, so we can pick
any erase block in rand_eb()
---
Noticed this while looking at the code (to get a rough idea of how many
erase cycles I'm going through on average for each erase block with this)

 tests/mtd-tests/flash_stress.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/mtd-tests/flash_stress.c b/tests/mtd-tests/flash_stress.c
index da39e1408ed3..ada8596382e9 100644
--- a/tests/mtd-tests/flash_stress.c
+++ b/tests/mtd-tests/flash_stress.c
@@ -150,9 +150,8 @@ static int rand_eb(void)
 {
 	unsigned int eb;
 
-	/* Read or write up 2 eraseblocks at a time - hence 'mtd.eb_cnt - 1' */
 	do {
-		eb = rand() % (mtd.eb_cnt - 1);
+		eb = rand() % mtd.eb_cnt;
 	} while (bbt[eb]);
 
 	return eb;
-- 
2.55.0.dirty



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
