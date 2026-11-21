Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BD8606A69C
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=edk3yGAF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aFMkyAQe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaavoAbc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2HunzIj+pAaq7WlnP0oUfeFC/UDTDXAxZl3FOmhH+pI=; b=edk3yGAFf9Tirz5z/v7Ssn/1ry
	hPmWoqs5Evy9vs0W9UFLgqvAJA9cBGmcL9qshgFIa1GPuRrOog/ssnei6YvZvqx6BhEsNaLcKQlaV
	+hlJ1ckpRXVR1DbhrFLf/Pwtic6C2rs7dyoJ2rHK9EyJVb38k6N0IToPjl+EPgj+gPaxKljnwusRr
	KE7m3CrZIiYu1Dbt9sNmtC7ps/OBu6rQ4KCXO2D3OtON38hFYPWmN7+9jYLQxgkyxaJCuM/0BQFy/
	v0ZFzEovaaxEwRnmqYc3bBd20Xe01XRQ6Qbpli9VVBH5Qqg8kWonbIR0dEZzxvqLCUe3ecxa2mZM7
	NJQ1NGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZg8-0000000Gbd1-2HXJ;
	Sat, 21 Nov 2026 01:14:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdl-0000000GZp0-1SuY
	for linux-mtd@bombadil.infradead.org;
	Sat, 21 Nov 2026 01:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=; b=aFMkyAQeIBhXsPGSddVzsn+JmH
	C3upbDBu1nOSNafH4BLEONfL7AlbTpV/PFhRwDBuNVUytOGf6EchVM6EWIZnEsUyUzKdgyvLzHxqd
	FLfS2/8WpHq5EQ8MEb2Gs4Y2HOxIXf7fsyRG24v8jQlVg5bZpd64MJgurOnNvi881LqZwPw7NiYCX
	CDJ410xyHhL7PPTQDluB6ysPkWDutjpOizb0HRHYWhU+JlBdcGgiv1OTkbIk/i44pA1KhPEQrthry
	imd0hiMKTMIf4qtEiWPL5Lt3B9N0Zg9UFQsnalsT20imFaW8/cNFYQg2h4ldTDAUA3t7des8lpFiH
	Zn8ZCmFA==;
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdb-00000001MRP-1ASj
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:35 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-53dda625f63so913211b6e.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223481; x=1795828281; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
        b=eaavoAbczuwgz1m8zivFPellXohYm/Wxz2YJVEXrCsL0I1iIoys3Y1dXrQI/OW3v2/
         szzSxjAOtV8xYFVcYDcMvV9xAoveYt8mO8JdL6XmZBLLsPzBn24nsf9koMAsLhIODYNz
         92qvULmLatE/D7N/9+afLeLwWfSQ9TeuNkDrMYUT68fqTwhy3bMMkErqCv6Z+XLairJd
         4FcHd4Uh1fKQQ3eD0miorNDhps3vryHRMQK2NUukgWE8ChIRoelNXfGMNmmak7QTNnoN
         g53gl0TNjqze62yVBLYNplAF9GW1Yh1+flswEsTeRetMYVHUuWj8r+jqIdb4Ag6H0Qrf
         sd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223481; x=1795828281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
        b=a8dHMCyM2VDk7AgevS59wF1WuVPbdFyvnYXgKHJOx3AlplDzpE0AvdsKv6OJnhdFZ3
         Blrna5IpdjOmBvGms9kJwmEEwpBI7eqh7NfaCoghfoWp7Ytd+R5/OL3KAGSg+evRJqM6
         g0EZf7UNCngRXh+1jRo2ksxzYxGmG3Mw7gGc2WaXUfSUX/vpplBV/VDRPSLRVsc+4eqU
         Dk4evk+a2OtirNnG9YhzrhVrVgXakNA1A/8W/2vFb5zfpWhKBV7SiOtky/M504MxHjC4
         WVhoY+zZkj2UWmSfKOFQ0kaNsklT/8PLOF70k7CHASWkrb0pm7ShwdhO3n2QagklDNpe
         0niw==
X-Forwarded-Encrypted: i=1; AL+hErH2K026JoKHYO/A49kodeP3+7rSYFTaV1svcUwn7xjzNhin39ddiASi7k4eHGJhTDPtbQ4yOWQLHLw=@lists.infradead.org
X-Gm-Message-State: APuU4Z9OhhVq3euq2pxUWI1WAsvqAWVTm+oAqWiThZgrCeVTmQ4o2K5s
	d1jGi59ZrAOwFbqv50LPLMz6s6+19Znl28uDq/XpdWJ4XfMOBdCXraKx
X-Gm-Gg: AYBFou2bfdWqggsRhE/x+9ldDYxkF3hYIFB4XbcI4q/9JbCznQcxSAgBQgcmaENK+gN
	lzfF0Uh+KFA3T1uPtwqKL5avABVWL4nn3WhabhUIbFt65oNKcfBL4bn8smuou9XgdZ3WghNiWbl
	dC/ZLWyduvwJF0tBgfZcQFrusUDfluxjaZdhCy/wo2ruubxjIk//Bdh6we3s8rTDN/z0rDfakGN
	7D2txP562jdZpZ+HDDRZQK+4xbL9o+WhjdyCMDOP4mWZilPKF+cgT5/lKKy7qntZlwWDVFecAci
	cjAT1GXaYX+cAsy2+hGY6esdfxGXk+9rG1mh7ocdV3VJEbAWB8iYgCPltr3cgEpGRqFCupuZDRx
	mhusyf1NJi2aBQAgaVmDuUeWv3HtYEj8T6r/WSlGPCi7oDbif1z37UHLdgVkTISpMDCV0+XdrOA
	OupA7GcsSn+nQkmH3ZksfP3aeCmKxz+NzjtXPANEg7lZRU3nyDZfUD8tQFbVLXI7oGRdFQ2J8jl
	9/3EcYiy/sverMKe+W0XJ+UZOJxDmSDQDT/aLF8HjodbNnWzdZxtTLJvZskCAqJjn5EzwGYSgZ2
	8uOMXFfdH4mJHrknP43Tz4yqYnRvatg7Xr0ME33iWR8IO25+AsKAavFyJOJzVhHz6Pv97utAi9w
	AOlmJizb/+16y8wRregIV0yKt4x4mIErSupoLBAWemN4Aoh1Vpg/99XX2NaW+rdsucI/AizeT8j
	v3nPnvfpVG3NepwzA7wWG6QNPnHQOn9V1hV8jIhXtfJKxtM10DPMZPAknB31QJit5sZ/xD5F74a
	Q==
X-Received: by 2002:a05:6808:152b:b0:53c:156b:a16d with SMTP id 5614622812f47-57a0a70b0d0mr5784172b6e.56.1795223481233;
        Fri, 20 Nov 2026 17:11:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:41 -0700
Subject: [PATCH v11 18/26] mtd: rawnand: sunxi: send all address cycles in
 split operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-18-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
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
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_011132_932933_817BB797 
X-CRM114-Status: GOOD (  17.43  )
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

When an address instruction exceeds the controller's eight-cycle limit,
the driver can report success without sending all of the requested
address. The parser splits the instruction; nand_subop_get_num_addr_cyc()
returns a count for the current part, but the driver treats it as an end
offset in the original instruction.

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
index f8bc6e3c3ac9..ee68ef9bba33 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2410,7 +2410,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
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
