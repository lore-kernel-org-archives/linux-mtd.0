Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6960A2602
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qRPWSgcH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrW9F/dv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=68xqngELGSDjktlfL8spiL1nW25rnTTqbtc43b2rKqE=; b=qRPWSgcHyeKPDtbIml6CgWqLdu
	mwTz3E7AZJCfVXm4scpbpJCjxdvk9WoUPnkTsNWlYFts3RLHPKo5LVu5C7PTF88ZcppqJTGCMyAp7
	19b6X5tQBH3Vcal0W8+ns0/hlJLOE18MibLel1jIdYcELNwUmtukby04OQ1Amr6VSbpO5JUJlAghI
	z/fmHO7/Bxr4T61CxqE0Mgb1goubXi8yms9AfW55TE+EKZ7+drcCQIg7WnO1cJS1+ONwqQD6SzVDs
	rw47LAYXxHr6hCHj4mT9iT9hVj1c56iZG1oWX8tlA7Iaig86fo6WoaMYWoTa113OAz8aPFASJSTvw
	I0qVR0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjbM-00000009ntI-0TkJ;
	Wed, 18 Nov 2026 17:37:44 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjbJ-00000009nrE-0cXq
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:37:42 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-71ada4644f8so802601eaf.0
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 09:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023460; x=1795628260; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A6PuFLIJYWuXo/Cy+3hQI8qFRt6kaCnSgJyOuAQlQP8=;
        b=NrW9F/dvC7+5iWUOZ0QM8VooDlEQyUd2h69H0gNcIK6hPOP0IS3Ips+owzXI1dJ6NI
         gDKc5d1MXc6hfAOP/iApPOETR5TtTMvrUw2EmL1iQXnBjtfoBH7j3Wutpo2wTqCKmAcz
         MMgWOGz8J0Q5WEC7l2yajyuBdD2CGOzxhl0DOppfONkmKvSBMEwmqKxLUipfduZA0Pxr
         /InTvqtzwZQPYCUssSKhbWWnwRGjQ1F2bl+I4R+ZKNB0LL6NDTY79AM9jNPZnA+WC59E
         XSw3VlLdePy8VsSxJ7qeKGoRjEmKcYgGrzqBLItw7L0JDdjAty/dd1Tqd3rFbVlBuxdI
         NFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023460; x=1795628260;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A6PuFLIJYWuXo/Cy+3hQI8qFRt6kaCnSgJyOuAQlQP8=;
        b=CD2pbtFn9nlzvoqSFv25L2J1mSeQAh6HzL1nv2y8nd98JYlx4EXwI9zpE8rOUkidlF
         fY/JEPcUWfovG2sMbyHJz4PHUJDQGdhpTNv5rZU66MgonPp9R82+OK3mDpb9b4LpUx2U
         9rRI7lrEjhZazjlZ1TGQBFjy0lshmAqBStdiPBSUSbX+Num27bhFIlSjcWvpQMyfpSh/
         UWZrxDNv+sbypw/xoDPwuhCFngjisf1WrCA4WFA/OnUjkHErKrOgBCOW8rwwFp06CRe3
         zFdBwLf/o3Ag7jaj8gaI13foKc3JySAQqdKQKJxh6TS01WzO2//rXf8Bp4Sf9vfjZCLO
         ax5Q==
X-Gm-Message-State: APuU4Z9rRpGepyDo9+sykKfj7pLRKp9flu/q/FphwlyCIU8UJS3mwg4G
	prTQWAInjxi/xDQ0ctLB4/+UuX0sePqhi3rU5Dtmj/Q6PHRqbXd8Rw6kIbrIDi1I
