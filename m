Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D9606D805
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wMuuywJm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNa2YjMo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gm/AdkWX6ieWFVse529lkrC78VEqAFLOGEGFvDE/7Hk=; b=wMuuywJmxiq6NWfgduN+aJISzg
	YmPjb6G6wfm+Bx/z9ZnnGQHS3kHQRUWK1F2BUgYgdEms4EQsGlS5oY0DffHGBy6ZXmhzELzZFp+LU
	GENkvCzRULSrcaSWdAV6dr/+vr8avwFQxveXHd84Yr8EdH4r3dFiWYoYA/6S5e94f9y2W0OoTyza8
	KVVJVr4o8JGCPvjIpYWLkke1Z+2mMEAzQmwHF9tppYsNh6HeuhMj5jH5PhYY/phuw/UrllpiQGX20
	d2iUUTp2z8aV3L1IYXr+voXQAWWDDzrjFSWSiOxv706frT4z7Rj8fKWKr+l29iVr2GQjzuvBASAnv
	n2VPG03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAFr-0000000GhXL-029d;
	Sun, 08 Nov 2026 21:16:47 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAFn-0000000GhVv-1Rze
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:16:44 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-716b58a4365so123922eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172602; x=1794777402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=oNa2YjMojzSmL196jyTvJ49hy1uqD3UtHpTqGhHkQYvOhHMEjgP2+eSupsH9DsBaE0
         a5kQ59tgtkXSUpxZnZyJmZABH+g1ThFOPuyxnm/QwZgBR7ujgmJGK1Ml1tvnlpiH0oiJ
         6Qk1uLoSIjzDuBPk2o/6dHkE0QU86Gmt7Yp+FszIxNMZoqxk6I+2xuOjLptLrv5mQgtz
         Z/leYiHjP8+FiPtmTtyg9TIiykKe7rhZEKlCB6HpKzJlY4n0Kxo4sfMer6TkLS/QIBot
         5PWNV6AvhP0JYXM64QmLNtg9RiLGj0S00QV/I2C80pk1lTHGbmjXcgGIdVwZcrtK/fZs
         j1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172602; x=1794777402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1VqrTz+ewActBpDHlYQe8JX54F3teV+c5WCvWWuiYY=;
        b=iXCE5HRQ0c0Mp4OX/4AvXdzY/DU67fFwKv5KP0ybwU5sADAi0lzKEPLfJwAkQboEdg
         qaQ2YhhJxbQFekCz9fPkFbMYYvgurgf/wMD3ee5Y9MBtIJZkeJfqdJpsT82Y9UBICgCS
         mlu36t6Aseav9FTS/LL6ClghONGNnKCBJ9WDBoTl6aFpzptYyh+b4bvFHtxVOmsOOazw
         tYhhI5u26D5tAtjMUfdXFjW3owYXC/nVNuWj4NellsHoADSyEnVcGwECHAnNMW08PfP4
         xrO+6y4Uq61xt2dRwFXDb4Ksj3hAWH4ngi+OwWz8rxh/MRWT1YghDKcRUtCA+W/vp61m
         0QNw==
X-Gm-Message-State: APuU4Z+boCkLw00Fmz9McB3wqlJlfOB2ggTpgiG+qL09S5zFqc+QcsJk
	rmCb/zcG0bXBQ4YsfL2hi0UAiCU6UZUMgDAF8dHSw886KGk5sFhHq0RkuAUhTA==
X-Gm-Gg: AYBFou29KfEF+w1EJAD37DB7rjH0KzHNBGJPifATdvjAtAlYWFqtn23bS796qjwjYy9
	wOGj6InNwQyi5phDfrDZpFzpugkbsAGs1Y22m6Ym26XXE589sVpcSXGGqzCh5hfm8ihDXok/YPA
	Atcq/kYCog7zt8L/YqBeXWPNIVJ7tBKe32T+tklgyFIC/A7+A9A/Z+6mR/4Td7lkZtlWF/x9hCm
	81zt5/FdAuvm2AtXKsqzEH8gMd93DjrB1inmWptkb6566l7uYmF/lf90urDXX4ZccB/ajY33AF/
	q6vGkwXywxfz7Fwmmkc7kPXj40FRoYbUdFJHsOBqiWpqf/aCC6Fu9k+/YZj+70OOaI9anj73c/Q
	bQTxEu9wzl8veCyBIiNi3yyg35qDqfw3V7W8XeU6HBab+wMvSYn2ROvdPhdeWQIrh7OyK7+s76y
	rsy2IOnfuTKr6A+mcidjcez0QSFjr9yNmxxwaVIXibjOL/wePl0G30nlHOfo2t1jnukgLNK5ZGi
	KC2D2HkDdPyuKui/Ly/EFrDxu3HWzcwd2BeMm26eVpxutKVk67+M70DJg5x0QdLhjawd+EGHWjL
	23IbXTXQqdiok1kAjH1A69QecW/m6dg4L6xJ/TmtDGcXOTh9OgZsgBlNCZ+lTcpLLZCXp8e0kvA
	4pU7ktXBj1AS5impuwUxWVdFnvknjmF13mI5j5L0BJnZae9klBqloJb63qKFesGETm9khmrZDki
	qAnDLFm+t4t00Z+hWWArCOZjiB1ulMPBLtBWCN4619Pt97sDlF240=
X-Received: by 2002:a05:6820:83c7:10b0:715:2787:e1e3 with SMTP id 006d021491bc7-7170f2b53f2mr823230eaf.14.1794172602221;
        Sun, 08 Nov 2026 13:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:16:35 -0700
Subject: [PATCH 1/3] mtd: rawnand: qcom: parse boot partitions before
 registering MTD
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-1-509f30a9e14d@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_131643_393395_454F0D9E 
X-CRM114-Status: GOOD (  11.93  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A boot-partition parsing error currently calls nand_cleanup() after the
MTD device has already been registered, leaving a published device backed
by freed chip resources. Registration can also invoke consumers before
the boot-partition layout is available.

Parse that layout after nand_scan() supplies the geometry but before
publishing the device. All failures then reach cleanup without leaving a
registered MTD behind.

Fixes: 862bdedd7f4b ("mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 2d98f79b492d..f240d1effa04 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2052,16 +2052,16 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
-
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
 		if (ret)
 			goto err;
 	}
 
+	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
