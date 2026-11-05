Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437CE606A32D
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Df0b3DBX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=n1tmnRvW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KrNhxN16
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OXaM/Betk77Z9LHjtk+1s3Z8U3taeNTgsue8z8GAQ5U=; b=Df0b3DBXQXAAJFVC4TFZ5ggmJ1
	h7GeDt9a1SezY7PjAqxghH6IzbaQ3knhwML2ZMYEto/QdG075GoHlD0/wG9j7in6fGKJyi+0GhtqK
	njKiP1G7JQ9CUWERtpXMzpH2oOUlSw3Xx2w3SNSqfZgqCwjQ4bN+BnCGgMTK4IhLixPS1BoTOfrAo
	DqFrMRblgI6iNWo7gVi2+7MhQ6ut+seFhkLQChPRVczBoqvA2INkpeBkjTm5tCtJi/OnFCcREFgox
	ftaDLZOLTUhuwd7ZVuDBtTlUuw3LtxoOA/H3CndhlUEuBdlUL6K55O8k9eV7bbVPXf/GKj5kJKTrI
	ng4R7uEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3BL-0000000ALFK-1BTQ;
	Thu, 05 Nov 2026 19:31:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP39k-0000000AKY0-0joU
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 19:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=DtHEe0lrgHKpeTNenFZAJ2JyMD75E5FYbOoxTznvRwQ=; b=n1tmnRvWDmcrD6ob5FXrEykJuP
	QmPOIADSfKfCX191EdqQW0qq/M0wL0luWjGMlcv5olNcTViegpAtZomi8h+SRLjOlXlNsJCOKwxv/
	VRc4DEXIVAURcT6q1QUzgplyXnC07Gb/AOTlFldFRohUOr12exKaDCjZSwXr4FOTX13tDr48Pzgfv
	G1rSbkB5F1LX97/NTU1q676KieYWpFWorB4/BqOoCZJyYgXyp8Oj14lWQ+EEHr4OARn3mPGMKEg8O
	iawP6bu5TpIQeqB76yWqGebEIwWJJRonYhDtfKDe9AUyzV5hhKi/5tpSQ5/ajtzKhdUTSgw9aymXi
	jFslICfQ==;
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP39g-00000003T9O-3E6D
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 19:29:51 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6ddef424972so1879962eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 11:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793906987; x=1794511787; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DtHEe0lrgHKpeTNenFZAJ2JyMD75E5FYbOoxTznvRwQ=;
        b=KrNhxN16Bfs3qtt9joK8HoqFwCF48Fbykh5DcOs53Qa1Glnsjg9qiiAKnDbI/LOm7j
         Qw3ruPy1ZxYko2+GNovrn7HqdMGfPYnj83PAfLaGQ533XhrP9Xf72m7wXaZ7vGpm/k0+
         Lqk9hnJLZQDrFEMxsYYS5m0IxB6U8mcrf+oAQxSg2OAZGyrIKPIDL35Zdom4BocZGlZx
         rnImb8fMk8j214+2NWcTm5SkfeJXtnAxfQ7LqKqDZIXWrVpJT3YREZx/Zt7ENht3SS83
         h2FeGGKkmPpZG5hy5GYsAFOhXmZu+KkXu4mTqv9kIO9fvQBHDwDxiyhk/IFcfyxj+fKM
         GpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906987; x=1794511787;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DtHEe0lrgHKpeTNenFZAJ2JyMD75E5FYbOoxTznvRwQ=;
        b=GC5nMuDzMgD6KWq3FmQs0szphgbpukCaCk9nso3zclVqs5GZ4D8yYm+6CiZD+N1Z5/
         DsDDLDzK3xuqepMT5c7e/opf3gGP3P0JOd7CfC4UVWy9erFgNKf+ZU8RqLS/3Gjdykul
         nn21wHVR3l8eym/sphdFXsdt/si/OMVkjBZTkr1qXlT+JLhgEnlL+Q8oqNpZdbZgf3hP
         1ZyVDtuBqXpdmOIsof3gaPkLHEOgbKcXO9Otoyxz0ZNjGuuMmQIAjwWE0Me28J0Sa8fF
         7d2/7af1I7a3qIgwVY/J4s/pmi+N+fi9kqc7rbzXxh4Wjvv0qggpLVPL2S765c3ICper
         Byog==
X-Gm-Message-State: APuU4Z+qMBMeB2OxALL+pi9bcNbgJBtG8ZEFMgLlvfdlcIajulEu7oqP
	SEXPZJ/HaqJx8c2A1JWC5i/4HPQjPaTnAhSePei+EIBR2TaYi8pUv+w0
