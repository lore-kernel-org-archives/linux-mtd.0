Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22070606A32A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 16:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=douFgAhj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ny8bhEdt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+iTBSEw6bpTcxp1ZuKTNDK5Adp+vny8pIhQL30jv/68=; b=douFgAhjDBfl+P21D+EyIzge0C
	B87bQUZlPVvO4whYOK06yV/XXt0lb4ArlgltGI7EXqm7h9jd8NSYp85fJ4/1GQy6dAVeXDXBfe+Aq
	pVZCPCOyKI1+JHuJUSLMQbbLxNuhz8KeERO27HXyxeEmKLuvYyv22T2Cn8NgYW7BMpdNYyP9/a7vX
	QyK3hzpX1a8zzYLoujvDOQ/GKwfL4XrfmsQQHquTWWwKdxxqcN4XH5KkOkTc5ysaDPPWumpyxSazt
	a6w5PwCX+qt+5JEZV8q4zhlBtDNq4t1v8xb8lE+L7DwMbHhCichnUqYNAFVP8GSygyjIGZ6/cvJVP
	JNQFZJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLvR-00000006PRP-25Cc;
	Tue, 17 Nov 2026 16:20:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLvP-00000006PPa-0eBs
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 16:20:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so460535e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932447; x=1795537247; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FRdBK0dChlQbRTj5qPhb7tv/PXLs2yoPzatxUDU3hFo=;
        b=ny8bhEdthLIV7RviBf110eKOVikNTZFzCF06MayP/5JdJcGQA8j84KzE9FappyWs2s
         ZNgiJ4yZml1amHD4z0R3mfBO0WiwGJtlNjtP2ZwcdFvQY6rsXnV8pSmcHB/itbPpZ0HK
         YNiwg/w4HeKivSQNGMWCPLVNdwjotoAzzy7j/kLP6Ze5YooqHnLDsAbk21+8FDvl4z52
         Uo8QeRl+N+QZn7/Gx1fHbVh8NwAmpwjfI9IMn65o3cs/jX03VQ03IGWr/DRZPyye+ghF
         mRdPSNAjE1qoQy/xMXpLgkyTlFOM+CNYo4ix37xXw7DxHZ8f7Vah30zg24/MOXzWIAUd
         Fyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932447; x=1795537247;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FRdBK0dChlQbRTj5qPhb7tv/PXLs2yoPzatxUDU3hFo=;
        b=jvpG9nCB5LRtrhgypfvOSHoTxcA43EIqTRxdRMWdNXolVNhffHNV+rSj2BihMpdZjL
         cD98SCf7QSZpnkFqkLTdcAHt9IAp+g2hqa4qz2SPXjVPd1lV47JYEB+FIyGyvDmEaybk
         RamJOI11ME+WMwUokwJ9xz3IHVpbMFYxvJy7YgObQhttzJJBl9R8HMMwIq8trubOmnyA
         sPmEnJNbbWPtH9CXg1KroGa+ioopbX1OoubS1xbdYPMDaddnr/MnYgZrz1g0glO5kqvN
         ++Vn8bKLuL+PQN0SQDLGTPazp/KGmVl7FS7W0UjYNI0HS0VMEWgT0LTp5YL35G0wSlBS
         pgGg==
X-Gm-Message-State: APuU4Z9PBCeV4jUX/8fVVwrzrYC4+T1WUr98o3YJChMYQ1QAqlIHl6JY
	JXxXeqhM/RJ9J3aq2ghdFqbFLRT6m6F+J2i26f9OCjnI4gO7ni4/9m6l
