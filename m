Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEEAC6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iCBGXS9AB8+Ho7M+2RRyQdAcJ21ENr0PY8p2J/XznLo=; b=4CIhy9VwfL9GgA
	gOSNtSO5UCvLmA06m0jSBkEqpA9zHpF73akHHEzrgvEVkh9J6jcn86jKEUSczPbZ5UWdcMvV3W3LS
	U2HM9xe+frYaYKCvTFcnL79ibakukWXBNs2QAV/6RvehhNHOV72Jv3WgXOcaQf/dDi+gJvcoY66KI
	oPODXxM8wPEhSGIWy/0pjySn5hjCf9JJsiSFk+m9Y0jxL+uK6HrLdGIPjoDbt8AN4v2IxoXEJ/nFU
	lbojiW0P3p8Yry5ySZhDYCHi7hkZkywPKWiRgeICAyaDaUXR6hocYuXvNFGZVNohcS4ZyXLFUU+jl
	UwJFip/2hbfUxTo/s6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBeO-00F39E-20;
	Tue, 28 Mar 2023 15:54:20 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBeL-00F37s-0f
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 15:54:19 +0000
Received: by mail-pj1-x1029.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso13073254pjb.2
        for <linux-mtd@lists.infradead.org>; Tue, 28 Mar 2023 08:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680018855;
        h=user-agent:content-disposition:mime-version:mail-followup-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmzh57wLBrZsBEEJz6ToKyLCm+TGSn6BgiPXbEgYDl8=;
        b=CQ2x//wAX2D9QYCI81rqpn6kAGgKdd9XHlvuviib1LAaaHKu4iaFX8B4zPDCgo0tCp
         EyK2a7AyJ2IMefysra0INrsVdL33x5lhYVB5QS9gYIAjDSsag4pG9VTc+uW1Hy79UqnS
         5CrLyqpoNiWzxXEmpyR6n9rxVXu1l4yIv/e/ufxiJhCEqNAbrtIfkxtNihFLM2i8mwEx
         WvHNH8B5OKhhja6ZFOpM6UcWbuuNsn3auoV9W1CkDo2Wib5ms/xp46IYOQAEEHnJ1tGi
         9Ew1IfYkZrb/XTdqRHzwBHMO3qZ6lw1QKpMPbNKw0jXl9WjsgOf32NyZHXSMa088jvGk
         tlMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680018855;
        h=user-agent:content-disposition:mime-version:mail-followup-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmzh57wLBrZsBEEJz6ToKyLCm+TGSn6BgiPXbEgYDl8=;
        b=v+L3EfqtpksNWntUY4wNJFfB3Iitx88ViOE0KHPNEyk8s2o3v5Q1xfIMdwTLK8YxlB
         V5ajGsFV2ZcotTB7xknWwKvpvb+l6e2YIS3+Ssh+5coZ8aisQg4sStWAsqtJG8k1SYdj
         llnAx1ymZNFdHPPzpNLV6TIbntlV2BjfsPodIb39w/eW5IWF3mdnx5+k+gvhkrDTb3os
         X2FWQUFt7Zvn81ttKSWQEBTe+SrWSmqmElEYw/8yQoIdcIQBhQ0kQR5FgtHXTYaE85Yv
         zsufNqPKDZwRwcPZ/cC1AE2GttC24gQFw6J2scnhjNTWpAOw22cp+SmnlJgughU4rXKb
         uQcw==
X-Gm-Message-State: AO0yUKVeYYueqxdAAQMJ91CkKmr6tG4tbf5keH/XTj0tTIF+NE2W24uH
	yqWx0hAzzR+HZFHI6a+yMFQ=
X-Google-Smtp-Source: AK7set91ezqdli3CwELBU+35ka3BsRC37ewoWiAeckTNmB9RKHs6VAH3rGAKBDpoOeBx0tOzPJyBKw==
X-Received: by 2002:a05:6a20:bc9d:b0:d6:80a4:f0b6 with SMTP id fx29-20020a056a20bc9d00b000d680a4f0b6mr13689838pzb.6.1680018855349;
        Tue, 28 Mar 2023 08:54:15 -0700 (PDT)
Received: from udknight.localhost ([117.30.91.49])
        by smtp.gmail.com with ESMTPSA id w4-20020a654104000000b0049f5da82b12sm19783510pgp.93.2023.03.28.08.54.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Mar 2023 08:54:14 -0700 (PDT)
Received: from udknight.localhost (localhost [127.0.0.1])
	by udknight.localhost (8.14.9/8.14.4) with ESMTP id 32SFZbwv012706;
	Tue, 28 Mar 2023 23:35:37 +0800
Received: (from root@localhost)
	by udknight.localhost (8.14.9/8.14.9/Submit) id 32SFZY5F012703;
	Tue, 28 Mar 2023 23:35:34 +0800
Date: Tue, 28 Mar 2023 23:35:34 +0800
From: Wang YanQing <udknight@gmail.com>
To: richard@nod.at
Cc: miquel.raynal@bootlin.com, bbrezillon@kernel.org, richard@nod.at,
        vigneshr@ti.com, chengzhihao1@huawei.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: ubi: eba.c: fix return value overwrite issue in
 try_write_vid_and_data()
Message-ID: <20230328153534.GA12409@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>, richard@nod.at,
	miquel.raynal@bootlin.com, bbrezillon@kernel.org, vigneshr@ti.com,
	chengzhihao1@huawei.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.7.1 (2016-10-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_085417_242768_5DE2A6AA 
X-CRM114-Status: GOOD (  15.96  )
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

The commit 2d78aee426d8 ("UBI: simplify LEB write and atomic LEB change code")
adds helper function, try_write_vid_and_data(), to simplify the code, but this
helper function has bug, it will return 0 (success) when ubi_io_write_vid_hdr()
or the ubi_io_write_data() return error number (-EIO, etc), because the return
value of ubi_wl_put_peb() will overwrite the original return value.

This issue will cause unexpected data loss issue, because the caller of this
function and UBIFS willn't know the data is lost.

Fixes: 2d78aee426d8 ("UBI: simplify LEB write and atomic LEB change code")

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 Changes v1-v2:
 1: add error code in warning message, suggested by Zhihao Cheng
 
 drivers/mtd/ubi/eba.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 09c408c..4e1d807 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -946,7 +946,7 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
 				  int offset, int len)
 {
 	struct ubi_device *ubi = vol->ubi;
-	int pnum, opnum, err, vol_id = vol->vol_id;
+	int pnum, opnum, err, err2, vol_id = vol->vol_id;
 
 	pnum = ubi_wl_get_peb(ubi);
 	if (pnum < 0) {
@@ -981,10 +981,19 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
 out_put:
 	up_read(&ubi->fm_eba_sem);
 
-	if (err && pnum >= 0)
-		err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
-	else if (!err && opnum >= 0)
-		err = ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0);
+	if (err && pnum >= 0) {
+		err2 = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
+		if (err2) {
+			ubi_warn(ubi, "failed to return physical eraseblock %d, error %d",
+				 pnum, err2);
+		}
+	} else if (!err && opnum >= 0) {
+		err2 = ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0);
+		if (err2) {
+			ubi_warn(ubi, "failed to return physical eraseblock %d, error %d",
+				 opnum, err2);
+		}
+	}
 
 	return err;
 }
-- 
1.8.5.6.2.g3d8a54e.dirty

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
