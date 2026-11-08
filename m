Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35134606D81C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wxpN5xm/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+2c6X/Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7zrSh89sGh+mYfHXxuTF+hEneP6UVRhFizIpNzoBiPs=; b=wxpN5xm/4knZXRFDLBxlCSe3nk
	1FxnVAmyWruwLJl0tKZ2xY5QJXt1GAM6eGPOAZdGryRoBeKlAbIeOhRArbrK1petqIx+fdOlgLjNf
	6JUhkcEQo+dUs0R4//d1p709pvMHJWCBLL2RvZOhrhVJVUAALtDbROy99jKC8m1+3WjOs+sssu/Al
	yAz6SH8RrWtpveM+7jj455+/7Q5NCQ5sizSd7MwaiJu/Fztd+KKEre9Rzsarnv5P0fluPOccYJChT
	jOU0PCGGmrRK/UbeoxlaR/I/4zyYekpa7nqgZDHsYE+5RUORi5wfl60Su7DawMpDmapm76/DJV/tz
	970wfi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAFo-0000000GhWc-3WBG;
	Sun, 08 Nov 2026 21:16:44 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAFm-0000000GhVV-0FKy
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:16:43 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-843b6f8e2c7so387280a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172601; x=1794777401; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YqppGydY2lVpcg6U6RxDeq0X7ii+knKFWwlrA7dV7j4=;
        b=R+2c6X/ZWezWcfGVAvb/yplgqUN2hZbT+VHSW28zEghLYu2Hv5wDPKAoO8LptykNUH
         hiBKRqDmrw//mw+zkZpY1P9KEYAdq5aDQVK3De3fnl2FWU9E74orl994wm6+OY321pdd
         G6by6bhm1gNKPZvbYGURdDmJTIMv0Gt7J7qR0cfC6gqXgmrjYjduXWuFkryOEyN/11Wr
         JarCkwwKBqJcImsSsgnQgjfHzuVKRIlHui62rw8XHBoChTPksTLySRHzNCihsGUr5o73
         U+35VvQWu1bfSt56kpSr5pUA00g60wTPtHegU7qnfzZ7wwAa5U/Uve/vcI7EKRkAUOYM
         zMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172601; x=1794777401;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YqppGydY2lVpcg6U6RxDeq0X7ii+knKFWwlrA7dV7j4=;
        b=hmmTvfARS9NHxx/Ll+D9VlRGFO3hAFujlc+PHww1ZltoOK6RlKyn3UPmGlV21XTv80
         BPj22/PY380JTAY6F5vCb4P9+qNeQDlI+5c9wa8Ceo/RfHuOHfhVYy4rIpB9F0mcWIqu
         CnFeZ60gFjn3uJLpgVVoz72dNzRZBWb+31y7gzm1aIZMlXDNKxBVaxFZT14BojjMJAmR
         emUqTzexygv1aH1JrsU4qHcsZ2D3ma3MYBLznaWclYBMxR6PbE9f7Pak6nur9rN9Fhyz
         BPgHqPo29v0a3Czc8gtV/HQsSxaqm98I6+E4yx+zvwbNROaI1l/9gGRR1YC8TvU/e3LF
         kWlA==
X-Gm-Message-State: APuU4Z/iCLhZPc2vgSK1KQhAFDQxL6Iw4t7jlkJP2PrzUVTdREALEuQH
	8nvs9od2NfuzKJ6M+RYMm/x/JusB6uJm1j2FR0+mdpvdHWHbI7Ezgbkx4TmmCw==
X-Gm-Gg: AYBFou3JcLcV0SdaqYvVQpt9MwU4nezzvqjOu+VNwmMEPbV7r8Nh2YfVFaDimSrUS+I
	DYtvqpEKIn3knmiCKWlrMGp9+tpTWJ/WNeOEy65W3ATHitW7RpjjWEt0ZEKXHsPj0lnwizvlTrk
	Y4QfJLF1C4toziYcKXk4cku6lBJ2LvYc1xyrpvNIk/zdN5ULyMMne5EG8XspRvb/1aPG9bN6+jx
	nO7yDVb7rDOGlB/yjOFmcVFCqmUq+YmrC+FDYKMMffEun4B5sYREFaLOYXtszwQZCZjeYLMznF5
	MkIQolssGBH1YTxXpC56DYZzd8O/ssxamRP49Y8PLlJGgteN5ZHhwSlUHyrk9nq7KtV8Tk1qhBM
	FUgPTpCdmGa1zAkAHfPTP/47G0SnhPRfiXdyqzLJtmp2OfvHgsjQ7pbqEJtwcQzfBsKrnp13V2s
	iHPoYu3Z3OcwB1XgzZz9qnDr6JgxR7jiNAPUNAU82cjG8IQOwQIOBHpDJllS7Hc3YWCldIL1H9/
	woZILfOUHFJXlMdZ62zjwjfQXaxR4hGwSCt5ULx6GXl1WEIOo6wTKJkMAWJlRyiod7ODnSYiVOE
	O59xS81vpFXbtr5LNEUKiOyqHadVDDdTbR4iQCFNr4zlJQwUyxDaKNtTk8l6zfdJuUfKvLsMRqZ
	Sw3SlARD9Q1RjHTmFPbo5QIpS4vtzkezFjHddd++wib2FVfzgS4YvPzVnQk01AT3aZMYz6HFWCJ
	HgCZaLuGvB0yMxW3eiOgKOylnHJSEMGKFOJb4ssScAjXRzOvMY1Rc=
X-Received: by 2002:a05:6820:1381:b0:70a:df8e:8f64 with SMTP id 006d021491bc7-7170f259c8bmr1073868eaf.22.1794172600816;
        Sun, 08 Nov 2026 13:16:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: qcom: unwind failed child initialization
Date: Sun, 08 Nov 2026 14:16:34 -0700
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3Q6CMAyG4VshPbaBzSCJt2I82E+RGtmwm4SEc
 O9uevh+aZ7ukEiYElybHYRWThxDCXVqwE0mPAjZlwbd6YtS3YDpY2fO+HZxxmCCRzfxy+Mi0RK
 SSJSEq8KxJz10Z6MG00PBFqGRt9+j2/3fRXqSy1WvF9YkQismuKlOc/Zt9dtAW4bj+AKcTNgMq
 gAAAA==
X-Change-ID: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_131642_105110_255ED135 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
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

Keep the shared BAM transaction usable when resizing it fails, validate
the boot-partition layout before publishing a chip, and propagate child
probe failures after unregistering any previously published chips.

The layout and allocation fixes make cleanup safe before the final patch
adds the missing controller-wide probe unwind.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (3):
      mtd: rawnand: qcom: parse boot partitions before registering MTD
      mtd: rawnand: qcom: retain the BAM transaction if replacement fails
      mtd: rawnand: qcom: unwind registered chips on child probe failure

 drivers/mtd/nand/raw/qcom_nandc.c | 56 ++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 24 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-qcom-nand-child-probe-errors-v1-f5e2703a17a5

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