X-Gm-Gg: AYBFou3J860gYrhBjlelJMeOAeSTUoBKDOVXOESt0XNzNOaEroOZS+n0qI5yVExDsaT
	1RareC6NAbgrQHhKMI2JO4ORZmvuDS7XHgpt8ZNYEpjeNZMMcp+wX7XpEBl7xU8kJIa9J89vvtP
	iEnL3rH3BUi+CjLIiFhWeVMcb+A8xP19enssM5tqYjRohu6OBjRUWr6B61pudj8XhlNLegLeGWT
	PviOZkifBpw5b3WnubvH1awZ3ugOlf3NOWvkXBBhH91P6vBZAnvB4bDC8uosERVfo55xlNsCTth
	7vnJAOEct6ucZa4JhDKkilz+0eI//mgDiHAxtyoFnp1MDiF5xIKaOOhXuCoEE+v2tDe/mViE0vZ
	1z64WgQ3QKb/Zxy/a1VcgBUnjbpif+kR3JHq63j1Nm5qhBQ7UISjvsMQMPXhSKwYPWwufqHv3im
	qgUriHTKZVyEz/v1DaVRtrZK6ptTjgofMyJs0h+LIVBBjB5rz08woguku4WU4DNOngxy637MqFq
	xH8GdiRqGBS84UNja802Qf6xeFiY4k5CiH+ucWEycw0ney0N0Ix2zJ6d+hMEsvL39FWgvn2gtmD
	j5loxr4knn37ZGuzwalBgyFDz+oqOzn4kQ2fdsP/fh7++qzV21UmvpVIOnO5LAc0J1qaShvLyj/
	zQlLWKm08NO45MLhDdYYy3EhbWwu9Ymw9fj2dYnWwJagFHfnVDqP5HxZDRIZNkOYbRZ4BsiYbBw
	d75ID9AE5qDAspHQi4dczri4L7N7mR5nebPhSVFyBnCK9+ADzHfQBh
X-Received: by 2002:a05:6820:7090:10b0:71b:c44:1dc0 with SMTP id 006d021491bc7-71b185da426mr1708265eaf.76.1795023459992;
        Wed, 18 Nov 2026 09:37:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2863717fac.6.2026.11.18.09.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:37:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 10:37:28 -0700
Subject: [PATCH v2] mtd: rawnand: abort BBT creation on scan failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-submit-rawnand-bbt-scan-error-v1-v2-1-c7b71dd22ad6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ7CIBBFr2JYO6YDatCV9zBdAJ22YywYwKppe
 ndpPYHLl/y89yeRKDIlcd5MItLIiYMvILcb4XrjOwJuCgtZySNipSA97cAZonl54xuwNkNyxgP
 FGCKMCIhaNVojHawURfOI1PJ7TVzrHxfHjVxevMui55RD/KwfRlx2f+SWIlSWWq3UHk/aXbrB8
 H3nwiDqeZ6/PVfV7uIAAAA=
X-Change-ID: 20261103-submit-rawnand-bbt-scan-error-v1-1183d881e5b2
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 "Artem B. Bityuckiy" <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_093741_204607_9518D8DB 
X-CRM114-Status: GOOD (  13.36  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A non-ECC error reading a factory bad block marker from OOB stops the
scan. check_create() ignores the error and can write the partial table
to flash as both the primary and the mirror. Both copies then list
unscanned factory-bad blocks as good.

Return the scan error before setting the table versions or writing
either copy.

Fixes: eeada24da8bd ("[MTD] NAND: Read only OOB bytes during bad block scan")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Explain how a partial scan can record bad blocks as good on flash.
- Link to v1: https://patch.msgid.link/20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com
---
 drivers/mtd/nand/raw/nand_bbt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 93f162805f31..3ca1d7fe573f 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1006,8 +1006,11 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				continue;
 
 			/* Create the table in memory by scanning the chip(s) */
-			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
-				create_bbt(this, buf, bd, chipsel);
+			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY)) {
+				res = create_bbt(this, buf, bd, chipsel);
+				if (res)
+					return res;
+			}
 
 			td->version[i] = 1;
 			if (md)

---
base-commit: 292f737382d3913d0d9addf220b7170fedd7a04f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261103-submit-rawnand-bbt-scan-error-v1-1183d881e5b2

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
