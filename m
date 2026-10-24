Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A88606A31E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Oct 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TsJH35tP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=Kwi1OnjY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KCvRy5sk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=Ue+qLMJioO6rzEKEDvc7bhPQo7wVzdxSnl7Mss4ACVA=; b=TsJH35tPp6ZLobQfidk2mu7bId
	aL+6pK0rffc1D39YeNBuOR+s/go8PusyZ7eJ0UIsgjZfVsSS3whAMKscjrWA//t1WN3g9e/eNgWtj
	IteJzktIyX+7dFLQFIqXFbVLs2n/bOEQZf5VOocD1g2EhAu/umrfKD9AET9tlSePfDHqdo4FLb2ph
	jpS1QFL5o/uLwfdob7i97VCt0Fx00smtzgPxGbmuFX+KJdbKP32h2laRSPbdKAoPjHz2cFKj58yf5
	YPYbaMYeG7x3t2MnMMrkp3p6xvrkrGlpiZ2nOPzzwFsuWxWjHX8G13HQahdILlfcHxyEq9WbFMGFX
	I0DDTuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKb6L-00000000BsM-2IjA;
	Sat, 24 Oct 2026 12:43:57 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKb6J-00000000BrI-2V7E
	for linux-mtd@lists.infradead.org;
	Sat, 24 Oct 2026 12:43:56 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 033E81301AA7
	for <linux-mtd@lists.infradead.org>; Sat, 24 Oct 2026 08:43:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 08:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1792845833; x=1792849433; bh=d6062e6bSUUlWddrIbH3NOj/DEf4lofE
	60bI1EY1rcg=; b=Kwi1OnjYsYBA3LhNh1OPBqRHOxBLjAJNexDLkRUdsc+kxu3M
	bzljCRBsgc2KhxvDbwgYQjeuIgO8mYJ+lUau7PyfZF20BuVlBfIF71b/7TGbrhmi
	k15agGdVxdOJGaJJmMYwEsA2o7MhfzmTeJ8p9LhkT8uyePGm3ITWC0v2gug6SXCv
	RucloBdGIugqv3l+Skzw+bgsHYsntH9SU+SgB762gvQwy3aGAhjNsEtrL+F5w7CX
	fVpYnOYaKxc7gS5M86PIW4vDKRr06ME/qVIEWiXQTn5XrTJROqwjBF4eSNf/PdSf
	ao48nF9yNpA6eroVtaHBE+AyvnSqUF5LVIDtEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792845833; x=
	1792849433; bh=d6062e6bSUUlWddrIbH3NOj/DEf4lofE60bI1EY1rcg=; b=K
	CvRy5skKXz7k5CR1gS/ojoGvYp00V730xESRcQF7UBGLmczJiyphdjQ7lkIZenUw
	RHG/mnwPSNj/H9ARUrwKdx9RWnIkKQRLUKoKxdI5rGID75MEIHV0cwDE8VU6mG7k
	mBL5oBYNlL1PFEgQMoU2sQQ9Hl+5gdczQGQP55OqORb1YbaZonAy6MFna1h6kLhl
	I+478x8M5g3vP1Orghh6ZUiiJgyYatVFjuUP3amO9TUpsg7mQGDcHZJiLb3MInKR
	A9b/VLL+P3irsYb2hl8hHsPnEN+V7e8l19NPP7qxN2QJHvG08GOWs6sp7vhJxVJa
	X5bU8L2nNHVaJKLNXrXFQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792845833; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPg==;
	s=fm1:rsa-sha256:pJa7uMwB1AQ/OO4Hlo/l7NJXkqqGye1o5UGt+S4CYmmzmkD
	MOItKTWGj0aWHQYcsTvqTG/+/kQiCCP8iVj2T+9hMFjkvmu01cTj1rbInux3+PVY
	KM7T2QqnubIGdT2/lYCOC5qPITDnkRqU6AtswsS6891Zkwbz2qNWWL3QbHICbRDv
	/hTec+4jg3r65l8kjav7flCDRmmtTRIDUYD9ry9tTiZmlBUar1z7DCgoAXcPZ/Mz
	Xm2Gn2GA7aaVoDFOw/Me1emS3VDSRHtpusqJanxlCtcMnwn5pNnUR+ccmDFTpZNJ
	ERjj6dnqNT4aEHv4nsjBKB23F8AEC7aHWTwS8+Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2NKwsGw9d2A4hAoi0ehVybY+9PD1JyRefv/FD8ljako=:Gi7oEoUrbrO6bmjTMkQZehX3dOlLmjscyksLkR5ot4k=;
X-ME-Sender: <xms:Cajcan224-b8X83JoBxeclrVi0tLE-xQKrpie8WEezmDucnMir4RbQ>
    <xme:Cajcag7Vs2GQNGerWu_Pt_av4bOmT-Sn685afAJBGClhMH1AT_JiISreRhI150FCb
    hMw9BZNyOVc1RAmYwc847wjI9w0vmkWeAAMzoHG8HipGxEZHRajy5udxw>
