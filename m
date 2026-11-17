Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721AC60A3810
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R/LAPq2+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixF6lec5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gd8wdgrgmZl+AI6kXx8XlEOFZibxhGGwrSUZOAcX76o=; b=R/LAPq2+y0avhYiuoETKalkg8P
	0Kl2jjLQDZ7h6+C8MD15lF1Slyv5lUVkH4EDUrX/ZMxdTtHm7lgbvYohTxT/MUHz25smUrXmW1aKx
	WL8LDsF5E/cfph72S9Fo4wIKPxee+FtMfiaOOxy0XUc23iMg7YwQBs6Ss2Wg0aY7SZegqcuvlJDDw
	NIxaSDuh7pVCnLQ0dWqJRccYqltcEMBZ5sakga3YsZSmcUexeeI43/BbsgODcVTe+G0ga3ebf2DAQ
	LXRYUKr9A2f4eDPt19N3km7bw2mc3WdkWIi3wVfcuj9z132vo1U3uM91xoxH9radw6UEDqjJkLDuV
	uhFpjBpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP1H-00000006vp5-0e5i;
	Tue, 17 Nov 2026 19:39:07 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP1E-00000006vmx-40U1
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:39:06 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-71ad099391dso117509eaf.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944344; x=1795549144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+JSBWZUTfeeNWblhp3VV5bFP0F5yNnWU4+fvh7K/Mg=;
        b=ixF6lec5CFx7PLV6z7OTvONqsAoWw/IH+iATY0VnHV9iamjZLWGqHZG1RAtI2Cs5Tx
         /EVJDoUJ/6WBFD1aAcAHEG2dMmdLsbAUhZKBT71iwFatggGbjJmmmx35avlJmgL0q2xm
         eVt92V7WXXdF+Xz1da4mguhWwaAHnWypja0cX8duwWDuNfu/B+ys9b6Rn2GeJw6V7huw
         VTzj8cY7T4KSp32aW+/qXM75pwwE9/HJ3lBiLCULXNCcSyacaWVleFwXX49+waTY2Ihs
         pHQuYzuDtmWn8jfJLipovAUwcEXPf9sCrhie8WwnWiBlMpOXVSwtGRSDTE/9uqSKrr/v
         BflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944344; x=1795549144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+JSBWZUTfeeNWblhp3VV5bFP0F5yNnWU4+fvh7K/Mg=;
        b=jU0oko5fcnzSHbgCb2nkg7opLGBtqEj7JTzhRKlht2j0eXt1dnEWxchJFlk72u0TU8
         fwJRGNsOE24MFoaUChVhLnUCxb15llNeychNPbQmPUyALH5KX3JsR6qP/H+XGJgT89kE
         zB+G5YxmrZtVCrYvLGtDe3GfawOO/lxMt1xvaOyNNdVUkGVjAdCA7F8KPMcFu7ZgWdsR
         AT5cdwbnwCaMV3axjmLCZ81LMmwdeeBdjd2CJEuRnNvRYjSTdMg89GKjOlHFMC3fKz76
         aegcNprHddHcFbsbC3LBmGOmJOVYS9wuXGonbL9tScwZxS9yGsmuVzL9n8WTtNLYzfCW
         ONjQ==
X-Forwarded-Encrypted: i=1; AL+hErFCrlWcjNcv+FnfHjYXHCGGQnIyTYhF3slmAI7BurohLbywQkRVxddjzCOG51UEmv6IcUjRjdUsrMk=@lists.infradead.org
X-Gm-Message-State: APuU4Z9qpT8CZjd/6A3LEk7oYEoAc09nD/ykstV5IgHotspmytcW8fH8
	qkG982tle5eJbaJc4pstKkOwgPynypxLz5ljV+tFyMEmTLSqn+IXikPQ
X-Gm-Gg: AYBFou0JA/IvcPDqp2gDiNFmZIuB3rRe7FnFDqCI/pJPJbpGjiZxZQJE+WgqsW9uPn6
	FHDDMzwV72F73JEShHtLTnrjI3ZZlukPdG4R3M4PcLLqlqsHUeAESyudbKmTjXcJr8te5lyXf2Q
	0Wa7enZEuUp/Tzj48nWnTw7oDANBZoNeqWrl51zrc2qOYZUK0rIKE/jVQnNfXYHAiEsoFf4Bys2
	8bN7w8Fp1KlqJoi7Hz6H4BMcx38zImXU/Sy6muCNcKFh3HJYG6i5fIYSN5BnILlcETu/n2yccys
	tYR4wOjzhGNe8OTKZXgF+7lfeyB4fPBf5jOtYqcedfRXAP/iXrB9NM7wFdy/mJIlvqLNZNydiiD
	QVMlVPcM+egI1uqGvI2vb0UQUgq3QqBA/Nx6YJuzQTuMDbUOSx4m0jF2XzSDLgjd2zfTEw48XXF
	Kjz5vVDH6X20AaYH7337hvmITVZ2O/qZikho62Gp0uHLCAN5qge2vnX6u4naEhKFB4UotFcdH3o
	ciqhHqyd0uQMDBter1zRpXpXYcHkR9eKq7pCzGcX91jf2U6jcJwWuxqgqitVLN0wM+b6FdC2ASI
	U8WffW8+6ZBxH0rBR5DEEpXeSG9UNQiMFP5wsWlhecOxvnS0mCsvrdmzah4OwJFwEOFf8K57Sfm
	zcTEa3E1DvkDMmoJcF18axLyCOh3qkM5qE6Gk4jQzDlFH8sF3xC8xW6MqFB4qLQ6/cAdbMpHbm/
	0kkuoL6nQiP3NpqoPc0BXvDiSTKvQkeeSbUhKL5IRtGUcgGH1wP5Q=
X-Received: by 2002:a05:6820:a006:b0:71a:7b15:6159 with SMTP id 006d021491bc7-71b1858a8acmr220915eaf.52.1794944343789;
        Tue, 17 Nov 2026 11:39:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:17 -0700
Subject: [PATCH 10/11] nvmem: u-boot-env: propagate cell registration
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-10-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_113905_003200_09DE3BD4 
X-CRM114-Status: GOOD (  10.56  )
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

The environment parser ignores cell registration failures, so allocation
failures can leave a partially populated layout reported as successfully
registered. The OF node reference obtained for a rejected cell is also
leaked.

Return the registration error and release the node reference that was
not transferred to a cell.

Fixes: 7c8979b42b1a ("nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/layouts/u-boot-env.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index f1fb206846ff..83c687e43e5a 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -55,6 +55,7 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 {
 	char *data = buf + data_offset;
 	char *var, *value, *eq;
+	int ret;
 
 	for (var = data;
 	     var < data + data_len && *var;
@@ -79,10 +80,12 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 			info.read_post_process = u_boot_env_read_post_process_ethaddr;
 		}
 
-		if (layout)
-			nvmem_layout_add_cell(layout, &info);
-		else
-			nvmem_add_one_cell(nvmem, &info);
+		ret = layout ? nvmem_layout_add_cell(layout, &info) :
+			       nvmem_add_one_cell(nvmem, &info);
+		if (ret) {
+			of_node_put(info.np);
+			return ret;
+		}
 	}
 
 	return 0;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
