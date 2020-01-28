Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB349C2D0DB
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:29:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C542214AF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k/VRDxa+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C542214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTttLIAnVDZdY+fJjJ77mao/L5VOXXjuGh5rZOCIWd8=; b=k/VRDxa+7fyN1i
	/gPwE8Ke7B3LjK4UUwDEp27yScDWSzhRlGjCUM9Wqv4IkbJcxJgUlsw4VCYkUuk0gU5f3eeVdqOcc
	T3GazTph0IMPYzhjseywcIeucTDU+FP9cC4IK/sQ6Y2TOaCwmA3MtIRWG8IfWd6XsqVRbsiAL/dQW
	1ghEQnQVnd9CTSSoWNzvqXVmL6ZoGorJ4TPIA6PqHr39zkDllWqlek3M4XZfasW9oDm5ZylEOYDvO
	50wuA+CZlw1l4a1lbb1fh4OrJlWuKjifVx/0f5mNuisnTJUHDmSrRrpoIWcakkndL1j1mhoInUK6Y
	oVlfoFZr7KLAzQa5x3sQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwUgF-0002v5-QS; Tue, 28 Jan 2020 17:29:39 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwUeF-0000ju-LZ
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 17:27:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 3785818026540;
 Tue, 28 Jan 2020 18:27:32 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Supdisy_45R8; Tue, 28 Jan 2020 18:27:30 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id B-5KNuyUfBbx; Tue, 28 Jan 2020 18:27:29 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 7/8] mtd-utils: Fix potentially unterminated strings
Date: Tue, 28 Jan 2020 18:27:14 +0100
Message-Id: <20200128172715.19545-8-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
References: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_092735_895417_B9BB04FA 
X-CRM114-Status: GOOD (  11.72  )
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

This commit fixes some uses of strncpy that could leave the destination
buffer unterminated.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 lib/libubi.c                  | 3 ++-
 misc-utils/mtdpart.c          | 4 +++-
 tests/checkfs/checkfs.c       | 3 ++-
 tests/jittertest/JitterTest.c | 3 ++-
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/libubi.c b/lib/libubi.c
index afe3648..baaca2f 100644
--- a/lib/libubi.c
+++ b/lib/libubi.c
@@ -1008,7 +1008,8 @@ int ubi_mkvol(libubi_t desc, const char *node, struct ubi_mkvol_request *req)
 	if (n > UBI_MAX_VOLUME_NAME)
 		return -1;
 
-	strncpy(r.name, req->name, UBI_MAX_VOLUME_NAME + 1);
+	strncpy(r.name, req->name, UBI_MAX_VOLUME_NAME);
+	r.name[UBI_MAX_VOLUME_NAME] = '\0';
 	r.name_len = n;
 
 	fd = open(node, O_RDONLY);
diff --git a/misc-utils/mtdpart.c b/misc-utils/mtdpart.c
index e480e1b..ba35d87 100644
--- a/misc-utils/mtdpart.c
+++ b/misc-utils/mtdpart.c
@@ -174,7 +174,9 @@ int main(int argc, char * const argv[])
 		case COMMAND_ADD:
 			part.start = start_addr;
 			part.length = length;
-			strncpy(part.devname, part_name, sizeof(part.devname));
+			strncpy(part.devname, part_name,
+				sizeof(part.devname) - 1);
+			part.devname[sizeof(part.devname) - 1] = '\0';
 			arg.op = BLKPG_ADD_PARTITION;
 			break;
 		case COMMAND_DEL:
diff --git a/tests/checkfs/checkfs.c b/tests/checkfs/checkfs.c
index 3e34cc4..203ad5c 100644
--- a/tests/checkfs/checkfs.c
+++ b/tests/checkfs/checkfs.c
@@ -512,7 +512,8 @@ static void processCmdLine(int argc, char **argv)
     {
         if(strcmp(argv[cnt], CMDLINE_PORT) == 0)
         {
-            strncpy(SerialDevice, argv[++cnt], sizeof(SerialDevice));
+            strncpy(SerialDevice, argv[++cnt], sizeof(SerialDevice) - 1);
+	    SerialDevice[sizeof(SerialDevice) - 1] = '\0';
             continue;
         }else
             if(strcmp(argv[cnt], CMDLINE_MAXFILEBYTES) == 0)
diff --git a/tests/jittertest/JitterTest.c b/tests/jittertest/JitterTest.c
index 797035b..2bee0b0 100644
--- a/tests/jittertest/JitterTest.c
+++ b/tests/jittertest/JitterTest.c
@@ -859,7 +859,8 @@ void HandleCmdLineArgs(
 	      /* Set the file to log console log on. */
 	      ++argNum;
 
-	      strncpy(LogFile, argv[argNum], sizeof(LogFile));
+	      strncpy(LogFile, argv[argNum], sizeof(LogFile) - 1);
+	      LogFile[sizeof(LogFile) - 1] = '\0';
             }
 
             else if ((strcmp(argv[argNum],"--grab_kprofile") ==
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
