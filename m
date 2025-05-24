Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32AFC54ED1
	for <linux-mtd@archiver.kernel.org>; Sat, 24 May 2025 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t0Vtnu1T3gHe9+P30BcUWeYFsasrWiT5pqBkptHD60M=; b=CeIx1cmZlqSc+q
	RZnq0S6T5V5v0GdVnrbmK+00f5hhFgGyRPdsbYUvvDyeuSTBjx+xand8q4Ir59t0OMnWdwWnC0jqM
	P8gkW9TzZXWDI+6CN7G+FaGvhj/8u1AeBRRzEXVZAOhUodGVQDry4UrtD2FkICJp+MBAecuLn7OvE
	8iqwFt0mGkKgD9jSJXPlCR7fLV9UFKjZ5/I/ofDG3pp+PjydxySwJQQvVMuN24LLYWPjKJFCXkbOu
	Svl2/rdWE5kuUZ5E96NzFMcj+1f+MR+6upfhwkCukjcam2sfrmPfoAHyRGzcaxbeGC0AvSSykuu6q
	lm2EiHywosGgvvqET0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIsgL-000000062IX-40ig;
	Sat, 24 May 2025 17:29:13 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIsgH-000000062Gd-3q5U
	for linux-mtd@lists.infradead.org;
	Sat, 24 May 2025 17:29:11 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 78F62120008
	for <linux-mtd@lists.infradead.org>; Sat, 24 May 2025 20:28:54 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 78F62120008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1748107734;
	bh=9e2NGCZXdKaLTi6zNY5RG65DkABPO8WloFrYVCOsn/Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=F4AwNAIUs1WuQNM9or4A7BBgLE1bj2TvthjEoWGFTGy8shfTlaZ29Uz5KCtFdMwrY
	 kiNh4rYs7jclbvNyYXV33dASgkf6t6rq+q+6U2r2yo5zS84iuOdQAm+MuJhhZldHW2
	 gbKIWw+hn/bO2+FGQbaKpushvhfyjFR56iTY2Tb/QKMStZ3tfl4LieNTGuba5MXHvK
	 7e7XLTlptEGqRHbtiVLtT85SKF6wdyR5+BT/cTQKTESQad76eMjMmTPxaUYG7gDWoN
	 HwS39qsqCGflkGwGpGXOBWHH8j5jFUtdz0ftoaLtkQoG+aa/79KC0ZS3dW6OLW/p8i
	 I4iV1zX7HBCAQ==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS
	for <linux-mtd@lists.infradead.org>; Sat, 24 May 2025 20:28:54 +0300 (MSK)
From: <KAMenyaev@salutedevices.com>
To: <linux-mtd@lists.infradead.org>
CC: <sdfw_system_team@salutedevices.com>, Konstantin Menyaev
	<KAMenyaev@salutedevices.com>
Subject: [PATCH] ubi-utils: ubirsvol: resize volume using all available free space
Date: Sat, 24 May 2025 20:26:39 +0300
Message-ID: <20250524172639.1294040-1-KAMenyaev@salutedevices.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Originating-IP: [46.138.23.227]
X-ClientProxiedBy: p-exch-cas-a-m1.sberdevices.ru (172.24.201.216) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 193567 [May 23 2025]
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiSpam-Envelope-From: kamenyaev@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 59 0.3.59 65f85e645735101144875e459092aa877af15aaa, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/05/24 14:44:00 #27632728
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_102910_619644_B30C9E69 
X-CRM114-Status: GOOD (  12.27  )
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

From: Konstantin Menyaev <KAMenyaev@salutedevices.com>

useful in resizing last ubi volume,
some kind of auto-resize ubinize option.

Signed-off-by: Konstantin Menyaev <KAMenyaev@salutedevices.com>
---
 ubi-utils/ubirsvol.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/ubirsvol.c b/ubi-utils/ubirsvol.c
index 73d2f68..55f6794 100644
--- a/ubi-utils/ubirsvol.c
+++ b/ubi-utils/ubirsvol.c
@@ -57,8 +57,10 @@ static const char optionsstr[] =
 "-N, --name=<volume name>   volume name to resize\n"
 "-s, --size=<bytes>         volume size volume size in bytes, kilobytes (KiB)\n"
 "                           or megabytes (MiB)\n"
+"                           zero size means use all available free bytes\n"
 "-S, --lebs=<LEBs count>    alternative way to give volume size in logical\n"
 "                           eraseblocks\n"
+"                           zero size means use all available free LEBs\n"
 "-h, -?, --help             print help message\n"
 "-V, --version              print program version";
 
@@ -114,13 +116,13 @@ static int parse_opt(int argc, char * const argv[])
 		switch (key) {
 		case 's':
 			args.bytes = util_get_bytes(optarg);
-			if (args.bytes <= 0)
+			if (args.bytes < 0)
 				return errmsg("bad volume size: \"%s\"", optarg);
 			break;
 
 		case 'S':
 			args.lebs = simple_strtoull(optarg, &error);
-			if (error || args.lebs <= 0)
+			if (error || args.lebs < 0)
 				return errmsg("bad LEB count: \"%s\"", optarg);
 			break;
 
@@ -233,6 +235,9 @@ int main(int argc, char * const argv[])
 	if (args.lebs != -1)
 		args.bytes = (long long)vol_info.leb_size * args.lebs;
 
+	if (args.lebs == 0 || args.bytes == 0)
+		args.bytes = vol_info.rsvd_bytes + dev_info.avail_bytes;
+
 	err = ubi_rsvol(libubi, args.node, args.vol_id, args.bytes);
 	if (err) {
 		sys_errmsg("cannot UBI resize volume");
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
