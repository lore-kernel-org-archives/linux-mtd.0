Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4633760A3820
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QQqx6M1V;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LUnzml0U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bGIOhWKifi5k+JowlSeEQ0JmG1+F+TBji4XN147rI8s=; b=QQqx6M1V0rmRsUbbH1hSue/7Bt
	DNdU9Vie67Z1gBjdGjDZ2WVMdFCO40AqxtE8L88zMQsFzOdWDKwkbmZ349O+8gaJV7oY9r9wxD3Cg
	dYvhHEARwDwARQZI1smM/pzkwVi4qi0fv78hUdVz58Ey28mCpV3H8EikaQtLaUbtKenXnUmFODBSf
	SWqdA+/oYlL1ha7QxhAy6hBctihYl8rEnSAOgwZViXfMBXY73qGgva8d1YkFtJNSEkLUxgFAoWo6Y
	obR3rBM3mtZYFwJdCTqUuXWfih1fHEEutLNi2c1NZQwAKS5FqTgG06hs5BiowXPC8dWMXv/PbWV63
	0LuqEJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdv-00000008ONn-3vdJ;
	Thu, 12 Nov 2026 01:30:23 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdB-00000008MsA-39e5
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:43 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-4c5d8c7f326so1480298b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446977; x=1795051777; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=LUnzml0UIo7hEecRC4n2N39tSP8fYmAFzjEFHCbj9uKyDP52yh1/vuDy8R98m04Cpf
         gzkaJxHiRtVNeix4RxTZtMCvoRNfB0Dlzsh2z24n39lkSpsV3KuxtXW58chS708dbBYd
         T2469WiKVjeqD1UN7lDcZDtMQeRZKPNhqk4Gc74hHz0eGZa+SBg4N9ukxV7baF5Bi6jr
         zCAl9R7iKxb/EOB9+eoBsqSwAq9JEW1E88L1538iHzLSNtsT78BzR5fBBnNAn1x59maN
         JYsPG0LqoiwCqBe+f5r7NxOskqcmIj9jrpFGeJb6XoJqCUE+7xzsi43j5a57uRZUvb+q
         nS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446977; x=1795051777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=Mukxtg+94GhvyIGMA9f3PIXiVdz6jyp0rTaBr9agOwcEu8EMMhRoeDB0INfdvUDvKV
         ityPVtgzwUWiuCu976lxgFK9Bgmap6zlXa7x6v54L66keRdUlJPa0RyWNqsczxYkanfG
         ElvN+O59mTpHHlN/WtY8+GZWYlrmzSrjSUckke5EQUKxa0jAMRIkvgD7X++aL9dlNkLR
         nEfp2h6ANCgv7FgjrEol/OnRJX34ie0BadfwL9ZgPrc4TIxetI2VH0bWB9bn33Tk6Fbj
         FjXCnNPuGMC75Y77PLm5F338cyhF4Aa1F4kKbn5J/A7eR3wQcNNjhWgAFn1qrOmzdtOh
         Al5Q==
X-Gm-Message-State: APuU4Z+QglwNMuXlPjYabPCrFYoA3HUDr6EOrqhdLyIrIjRdB6EStKpC
	NQLlxRMbwtbsYAsEsvpAh+eoMUDTL7LKQJ7y6ouJAe+jKIBPZ2xrxvC0
X-Gm-Gg: AYBFou1LR2JDhQiyWEvpONUFgrOVM1wRcrLjR64+TYPnEtA1/aa55J4SrAcGaxtygAT
	rqEJiPb0pb92YRPx6UcnwJFSPwLVg8k1EpXyHAMKc6SUSxK9Mx1Z1d+PkExqmpHuyuGURKeLtGj
	I1PP6ESSWRPtppYXHKzwi7UHIrcHzhfnmB2M/9IJC211mCqA2Y/ky2mF9GnfBKW0akRHGUSu1zH
	ESjY5832Cw2RUiESD3jhIa1znRQ0NM+KcepkmvhYJjvinOdOuKSLH5Aei8WmwmXqbILJD08etv5
	cNBkCteSlvkNGiAfS5L96y2S/QUi3iLJFqzTAUf9+18YMUD7aBjnsunxccr5wnWLuxmnNxWVb1T
	sqouW/AMgGVZ0ahOPffiyuWGGooYptC6L6XZy7L061CLSWcinWluF6VObAL0rx7CO1bq0XXdPOn
	ST/wW/rge21MKmP7I+B7iLoZE43RauPLEzUaFoqcIWrL/Q5ysuyHk7V4wtwdHsPC7b38vWiXyPA
	SqmhIoxc61or8p8iDJ21jfLUCW18KG3Yv3ubP9QeHC+XHPqYGUSbQBcIgeruofV/5/jgZLajWVE
	cJ9w/1JpATKTAtiPG6r3OHdj8KrhRVP13fYDnnTrog+zBewWZgkigz6mWVOhvqJd0fSGMfpwTrC
	O6bWGuBNeBtgOFjPv/p9QI7I9HPxjtLxEz9ozre2+y/MKmSVe2Df3t+EMkIabvgKGDlJmIWUYke
	a2HrBXpecHmj/kqT7BmkbIU44dqsmC/9wS8Sk9bmBStZP0+J0ncs4k
X-Received: by 2002:a05:6808:2384:b0:55c:a67:d111 with SMTP id 5614622812f47-56b962938femr3705666b6e.19.1794446972046;
        Wed, 11 Nov 2026 17:29:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:37 -0700
Subject: [PATCH v3 58/58] mtd: rawnand: diskonchip: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-58-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172937_875299_1FB15E79 
X-CRM114-Status: GOOD (  13.44  )
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

MTD references may outlive a partially published registration failure.
Disconnect before unmapping the device and freeing the hardware ECC
codec, while retaining chip metadata until the final MTD reference is
released. Install lifetime ownership before the late initializer
publishes partitions.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 540b6baf8bb1..2c6d0c0fdb2d 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1466,7 +1466,6 @@ static int __init doc_probe(unsigned long physadr)
 	nand->bbt_td		= (struct nand_bbt_descr *) (doc + 1);
 	nand->bbt_md		= nand->bbt_td + 1;
 
-	mtd->owner		= THIS_MODULE;
 	mtd_set_ooblayout(mtd, &doc200x_ooblayout_ops);
 
 	nand->controller	= &doc->base;
@@ -1494,13 +1493,21 @@ static int __init doc_probe(unsigned long physadr)
 	ret = nand_scan(nand, numchips);
 	if (ret)
 		goto fail;
-
-	ret = doc->late_init(mtd);
+	ret = nand_set_lifetime(nand, nand);
 	if (ret) {
 		nand_cleanup(nand);
 		goto fail;
 	}
 
+	ret = doc->late_init(mtd);
+	if (ret) {
+		nand_disconnect(nand);
+		free_rs(doc->rs_decoder);
+		iounmap(virtadr);
+		mtd_put_master(mtd);
+		goto error_ioremap;
+	}
+
 	/* Success! */
 	doclist = mtd;
 	return 0;
@@ -1535,11 +1542,11 @@ static void release_nanddoc(void)
 		nextmtd = doc->nextdoc;
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
 		iounmap(doc->virtadr);
 		release_mem_region(doc->physadr, DOC_IOREMAP_LEN);
 		free_rs(doc->rs_decoder);
-		kfree(nand);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
