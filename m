Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80D606A336
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 21:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yR1vuBCa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=APUrQj/9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OF1JOnMXdH524njp0zWAhs4EBNaU/PVPaBJhPIlV0D8=; b=yR1vuBCaq/yGXGlAFxRm0CfJoJ
	UCanoErLz3sFgKQC9N/yk6SRF90WGomNtpTjL3qM8bcuGEIViW8gzqWN4aYcW1duMS0PT8N00/lVD
	+w/HbMzf7IOxnIxoQI83pXsv+5DRF9Hf0hiw41WXnAMIt/WwIsOY1MrHJEhYdv7LFRR93F9FLLanJ
	cwQZJ/8M27hiUgszhelHC4rkEapWzEUock+ZJLh7jOusn6NmYT7H+ynYmngPEZXuoXILXNmIv5Tz2
	SAsIqyH6v/A6TrBhCmvWDYnHDuw/sTqVIaMsXbY/z5YttH2u3aqGvypQOn4n0io2vTKYbOoQYmRuN
	eHzIWdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyRr-00000007w29-3TVH;
	Tue, 24 Nov 2026 21:53:11 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyRp-00000007w0P-1TBk
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 21:53:11 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-385d8a00598so7378443eec.1
        for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2026 13:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795557187; x=1796161987; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vn3URFnRIWVoIF0NpOGs1A1tfVNX7pqnXS/S+sLc+LA=;
        b=APUrQj/9n+zlgVLbozOZ/PqbjyD6pjpOUDcyG98kAs5wV8u46lYu14w8Qg3hZP5JVl
         OgQyPvi50k3RlOlWY88BtPXk6R2rZy5bSt98vLDZBbkpRUWEQC2niF2iwZdffBXLCDIM
         bPHPpZ7sW5cPOQo0kMpTF9RgI8nD/Af5qEiEo3+Hxlaj2AL2cYkpOfaoOUWav1mLrh1B
         tYMeQgl18pCNrzPpei/PAofKp5HH8jL7/mMO8yVH/5YgOhteV3ptBqFDuPKGyEWgNwtd
         3Hbm/t63so331oDPKU86F5fea0Rz8wZnDoEYtjdfI56u7g66j4caAjDnNPlqCrhzQUkJ
         Rvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557187; x=1796161987;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vn3URFnRIWVoIF0NpOGs1A1tfVNX7pqnXS/S+sLc+LA=;
        b=QCBVX8v35c96XtY9PrxzV/GPeOtErK18AmUx8UY4TP229jnDizGQQ9WcTXCX/uWkdW
         l9OoWfpZab0oRUV50d60ngmcXnamLMTrZPyIlm5vhcir9KCOGXFqgQ3RnZ9uYxIatnps
         1kUlaZ0OH73+OgbmhehhyXvHvuRdKRPDVybor47nx/qwsf9yJrGtAXIiG4Ywf4RY8LtZ
         ttxjsQ7FektbK0nM0tqKQyJnK528ePKP24uuUb4y/68qQJMpLmDIWYgalmti/JSWKD30
         dCvGKymWyNGJ7KHAJ4Tdpbyijb7sNMnB5cJGPmjMgPnqpCtGFPhtY2IhvVl0rgM2gRwd
         pzzw==
X-Forwarded-Encrypted: i=1; AL+hErFTLD5g8VVvIUbZTU1qliQXy/XyZwFxd+UaABTdMf/Esb8QZf8yQG6UpRldSFZ526LtunKlsq8C4vY=@lists.infradead.org
X-Gm-Message-State: APuU4Z/wLNXMWAlUCGIVkw9gLqu5jDWeCioN1AEF/PyBYLUua1b1qDD9
	FDrNlBA0ZpXdROg/4GGO0ZbhAmfYQiy06ldnzhgQmLnlr0bMlbFl8CVpfHzS6qEvFPdnT11E71P
	ifWhg
X-Gm-Gg: AZFdTZdIqQXVBouIAk3csepl73Fn9lsyiCm6waXwTCgRSodQUtyt8DAfnOg47CelZv1
	/9x8gNgtwIjZx52FkUdacjwkAgJnx75bqDeUI/BvFVIco6e/eFi4xl0zwRszISlJvWM26nbDUE7
	2XXyye1p5C4RN01Iqu6QW+eq7/On50TVJMPjjbh4Zzz0nvy/fcG37re8iqPbriWxeeZ50XCYBe2
	pwvQENqhnD0eQZgRhvxus70Se27IzrNAijeSO++Of8AjbGp/4slhcuq86wsDA8AX/wk6r7NnGkO
	arNhFydVCXS7GgFItfxW2Vp61eJOb80Kyf/w9JFjpTc/TkktxHojSoRPsu/aK7GyVFqJ6wYhBv8
	3VLtlppdAZDjmRncGp4RbyuDbRkx/66ZoUEM1xJUX+OFrG5mdTO5B/WSUhgOc18neYLjDip8yBL
	ifYzPgxxZ/TekMAaYX2c7+ffpm3nrPaHdye66gQwGePpGEa4/IkNZS+uJ95h9y0vjPXYXpCzxUN
	EWGWXwF7iBFsscwP5nLRcQysCnQNGoFTrlTepdjxsK0rnmhPfwqCAzlp3fT6aFOOaFAjOiO4PhX
	8jbjrxidkaDfaGvVe2eFRhr6p43sOhPc0LAEGOoE6XGhVeckxtg+IZqOqmXKvIepohhCMUyAdCV
	EfH5MxYf48jPi/Z7jeep8qsuXAY5qKEW9k2Nr7vj/yEDsjB4=
X-Received: by 2002:a05:7300:ce93:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-386bbfa6402mr4406242eec.32.1795557187272;
        Tue, 24 Nov 2026 13:53:07 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm84442424eec.3.2026.11.24.13.53.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 13:53:06 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: kmehltretter@gmail.com,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: [6.18.y] Please pick MTD OTP NVMEM double-free fix
Date: Tue, 24 Nov 2026 16:53:04 -0500
Message-ID: <20261124215304.40737-1-artem@trailofbits.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135309_399429_7461DD71 
X-CRM114-Status: UNSURE (   6.26  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Please pick commit 26300879cd8e4612dce66bb8f6ff7cd35fcf3e59 ("mtd: core:
avoid double-free of OTP NVMEM device") for 6.18.y. It fixes
CVE-2026-98834.

If user OTP registration succeeds but factory OTP setup fails,
mtd_otp_nvmem_add() unregisters the user NVMEM device but leaves
mtd->otp_user_nvmem set, so later cleanup unregisters it a second time.
The fix clears the pointer after unregistering it.

The fix is in 7.2.10 and in mainline since 7.3. It carries no stable tag
and so far has been backported only to 7.2.y. 6.18.65 has the same error
path, and the patch applies to it unchanged (one-line offset). Older
stable series are affected as well; this request covers only 6.18.y.

Compiled drivers/mtd/mtdcore.o on 6.18.64 from a cumulative x86_64 tree
using allmodconfig. No kernel boot or runtime test was performed.

An LLM was used to check applicability and stable-queue history and to
draft this request; I reviewed the result.

Thanks,
Artem Dinaburg

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