X-ME-Proxy-Cause: dmFkZTECxb5QEdLpBAptvAY21mG1tOFS3Gj7uFL/G/PKyc679LOlRSC1hKjgX8OKgDqZuv
    F3aKuj859jGiV/CInLovKdvDY+6y9rZ5ZmgR7pSm0BYvKEbrIXj5CvawsRpE+pu2yrB3ka
    ZgctS0gmRPIDAFWh7MJWap35G1Tml8mWJrWEqp5swIpB2Dyi0ZqOsPlae75pUu/LvJufAz
    uGDGHgiDxzusO0rEo03XREG0ln55JUogdm8v2V/EKKUz/v2eCjHlIzTAmhU+l9KnrdDTSR
    u7DxrslXlaXxIwGIseTqtTww+A7Z7qt8lq7YvQlAL7Ut7ldsF43rg+pfmhC0LmqP4egbPo
    Ki/xNC3rgdd80fB6SD46VAdYwsRcNIFGhCSzYbaZDwKIQLWSsCpyunkSK9t/cpcbSQAn0q
    VtkTKQkpDCJcBAzpkvvXsm2B/SWuKl+Jqg+NtmjK5rSDRf25aXWeEmCrTpLG+Q7Zi3OJjd
    czj9mwfgeBHcy6Pqe9RWmsMP0e6zzZevBbd2jHkF4zZx8TiZZ4BFmvPFSRa9kozbdKYcXi
    bkjMQ2jXjK2fvNOw1m06xsH+S7u1X/RNxMIyMvpx3uu8zQ8dgDt4AzCXY15Sb7V/fRKWnB
    K2JioCTxI9LuU8SmKgy9mKVBCTpF0QcD06nWQ2pXXtqmEfG8eB/zwcIKDUzQ
X-ME-Proxy: <xmx:CajcasVkBU3mUFZZJR-N75uNZUyyfygeeoaf4xLt4CjzBqNIaEszng>
    <xmx:CajcargEoe6GouN9MqBEzLC-PXG1bdKeX52a37JQ1zvBQVbkwbCN2w>
    <xmx:CajcavbIdDztRrrebiChjNJuYtCyCVjGiO-rj4XmXsEq10LXc7J2Ig>
    <xmx:CajcagqZ3D8DwU7wVaNvD8FZxNJ2uRr9qSEQoDC5IzDO5eWu10SjIQ>
    <xmx:Cajcaoqdfu-xn9WyNHK6BzReDuMxoDB8PsxpE6cD0POo7jzUT953Not5>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 40BA770006A; Sat, 24 Oct 2026 08:43:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 08:43:53 -0400
From: "Alejandro Pacheco" <ale@alepacheco.dev>
To: "Richard Weinberger" <richard@nod.at>
Cc: "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <67a5dbbb-911a-4f24-b862-9dae24f958e0@alepacheco.dev>
In-Reply-To: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
References: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
Subject: [PATCH 2/2] ubi: Check the data size of the last LEB of static volumes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_054355_723626_BAA994AA 
X-CRM114-Status: GOOD (  14.31  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alejandro Pacheco <ale@alepacheco.dev>

For a static volume, init_volumes() takes the data size of its last LEB
from the attach information, av->last_data_size, as vol->last_eb_bytes.
When the volume is first opened, ubi_check_volume() reads that many
bytes of the last LEB into a buffer of vol->usable_leb_size bytes.

Nothing bounds that size by vol->usable_leb_size. When UBI attaches by
scanning, it is the data_size of the last LEB's VID header, which
validate_vid_hdr() only checks against ubi->leb_size; that is larger
than the usable LEB size of a volume with a non-zero data_pad. When UBI
attaches from a fastmap, it can be the last_eb_bytes of the volume's
fastmap header, which is not checked at all. A larger size makes
ubi_check_volume() write past the end of its buffer.

Before UBI comes up, check_attaching_info() runs check_av() on every
volume that has attach information, to check it against the volume's
record in the volume table. Also reject there a static volume whose last
LEB data size is negative or larger than vol->usable_leb_size. Images
written by UBI or ubinize are not affected: no LEB of a static volume
holds more data than its usable LEB size.

This needs a crafted image (the VID header and the fastmap carry CRCs
that catch random corruption) on a device that UBI attaches at boot or
that a user with CAP_SYS_RESOURCE attaches.

An LLM coding assistant was used to find this bug and to write this
patch and its changelog.

Fixes: 801c135ce73d ("UBI: Unsorted Block Images")
Cc: stable@vger.kernel.org
Signed-off-by: Alejandro Pacheco <ale@alepacheco.dev>
---
 drivers/mtd/ubi/vtbl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 06d87a3013a..f1bd6e1e488 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -696,6 +696,12 @@ static int check_av(const struct ubi_volume *vol,
 		err = 5;
 		goto bad;
 	}
+	if (vol->vol_type == UBI_STATIC_VOLUME &&
+	    (av->last_data_size < 0 ||
+	     av->last_data_size > vol->usable_leb_size)) {
+		err = 6;
+		goto bad;
+	}
 	return 0;
 
 bad:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
