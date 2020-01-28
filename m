Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCF3C2D0DB
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EC3214AF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ttt9H6cZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1EC3214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVkX9JVFlSfQjWIXphxw25HlPD9agkao3tNB6BwRK58=; b=ttt9H6cZHZvH7l
	P8LIytT6XPvLefVymdnStxtMbbyuIsiBTU0fKp7fxW/c6awyHXWFj9DL8IS1XEk7pZclRc6EHC9NQ
	y8Pu8O6vol1ALjr8TBohkle64LmhmG/zELXaSm27zTJsbZz3m5L2azeVTfRHJeOVMOx3e2+sCm0qP
	/TZB7EYsMJAkHyx8AScyx7jqtJJ0JQ/46ZaVoQoYjjCcaaB9CBAdQPsUgFZ3UJ6aCaIRoUPcnP0FY
	vffP21QfQA5T6ToPYxOsKzayBkVYAK1ZceqTsOrNy1v+0eJGDGqlM99PlRCNexHN1HVlvKWM2yfJ9
	d4fAjd4W6vzWOc5MA0lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwUfS-00024F-Lu; Tue, 28 Jan 2020 17:28:50 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwUeF-0000jj-9a
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 17:27:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 350B4180FEE22;
 Tue, 28 Jan 2020 18:27:31 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tKKLvazI8X7V; Tue, 28 Jan 2020 18:27:30 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 61Em79L4WzW8; Tue, 28 Jan 2020 18:27:30 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 8/8] mtd-utils: Add checks to code that copies strings into
 fixed sized buffers
Date: Tue, 28 Jan 2020 18:27:15 +0100
Message-Id: <20200128172715.19545-9-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
References: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_092735_483449_38C6E351 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: richard@nod.at, David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 jffsX-utils/jffs2dump.c | 3 ++-
 ubi-utils/ubirename.c   | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/jffsX-utils/jffs2dump.c b/jffsX-utils/jffs2dump.c
index ad7a9e3..d30b59f 100644
--- a/jffsX-utils/jffs2dump.c
+++ b/jffsX-utils/jffs2dump.c
@@ -149,7 +149,8 @@ static void process_options (int argc, char *argv[])
 				break;
 			case 'e':
 				convertendian = 1;
-				strcpy (cnvfile, optarg);
+				strncpy (cnvfile, optarg, sizeof(cnvfile) - 1);
+				cnvfile[sizeof(cnvfile) - 1] = '\0';
 				break;
 			case 'r':
 				recalccrc = 1;
diff --git a/ubi-utils/ubirename.c b/ubi-utils/ubirename.c
index f88ef82..97bf030 100644
--- a/ubi-utils/ubirename.c
+++ b/ubi-utils/ubirename.c
@@ -126,6 +126,13 @@ int main(int argc, char * const argv[])
 
 		rnvol.ents[count].vol_id = err;
 		rnvol.ents[count].name_len = strlen(argv[i + 1]);
+
+		if (rnvol.ents[count].name_len >=
+		    sizeof(rnvol.ents[count].name)) {
+			errmsg("\"%s\" volume name too long", argv[i + 1]);
+			goto out_libubi;
+		}
+
 		strcpy(rnvol.ents[count++].name, argv[i + 1]);
 	}
 
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
