Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C6E606A331
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 06:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nt7yF7iz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vP3BO+pP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TAT6o1DIiCupUja061UeFCd8qnRf4SaoA0ltOo3njM8=; b=nt7yF7izwPqoU46RvXJG2xiqKp
	QmqI24gUBc1U2YXL7h57SbtF9twt994ndiHDLmDYsqZ5h4ped3XJKGOwtprTrzXBVZbUIzVSSvN0r
	5bTTZQnGqtadJCgStPWvkyIZGzV5iNLVkOHjN93QuesYc1EWYPEQqrTqN+KhwxRiGw0gfBSZUXTEI
	ppTHXrWsyjwpipFRSnSOYi7AjAFTFXOhsH3ca1yj7JDQBELxt8sLdkU2wWjgS2pwpIRH0mT1Krh7v
	dww8Xx59aJXiKevwawDtsqxZm8npnt32Eo9f1ikAN7WcPIZouFmHHa1ZCpXMlnca66D0Ret/6/dll
	QQBHLj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUFQ-00000004OkE-1Qjr;
	Wed, 04 Nov 2026 06:13:24 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUFO-00000004Ojn-0ddq
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 06:13:23 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-70b875f6f13so319423eaf.0
        for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2026 22:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772801; x=1794377601; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MVU4a1WbyoYsCog2h+z3lNAS2j7JA65g4JUPcSPW2I4=;
        b=vP3BO+pPMUCsydj01iU1J32iDqXVuRYqeas+Dxy1r7U8MRI7iKpdG4c7z3YQYj7lEg
         urySZWPsenVDnYxLv4Pkk4WD8/04IA9Ddi1f78VG70LkMkZ5rC/gWcTD5+6XTtXM9I7E
         RpLyWBNibF5nUD/Zf2NCpoMa+/iA7PPQt3qI1Qbmjp298vdcgba4ilwWtM/JUCAPx4uF
         6gzepiOzdCVQXRHJwyc0TE7A976HnS97Ol2vo9CaIaLYxJmDxA5pFQR+bdmMB1RlqU+D
         Z1/4a+WS1BfLXY1vTSw7T/VZcYcbCtUC9H+Qnqr/oVIEl0NwRxGkfUWHvOTf9Wclcu3X
         jzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772801; x=1794377601;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MVU4a1WbyoYsCog2h+z3lNAS2j7JA65g4JUPcSPW2I4=;
        b=a25cSa/oZkCI72qNY2/38/7HfOQTo3fLoTZuiOeta6DpngSgQBy8dTEhEqURw5ic0r
         2H/EZ/gNWKYKnH9czHuQailvvYWcN+Id7mqrG3DaxmfNnNik5NFWVLnlodXiPfrNl0/M
         mwMIp9u04+QSnGL1Ub8AfDHkQYqB9+2tkDP4+xjjsT3PfcxFXiIXtEzSFda4cHh/UEqh
         KLSEQREmKnlkYw2unuCxHCmCT4ujzWL2WL59jCwkEfDciCnlgoJonoalV4yiKbsyiSxZ
         UEUmMPbb3U5K41GWdZ1x+WkBacjqxYlx7EUs1X43vH3lTh2uMTvxecqfibC7Hb47hfIa
         fSSg==
X-Gm-Message-State: APuU4Z+Yi6Yy02dV29siwwgJTCCL1YaIj2/KRHWwIqLccS96dK2h8v/x
	EGoKrhwnNjWXUEMD9S+VQYJ3ovQCwEXbjSk3V1V/luqRuJbcayyjFA6U