X-Gm-Gg: AYBFou2GLsz9XJHiF6FL9v53B2GYcZmhSlZt/dpHk8OY7RzfKuzXJGQoLj208n+Q7V4
	iqqJuUpZMuX9vQHfM++6bOxjTDVDntVDrHK8xIObEA13u6tb5EQsw9a+3ACmejksoo3UL64GwuM
	mlywCAtOtzLOKJlVhEQdXtUo9uezB7scohn6Ehbsn9T3y2LCCVMz2BXxCJbvodz3aqSXSIyajxl
	372hK3kppqcEA43e4nXIKvXtbnA30/fedo84wa44m1zkSD12lzECXINIT055xcBZRLh6IgCbVwb
	dBPsyNKQwWfiRkwpGEfjEE21ppbtZBZmapp/1umwW+Sx8xpPH+4y8kHmmQweAn9tNSJ8cbEUdor
	DiqZ8r+fy3E6zSHlE+Ff/LgvI1T9F1DhflMAp904uDVRHNZ10fL4ZWCk27SPywldDvP1nUlj87G
	vv9kmAiII4LDxPAerSb1bjipSpyDMmx02pCvN9K8b4UqjDOFJm+AFoKIX93Zer5bkHBaiCS02up
	lM3s4vhwzJYX9bh8ESKRkmKHm8CiR1inVXMiTGL1DlQRHRENBXKoKqYFJeNwqgvmI1X/1dYx4vR
	y2sGg+b/wsqz4wWuIKiE7MetL05+vfSUZ+n/BsuVopFSrblc13MjzbFFg6m+PuwjPNbVEmXuMNQ
	/1EE=
X-Received: by 2002:a05:600d:2:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb55a57c2cmr230733695e9.10.1794932447000;
        Tue, 17 Nov 2026 08:20:47 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7839cabbsm73217975e9.11.2026.11.17.08.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:20:46 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 17 Nov 2026 17:20:41 +0100
Subject: [PATCH] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-spinand-set-req-type-in-bbm-functions-v1-1-f46d5b3b8cf3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDQAwAvyI5GzDWutCvFA+6xjaHptvNWlrEv
 xs8DgwzGxhnYYNbtUHmr5i81YHqCuJz1AejzM7QNm1PRAEtiY46o3HBzB8s/+SO4jS9cFk1Fg8
 YXroQrtxH6rgBb6XMi/zOz33Y9wNpZ/BsdwAAAA==
X-Change-ID: 20261117-spinand-set-req-type-in-bbm-functions-34775e6c14e0
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_082051_220150_9CCCB31A 
X-CRM114-Status: GOOD (  15.78  )
X-Spam-Score: -1.8 (-)
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

Commit 701981cab016 ("mtd: nand: Add a NAND page I/O request type")
added a 'type' member to the 'nand_page_io_req' structure and updated
the request iterators to utilize that, but the spinand_{is,mark}bad()
functions were not updated by the commit. However in both of these
functions the new member is implicitly inititalized to zero which
corresponds to NAND_PAGE_READ. This is correct for the spinand_isbad()
function since that uses a read request to get the bad block marker
bytes, but the spinand_markbad() function does a write request so it
should set the request type to NAND_PAGE_WRITE.

Change the spinand_markbad() function to set the request type to the
correct NAND_PAGE_WRITE value. For consistency, also update the
spinand_isbad() function to set the request type to NAND_PAGE_READ
explicitly.

Fixes: 701981cab016 ("mtd: nand: Add a NAND page I/O request type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/log/192383 # See "**Investigating `req->type` in NAND Write Operations**"
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 18bba02fbd31..35bcb4a8861b 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1105,6 +1105,7 @@ static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	u8 marker[2] = { };
 	struct nand_page_io_req req = {
+		.type = NAND_PAGE_READ,
 		.pos = *pos,
 		.ooblen = sizeof(marker),
 		.ooboffs = 0,
@@ -1148,6 +1149,7 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	u8 marker[2] = { };
 	struct nand_page_io_req req = {
+		.type = NAND_PAGE_WRITE,
 		.pos = *pos,
 		.ooboffs = 0,
 		.ooblen = sizeof(marker),

---
base-commit: 760d2efe91a84363d25c1051a10572242e75fe86
change-id: 20261117-spinand-set-req-type-in-bbm-functions-34775e6c14e0

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
