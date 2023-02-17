Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF45C6379F
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Feb 2023 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IyUcnUB4CFDeu3uRfFYa8u/qr7QmWHYr0xAXLwSsjOE=; b=Syw6NMD6dktXHi
	QXaO70P3I4kiidxzGs1jmHZl4VpmH7rGT/g3tkRWhNDbvnspF/gVhgngaxNHMKNmK5M1r/1zRTU5p
	oYn0MuP/lBxHOBtSuqEcJr1GMZtplVjq5cjW5fXMOXo4HujwrX9dRFBk5ixDjbrTEevzbT/IZDn3p
	lx3mfr8OEwo2qYZ5afzg0HaO3qsxdPHR7OIy7cvNud38TepgtG1zrCklKvxQHVPzlgWM5qPiKb+Wo
	GMIp9XA9NRD9vrNemRHmZ5yjJE0Wd3hCEzMLmu1FI4ik3X23/WKx22AO8FeT4+lDAW5meJzpNTWFl
	rc7dgVxjsTWmmnqPFuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT46i-00FAe1-Ia; Fri, 17 Feb 2023 17:01:12 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT46e-00FAbL-VP
	for linux-mtd@lists.infradead.org; Fri, 17 Feb 2023 17:01:10 +0000
Received: by mail-pg1-x530.google.com with SMTP id 23so841630pgg.8
        for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2023 09:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:mail-followup-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CmMG6Bjrj55x+g0WwIsSci8pNsPP4XDLQDm9PqSpIM=;
        b=CDxh9ha/p7kDOFlK/BJFvPSDqguAqH41H/KUfvXimtiGlw476lp0SfOhlQGM0aHf/u
         owV4GJ5DnvuA2ku8qo4KfYn6TvIlNQjy78A8TqAfSPOywaWFXcEUI3cchY1m47uR+H02
         fm8+OqJyYWpD0tVk1v5Z5WH6q7QZ08cnByc8aPtbopOED5GnO6hXTSzi6NHh3JGnFfHT
         pbvgzYk8c1AobHSyDPmIQxQlttBlaUEgCwieMpQgwosphXBp6UqJdCtijhnPx7DmnUKN
         EC/J06wZCtzYlhLim8kOajDJ9bArSLSAQXtOKlZu6Uw0xKNo6PFIiAkQ1N1QMTIYI6ce
         PE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:mail-followup-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CmMG6Bjrj55x+g0WwIsSci8pNsPP4XDLQDm9PqSpIM=;
        b=wSnuIL1UF545UJ6h9uqSOqZAPj87MNjEQQuGUHoGXucJubUcPxB0elEuW7dED/pdnZ
         HIBhk840BEr3tWmq3bWs+OXSRakDn7WMVqb+QW2AdzkBBbHQ4nh7aOZ9QuS/MnHwcfDZ
         1D4WN5vf5DMQzkwPTQJdlP8epsW3kXzh87FHCLMWWjWtHyHV9o4IKYSSuKBwNtvsYWH+
         B+Er5Trry/sUVh0PS2O5c5RpcfjqhVglELQm6/jPqoQzVnZRnzDFBwC5MKburY7lfsPq
         ufUs1e2hI+cJ//yjPvsbWWbaXXzh/+vrwjXFm2jXXc6I2tHN0fjTBhPKQvie5DwghcV6
         WP4A==
X-Gm-Message-State: AO0yUKUIt2j2DeS1QySaTNtw9+53AUJlXZe/c3X89N8ckX6mZCYcGZvO
	s71I/BhyDAM8D1s/AUAG+GY=
X-Google-Smtp-Source: AK7set8ArPq+Ci7Tf7WaI5qKK4aJz/jBzOCI0k5KAcs4APamkjAl8gSXUrNKT7i7NluYIIlNLaIDIQ==
X-Received: by 2002:a62:38d1:0:b0:5ac:41d5:ded2 with SMTP id f200-20020a6238d1000000b005ac41d5ded2mr102043pfa.1.1676653261209;
        Fri, 17 Feb 2023 09:01:01 -0800 (PST)
Received: from udknight.localhost ([117.30.83.51])
        by smtp.gmail.com with ESMTPSA id f15-20020aa78b0f000000b00571cdbd0771sm3303121pfd.102.2023.02.17.09.01.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2023 09:01:00 -0800 (PST)
Received: from udknight.localhost (localhost [127.0.0.1])
	by udknight.localhost (8.14.9/8.14.4) with ESMTP id 31HH0uad030595;
	Sat, 18 Feb 2023 01:00:57 +0800
Received: (from root@localhost)
	by udknight.localhost (8.14.9/8.14.9/Submit) id 31HGhqK4027318;
	Sat, 18 Feb 2023 00:43:52 +0800
Date: Sat, 18 Feb 2023 00:43:52 +0800
From: Wang YanQing <udknight@gmail.com>
To: miquel.raynal@bootlin.com
Cc: bbrezillon@kernel.org, richard@nod.at, vigneshr@ti.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: mtd: ubi: eba.c: fix return value overwrite issue in
 try_write_vid_and_data()
Message-ID: <20230217164352.GA26537@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>,
	miquel.raynal@bootlin.com, bbrezillon@kernel.org, richard@nod.at,
	vigneshr@ti.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.7.1 (2016-10-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_090109_017732_059972F2 
X-CRM114-Status: GOOD (  13.13  )
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
 drivers/mtd/ubi/eba.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 09c408c..4e32b25 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -981,10 +981,17 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
 out_put:
 	up_read(&ubi->fm_eba_sem);
 
-	if (err && pnum >= 0)
-		err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
-	else if (!err && opnum >= 0)
-		err = ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0);
+	if (err && pnum >= 0) {
+		if (ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1) != 0) {
+			ubi_warn(ubi, "failed to return physical eraseblock %d",
+				 pnum);
+		}
+	} else if (!err && opnum >= 0) {
+		if (ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0) != 0) {
+			ubi_warn(ubi, "failed to return physical eraseblock %d",
+				 opnum);
+		}
+	}
 
 	return err;
 }
-- 
1.8.5.6.2.g3d8a54e.dirty

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