X-Gm-Gg: AYBFou2uCq1s/TsAGEXSDe7YyyaTzyurjmmIYHFwJ/gMcCiQjD0p/0pOGnqi05qLw4b
	YsmzhJZGTp7PS96SyAGNcZ+U7XXzEpHgFewXSSpMeGs70/dOcMpxo9tBjxG6nB+9dw33M2xWoqx
	3fiWpBv//0ZJ2We/M5SE3qtbcPpDuVeM9y6+Xs7lpycpdtlxcAhxWRmb+BH1gaKCHx7mlBsLkKx
	anHkR8vm7EHkvX7eqp5zkXHXToB+UHofYeb6iBFoVqbbkwrPYPh8YNqyHyanr9XqPia3qw8MO1Q
	j9C36qYsXToduhwVS6bbgnZfFhH+pI/XDTZ+DnANaTG9Jnl9GbacPl2Kjv3/4uMb3sVrMcQPvXK
	OqhSX2VOXAzKbLEHXygqSH9aftwvN4iwxBDa/81Yc55VMLZKCT3LsXEsht9CMPcwvQb+aslhTS5
	3/kD0UDXtfKU/bSLgO/G/vg2vee1mLv6102o29Pp7NvHGbf9ViJ0c8MbmPshgCPICM1jpF59WCf
	gtQZMmaQN4ya11EAAS6fMnY+m90m/UvU7fqfdNDirwgKWDXudTSQlURODQQ85e5c0OdzZ01lLvK
	RvHlSgr2ec18w0l94Q1rQPmFzNRx0CSEK6+8Ptl9QQgcKkDLRyh6zqQjn+j8/z2pWAgk2XMIJkk
	3jyCVm4isBoOSCACaS4oHtJ0M4cC8S6xClzG+m94fPNJ1s3XnNARsUZ7C4ByWWNViGe6UEC+Hq7
	iM8NFtNUijIhmTVvbTQ4pS4xdp6kwSu8KskqTHKL19T3DB0mE+qqt3
X-Received: by 2002:a05:6820:83d9:20b0:70d:d3a7:24d2 with SMTP id 006d021491bc7-714f255ec1bmr6371290eaf.64.1793772801020;
        Tue, 03 Nov 2026 22:13:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c129a718sm1037919eaf.6.2026.11.03.22.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:13:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 23:13:18 -0700
Subject: [PATCH] mtd: rawnand: propagate timing-mode recovery failures
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNMQ7CMAxA0atUnrHUJFUGroIYQuoUI9VFTgigq
 ncntONf3l8hkzJlOHcrKFXOvEgLc+og3oNMhDy2Bttbb0zvML9uMxfU8JYgIxaeWSZUiksl/WI
 1GPwwOJusTy5Cc55KiT/743I9uiEPiuUPw7b9ADRS+VWFAAAA
X-Change-ID: 20261103-submit-rawnand-timing-recovery-v1-a64432f26f3c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_221322_222516_70BDA283 
X-CRM114-Status: GOOD (  12.72  )
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

When GET_FEATURES succeeds but the chip does not acknowledge the requested
timing mode, nand_setup_interface() falls back to mode 0. Both the
controller-interface reset and the NAND RESET command can fail, but their
return values are discarded. The function then returns the successful
GET_FEATURES status even though the fallback did not complete.

Check the controller reset before issuing RESET and propagate either
recovery error when there was no earlier error. Preserve an earlier
GET_FEATURES failure and keep returning success when a timing mismatch
is recovered by a successful mode-0 fallback.

Fixes: 415ae78ffb5d ("mtd: rawnand: check ONFI timings have been acked by the chip")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_base.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a5b278ab9384..cb57a7d81810 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -840,7 +840,7 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 {
 	const struct nand_controller_ops *ops = chip->controller->ops;
 	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { }, request;
-	int ret;
+	int ret, reset_ret;
 
 	if (!nand_controller_can_setup_interface(chip))
 		return 0;
@@ -909,12 +909,15 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 	 * Fallback to mode 0 if the chip explicitly did not ack the chosen
 	 * timing mode.
 	 */
-	nand_reset_interface(chip, chipnr);
+	reset_ret = nand_reset_interface(chip, chipnr);
+	if (reset_ret)
+		return ret ?: reset_ret;
+
 	nand_select_target(chip, chipnr);
-	nand_reset_op(chip);
+	reset_ret = nand_reset_op(chip);
 	nand_deselect_target(chip);
 
-	return ret;
+	return ret ?: reset_ret;
 }
 
 /**

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261103-submit-rawnand-timing-recovery-v1-a64432f26f3c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
