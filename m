Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EB6606A31B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mMi22sXJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zqg73gGA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EHhweCVd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=orSr9LzV+pEK4XQbPZuWoVK1CQgNxxb25NtiAw4RTCI=; b=mMi22sXJuZefSGadxCqKCmydRV
	iGCrDVJ/JlG5Gh3r+4qsPDg6IeBBiiLKBZeOXquRU865hAFh5L41YBTJdJ2EQJACM0azUHHaYN9GR
	2XmkQgHMBcDYbKHy5ReW8ieoYgZwu7hoAclMg9YqCpDr3KFqhgHWOfKOUDv/Bfjn3MscGuvXEqoAY
	JKHwwY6h8UUkJ4vB8U0x/mzK2zN5H0QLFBYTyo0Li3xzKfbTThf9Tp8dI9zxDU5ZXrPGLwkonYtdm
	Hj1cn06ZbJesmCBHLdy2Wom//bD/fngLBN/hAvfzqk+/zjqtgqFgQA9hxkpGApnJM3+3hS2QZYkTQ
	5+/1UC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2ej-0000000AEYl-1Tf9;
	Thu, 05 Nov 2026 18:57:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cy-0000000ADTI-3W1c
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=; b=Zqg73gGA3lH/4EcnFhg15NfjOp
	caH+f7iPdKBCyXVO9IheZ+3vB3yz2NRODdMFZm0BCfVvIW8NFXPVOsEy1GXWVDk578EovLrfOG4qE
	yTJ6rYZ2OKgOGTbRpewrc2+RrPMXrfr60s496O18XVOwHiKE2uL3TfIMFyJMYLzl/XJoWma4sp6kD
	wpT3jAK7ZE2h/CUc3lhVGba6hANAZp8BVripwksdDAw0rG3LwfnkjLTlnz9h5bd9xqExLqrF0FtmK
	71hB/MqtdunQ3AlZf8njodnv+I0K5sZGi0yyRohhPBNDoT6VAuzduoue2nTYTGXdIjxOUH7OKYgFy
	5gMtMaPQ==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cw-00000003R18-1Di2
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:55:59 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6f8a519e215so1084376eaf.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904956; x=1794509756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
        b=EHhweCVdesr1Es3/+EkNHI2cPRMER8H1TABySD8nFlhR/P4PlsjgL3VSrFC5e/O4ho
         z32p0MMaef6zhjGdsD1Al+BzrTvxmc+gs604lCHuAbyVbqgy/zSQqN7PbxV+OCigEwYt
         +FScxtiJjUnvQL+zt8ja8oJKCjrnM525PWKxZjz3qDfaO354vNbtGqAMPFfcyQqOIHhI
         hVgoh1bJ4gnLoFcefO0N9DXpR/Oq9CEN+FdZp29SAKp+9gdr510HtIO1x9TwPibIet2h
         uapzA0sputU0/OuY+7BVXtQXFyRki6NTNENF2jOXny05GfDyXuPibY7HQ4GMsfo8Yu+A
         R5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904956; x=1794509756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
        b=UMrkFRIsQnDEHduT3wHjUZnDpAKCUIOsY6NT+VrIoBWFoy6+klmbPOip6YqsO6Ktt9
         3d5myTyNTPOsX2ySRcrdMIiQiQCRND+BvvX8SFmF1SjPYW70p+oX7QFr0fveNNyKAOP3
         Cr3kiCm4RZbWxMcE9Z6KbSSh+Dktw+/rZcZYu+bDrwJ7sKNO4jfSspiKUTwCvwwueu+h
         y4Fi4fB50TtX4J5Y3u/CIpW+SvDM2xAKj/S3R/TsmDyLxRlCbMS4Z586U882ubNz9m9e
         DinuKjOMhcEUeLF6O+tlaZBNjAZ8UPITvGJgSxZWhY875Wzc887eUnARieGHv+VXxvmB
         YDIg==
