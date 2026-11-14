Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15215606A329
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 20:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Aq6eFg34;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7tbQKcL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bj0WdVIS+//29EuhOcbbUOVy8tBUBDdf/ir0CNHkhBU=; b=Aq6eFg342VC13RzXmv0lbLETLZ
	cJGAs2mgXLMdOPFyCS2dIdCNrAL8doTN8wCye+AvEgE4XAlWCrUIFLiMmsKmQm/j5H9CBiiXJnd6H
	tlFxmMqQqjG2anYuDew+jjvLupuGLm1sST9BWb7+T+l0UzVSoKJA16HskIW0LLk5LZjA26n48yvGx
	Kla+N+YA9mIrywv0AG0INKtwbFpQBC/YmJkZh1eLR270O0paqRpY3kWguhciV9OT4qg1jjq/5rUaM
	PmEhSMczqKik6vXt4vYULb9CPfoxJ3GtRiFMO8eWASncCAODJrSdQqtjC8PWH6sycofgrcMULTBOk
	f6beQ5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSK5W-0000000GiHs-3oIg;
	Sat, 14 Nov 2026 20:11:02 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSK5T-0000000GiHZ-3gpy
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 20:11:01 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-55b8cd4e2abso21875911cf.1
        for <linux-mtd@lists.infradead.org>; Sat, 14 Nov 2026 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794687058; x=1795291858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1YarXMG41jTbZALuXo8AzZfZMlmVAmtGfykhB4MycA=;
        b=Q7tbQKcLGogsM2pdtGrze/DTXRE7YKGFCuNo+PSMu3J3+UUG4zI23Mjs4DCFOKFKJi
         3FXl573Wqh2mcHlTJNVwz/7+YO/QMpuaZ9/+cHMKW6zNwH66J9jLHMfK37hpRvuFm55U
         ycImili7ozOGnACKvjPBlom9407erMufnpGCjk/yt1dVOhR2oZcZAqGw4qdeYbvIWWII
         fyBJPSBVMeOzXVoZs9QtKntCfT+31vTdRV/Z6a+66QiCI0ad43YKrerktdK5rrK7O/zT
         CcQsJTbG7oBzrQE/XLjcmw3dAkztmDHfoAbPgENmUVTrR0IgoyG9bJJXoZ6PpMvuJIi2
         ElqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687058; x=1795291858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1YarXMG41jTbZALuXo8AzZfZMlmVAmtGfykhB4MycA=;
        b=NcC3y6G1armJ6pqExVE9rPJ+yJ5IIqndVBtfQaimu6DZczKX9tngRnE2sh3ReY6l47
         qLcpzRLJ2qlIAIxGmAlEsEk2ZXEZKREuskJpd4ZTr6HrjvuJObgT+vJsbfD2vBrbSLdS
         WIJ7gzU3pOnA5c4s8vOzxS4cz/3QMjeTz31XjAM9e1AdVd4lwg9B4zkgouqG5JezIzHa
         asBmrjW9bklVFG81rRFUv4imulZ61Q3SbsfLUTFYxnR3iMfAG8kqe32rhoSbc/Th2xEC
         bVI/bWRaxlyBUo6zaZFAPEw1x76iGrLbKuiNYc5SrCxf1/4CofIEw9+0Iq8vhfRQETRv
         6r8Q==
X-Forwarded-Encrypted: i=1; AL+hErHi+IvP9GtuJKEcFSvtNz+nid6QKfJpLRh7R4cG0NY3Cqr/j2WwG9TlkC3VWCFjwO1K8KQAdmWhjRg=@lists.infradead.org
X-Gm-Message-State: APuU4Z/+6B7bfE4bROQoZo2XbMvYSqjmd1dz7GeivVosfN3ardg80onp
	U5YnuZfKqLSzWUuwbtxDfHoUqgJ3+MSbfLeQYtF4pXbzLhRJFY9dkZLN
X-Gm-Gg: AYBFou2FpgkTxRAYr4fx44z+du6S9yW55ZNX/lqXCFUaH0yj0W4HfQOl6cFkk/eMQhn
	8vpp11DaeD2Qe8fRl0dFfDNOowdVfahnKIyDqNXKul2QWcfU+7cBLzBTb4vY0hZMzWaVGhqBNbA
	KGyYz8ypxB3w1JT6bkUBRnxkd3ijOB1fMwukGgXnbqsfSn6QFryrqNPP7NaCMtAZsvcUk+SgUBu
	88GJwDMpmz1P1FKqG83O09Dr2Xwv8em+aIYy/7QyqFesK88TikLmy3TCWi3cUnsAgKvsAHuek6V
	YiTNQLkqZqMs96Pz5fkprRjpCIZSEeJ5AtOOM2bfBWULdSdoPJD3uEdU1sLZJNFPEoujIMaNvZb
	Z/HiadUrOsWJTQ1aI+xqQuPxOZo7YhX2AgXXVfi8H1tzkH+XSha+kjvEJGkUbHYP+VvpEhSP+We
	W07YGnQ3oeLbgYxaikUkWdAonhdvgQSol1FBDXezrvIKhu3pxaAneSiDSO2sXuawQa/w8Y3oxix
	38xfPet3jKDXtNVtPPbza13K2r9J8sV5/JJ8msG6Bip7jpu8Pw2RWRJ0n/7kBFrJ/7nCPMz7qh+
	9j8VzPq7zhdmZPyoboE5trla/ADgVJVAED8=
X-Received: by 2002:a05:620a:ac19:b0:949:5708:3c9c with SMTP id af79cd13be357-94957084b2bmr644160885a.39.1794687058217;
        Sat, 14 Nov 2026 12:10:58 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803afbsm476303285a.15.2026.11.14.12.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:10:57 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH v2 3/3] mtd: rawnand: vf610_nfc: return an error when a command times out
Date: Sat, 14 Nov 2026 21:10:54 +0100
Message-ID: <20261114201054.975225-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114192031.959376-4-mehmet.fide@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_121059_944185_7E1ED93D 
X-CRM114-Status: UNSURE (   7.06  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Miquel,

Please do not apply this patch as it is. Sashiko is right: when the
timeout hits the raw re-read in vf610_nfc_correct_data(),
vf610_nfc_read_page() counts it as an ECC failure and returns 0 instead
of the error. I could reproduce it by forcing the timeout there.

v3 will return it. Patches 1/3 and 2/3 are not affected.

Thanks,
Mehmet

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
