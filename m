Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DA0E7718D
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2024 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJEOA/Yh/gFltnyGD3COOb5SBIwIKyOM967sGL29Kuc=; b=dFZz0c/09xENuL
	nOm7I59rUNrf/Ok4fTopUst6xHFV5wKYd7wA/yXz3qrS5e3DoXKKv8A5mM/mfWZdQ71idvOwGPGBy
	XfG61PmmUEnEj+ofHTw4vnDXeAHyykq9BwT84YX/O21mAeLqXQ6HLW8VwcA1SE2ZiECZM3H99Wvhn
	jR1lBmDjJmu+U96Naimi53Ir68eCwugWPttmqq+a8zjRfzaJoe+TJ5EJbU2GlCsjq87JN0TTbsnVc
	bKc17NSGhTI/xuONuAqd3SMoWIfthZhxaZCRUEck6mMv0mwsZ5d2HRTT5WzMQIBkFP8f6GUkn4E8h
	cXVY5hDIvV4WOw5xdg4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhCS-00000005hyd-2VQj;
	Fri, 20 Dec 2024 17:54:08 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgmq-00000005dfS-0TNU
	for linux-mtd@lists.infradead.org;
	Fri, 20 Dec 2024 17:27:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so1519565f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Dec 2024 09:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734715658; x=1735320458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
        b=YaRuT7os9DhiF+kHJ4rEsgIpuNRe8MGzXB7t2AM3Xjv/omXh6nwbdbvRMW1no4mz8f
         DSLFlEHL0DTgOnS4K43JB1uivBHNuUqP8QyXsRtPBZZdW+GrC31KrfyA/y9+LQi7mtoM
         nbOlbvIu2crQFseOFjZJioSH4RnOx1wFbyUR5lKoyrVHST660PbKHZgycQAaJ5bWazqm
         +UEa7q0zqG8LTrBAqn3noNrVlF2hGPTAjGrW3bGQ3MXTR+HnApxJyplAleN7595/YwXE
         uCoeiHe/SPAeFZ2QYYy0STFZDW650hr6B+XHYVkT4KrzkA5FijIaJLW0wnEKuoRXyvFP
         WDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715658; x=1735320458;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl2GUGW1SKIB73yuGvAyVPoBfBy5XbBiVj4hV5yN+VI=;
        b=tH/strR20hYeIkS4KjMNOPhTC2aPNAkqDLj70Mu67a5/14Ln+Y+p/TTe4pPOlTlxM+
         G/xyIM3x+NJ78v2UfCdtiMfIvsxLQ1TPUCoZ0c7zl30x7QSAPaLxgLa1Zj5MNLm9Ty3s
         qTGyg/+Uc6CE6sv+kwo+VYsyU2FnGlQWe8/sSdPOnk5ho3QClA30pLTQutFXCt9WfDbs
         cHQer/qq8dTXQHNir6jT/Rw9fOlhNeSGIMD3wttbOOTc0btRbfKfajWHfW32cG+NMd32
         jsmzN3YlLrD0m3nsvhc3yAsAK8xmb+DIo2i/ZEisOAArmHjujxCX9U6FFQ03LUwuE6WB
         rJiw==
X-Forwarded-Encrypted: i=1; AJvYcCUZq9DyVB2QPkcf3LOyhh9gvvyCT7wx9TMigMEb++UN7ij47OxR4USfIIMxgbXcccRbOleEWpa0KBs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRAgPE5FR148PLmoUGEFdjR+OvKDZR1rZomyUgC+ogIymU4A3m
	xvd5aCLa9V0DtL9B/Rimj+5QykxEGMfxJKOfutQc6+sXww7aTP92SBabXotTDdQ=
X-Gm-Gg: ASbGncsj6ebsaUNq8tYoUppchpnqFk/CitosZp+7NH6eQ77TsHinRyfQ+noVE/hcLmf
	UCvI/1EJVq1WDgj8K+V2OVvPlnzqPyo1ng4HLQ88/hQXvxZdlQ/TqLycKwmDnlFPcat9pBaXoNr
	8oMAh1VS6Kf2e3tj1n76XLJasZa3NlU5BVQlCWja1qSPoe+JZbJvBNVlFjj6UDxyqYH0qG7/ldv
	btXOlxdhhiKxHJDmEDsENR9+ZmKcMyxJb+e/4nbpUaBMIr+lGulU6bR7f0oUdrDULDN7E8Nn2M=
X-Google-Smtp-Source: AGHT+IHQofl14bIpVpiQqz6qAEwAjKsEmWVjRCOjis6wH9jKfvKMjWLHCbYlsDgmYPDOjR7ci+Y7xw==
X-Received: by 2002:a5d:47c3:0:b0:388:cacf:24b0 with SMTP id ffacd0b85a97d-38a1a1f7253mr6745803f8f.2.1734715658179;
        Fri, 20 Dec 2024 09:27:38 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e357sm4642915f8f.72.2024.12.20.09.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:27:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, audit@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-usb@vger.kernel.org, linux-mm@kvack.org, 
 maple-tree@lists.infradead.org, alsa-devel@alsa-project.org, 
 Sanyog Kale <sanyog.r.kale@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, dccp@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, 
 drbd-dev@lists.linbit.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-leds@vger.kernel.org, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org, tipc-discussion@lists.sourceforge.net, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 linux-trace-kernel@vger.kernel.org, Neil Brown <neilb@suse.de>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/35] Reorganize kerneldoc parameter names
Message-Id: <173471565665.227782.7244101246430956449.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:27:36 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_092740_206854_477890BE 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On Mon, 30 Sep 2024 13:20:46 +0200, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> The misordered cases were identified using the following
> Coccinelle semantic patch:
> 
> // <smpl>
> @initialize:ocaml@
> @@
> 
> [...]

Applied, thanks!

[31/35] slimbus: messaging: Reorganize kerneldoc parameter names
        commit: 52d3d7f7a77ee9afc6a846b415790e13e1434847

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