X-Forwarded-Encrypted: i=1; AKwUvBx8s8cJ8T84n5fuLkwo1Knv+tcLxCo008D4XTmV/PfgYUDvmxquLbAEmeogoIIuyJdkvQwoSFeHbzg=@lists.infradead.org
X-Gm-Message-State: APuU4Z/APEk1QkaTKJCagboFhKJwu8gQKej+Y3ppYCKwo3vidScFSNj1
	608GQz75k7fx/kAkxeLlJXcXcT6lHizWkZlItNE3+kMVJ9EmbfMqBw2h
X-Gm-Gg: AYBFou2tRdjSDC2H78+PUZ0RBX2/j2Ks0UrnX9GkqVjbJj0OaKsABIQ0pRdcuBm5l0G
	k0g1K7S8ch8/zHjkC6imZYi4CdqxdUWUx6xP9bv2/b+k3VMbewJ4PjHKRYgNrCwAO6ZU9QqJBFA
	VeSFwd/UtNuiTIc3pl8iNrT38j4SqgrcoqjHzjz3e0my+GKJ5+jES8/+ZXvRhZ0EN/1CRyLLf8y
	F0OiCX5oxiuHREXvj2v0GN9QXdkHjHOoEotr3+Z2bfw1Mu/8w6ws0cUhEZZsxi5Q70Tr0zBnkaj
	aCkcrKJUDV/FELkBoTjeeH62Qhgj3k8y4RyQloojdcd+mtRrEJ6lbg7iQhwxRNVnA+CB4F7v0A3
	yge158fOTWiKNYhQKJTS6hwJ/QSARFuZKn6N20n0sCQNTmRswlkl4VnfVHsxdRrNjicefNI5dx1
	OliR8+KolfxXFqQ2SibQE9Kor3j/GfjhDhBcbqgG6NrFjZtG17aHkuIufCsyEKA7U2Y8FO0Gkxs
	SAbR6nuAfQoMGSftmNRze8WfDUWEJ+NDj7eSl+j13ABiW/uddLutWxUgJvP+dgq0l6oLxSxLScc
	W9epkXGCFJSy4b5mElPGJGYT7n8G0jecK2oS5iD49oMia6JUGueYxBkmsh/DrEp5cRfCBEcNGil
	icN4nfuvp6wXXCTBr8VEd82efCdyQ1KTwIkgV9JC07hP3CSJ36Td8mftWd85HL6kRPG3uLC8YEq
	NhIlTX1jsUFpO185dYc62X4P0R3TGfUIbOnw5PS6kxwHXM6likFGnsLw==
X-Received: by 2002:a05:6820:a03:b0:6cd:3fdc:2669 with SMTP id 006d021491bc7-716e79e8336mr261121eaf.42.1793904956099;
        Thu, 05 Nov 2026 10:55:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:31 -0700
Subject: [PATCH v10 15/26] mtd: rawnand: sunxi: send all address cycles in
 split operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-15-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_185558_193585_917D8321 
X-CRM114-Status: GOOD (  17.27  )
X-Spam-Score: 0.1 (/)
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

nand_subop_get_num_addr_cyc() returns the number of cycles in the current
suboperation, not the end offset in the original address instruction.
Comparing that count with the start offset plus the loop index drops
cycles when the parser splits an address instruction.

For example, an instruction with ten address cycles is accepted by the
parser and split into eight cycles followed by two. The second
suboperation starts at offset eight, so the old loop sends no address
at all while reporting success.

Use the returned count as the loop bound and retain the start offset only
when indexing the original address buffer. The parser limits each
suboperation to the eight cycles supported by the address registers.

Fixes: df5057999f8c ("mtd: rawnand: sunxi: Migrate to ->exec_op()")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 54377f1789a3..0b92bbe19c0a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2518,7 +2518,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_ADDR_INSTR:
 			remaining = nand_subop_get_num_addr_cyc(subop, i);
 			start = nand_subop_get_addr_start_off(subop, i);
-			for (j = 0; j < 8 && j + start < remaining; j++) {
+			for (j = 0; j < remaining; j++) {
 				u32 addr = instr->ctx.addr.addrs[j + start];
 
 				addrs[j / 4] |= addr << (j % 4) * 8;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