X-Gm-Gg: AYBFou190u2LIKtkPuuwme1PcavPLVg9PRdFWZ5ch6venQIHSnft3NBLqa5ZplM3tc2
	0SkXHj42Lj1T+lCeSiBJlV7NZbRTu84LDM3H0zYBWNWDBG34eGzh6ky/ZPxgr7jXeK9BC0QB3To
	BAl+bRz+k+IUxn75T56V3PadVyZBqbH/nUPd/dig5fekeA7O6Kn4uKYqaaSR9+qYOVRsxJ2otbM
	eSP8DloduxDl1ItuYr+kcDSIgi/L1nA9wCBP0ouI+xwA/Wf31xLJRhPfjypO4Io85Rx1ECiFo0I
	EtUQzQ11MvnfLKoJPhoV3AdDJRjU1t/0iNuEG+l0aRR22GqkXqZLMqLzQTf1r6KJhUv+1SfJWdI
	VG4Zi1Lh3xJs3SYJbxSBO7BcZYzJ5l3DjyKAQKZ7DeZ1JJu46DXT58/N63vL9RH8gStx7gkqW24
	k+73Zfk0U+QiY972KIKoRpua/y7iweewVLr1mcz/RJ91+L335+M0b1PTQHWMHva2a8HsNzJkg31
	k+s4BSZcmRiUxn8osHvO+55NAO5JUuIHXi3Yeipydn2VN4MYMzIPTduLWvipmwXJORLp8Xpk64M
	oxBAsYKSS84YQkMJYGQPqP2/LrFwy6mZ48O8ZXkEuwMr3fnzm29HUIFiQNnATOMTjMTE77Ccl8v
	/73ir0jUujvV6ZnOc4y3oCqELSNG1jlmjTL5HJqTJ5+fMEskGECxL0M2R+TXQ2K/jolK9N4TnYr
	tJOd6jwrURbpOumEcxzI7I2I74K2gKazeVD8CXO3fuyNdjZPeOK2Ek
X-Received: by 2002:a05:6820:16a8:b0:716:e855:4ff4 with SMTP id 006d021491bc7-716e8555060mr340379eaf.55.1793906986644;
        Thu, 05 Nov 2026 11:29:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm177463eaf.0.2026.11.05.11.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:29:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 12:29:40 -0700
Subject: [PATCH v2] mtd: core: reject OOB transfers with no complete page
 remaining
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-mtd-oob-end-v1-v2-1-734bffdc2914@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7RjaIFFX3sOwaKctjLGUtJVoC
 He34AFM/uYl//2/QLKRbYJrtUC0MycOYwF5qIAGNfYW2RQGWctWiLrB9NKeM/psMASNdjQ4C3S
 NodZpR44UFHeK1vF73713Py7iw1LexrbGwCmH+NmPZ7H1/n2UCDyRPitzkYJ0feu94ueRgoduX
 dcv0rCWA8wAAAA=
X-Change-ID: 20261104-submit-mtd-oob-end-v1-f4dc6fbfcfca
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_192948_692859_5558E9CA 
X-CRM114-Status: GOOD (  14.44  )
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

mtd_check_oob_ops() permits offs == mtd->size when the data length is
zero. For an OOB-only request with a nonzero ooboffs, maxooblen then
underflows because there are no pages remaining. The wrapped value lets
the request pass the OOB length check.

The OOB ioctls can reach this case by encoding the OOB offset in the low
bits of start. On a partition ending before its master device, the
subsequent address translation allows the request to read or write OOB
in the page immediately following the partition.

The same underflow is possible before the device end on a read-only
partition whose size is not a multiple of writesize. An offset in its
trailing partial page has the same page index as mtd->size, so the
remaining-page count is zero even though offs < mtd->size.

Reject nonempty OOB requests whose starting page is at or beyond the
number of complete pages in the MTD device, before subtracting ooboffs
from the remaining OOB capacity. This covers both exact EOF and trailing
partial pages while preserving data-only and empty-request validation.

Fixes: d82c36821684 ("mtd: Fix mtd_check_oob_ops()")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/sashiko-outbox-197995@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Compare page indices to reject OOB requests in a trailing partial page
  as well as at EOF, addressing Sashiko's review.
- Link to v1: https://patch.msgid.link/20261104-submit-mtd-oob-end-v1-v1-1-5cb8ad921cb0@gmail.com
---
 drivers/mtd/mtdcore.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..34ab30df03a0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1676,6 +1676,10 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
 	if (ops->ooblen) {
 		size_t maxooblen;
 
+		if (mtd_div_by_ws(offs, mtd) >=
+		    mtd_div_by_ws(mtd->size, mtd))
+			return -EINVAL;
+
 		if (ops->ooboffs >= mtd_oobavail(mtd, ops))
 			return -EINVAL;
 

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261104-submit-mtd-oob-end-v1-f4dc6fbfcfca

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
