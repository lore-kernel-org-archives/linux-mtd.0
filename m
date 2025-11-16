Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3776BCD4F3E
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Nov 2025 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+cVHHssXAg1ro3q46xFJMs1j+Pi9kyI3TpNr9QUl4BE=; b=0pBfgnOks5cL+E
	nzU275NIXiCX44TbdxI/YFQ/acBduHUwQEiHyzwsx+uJxjrXVmrJ1l/poM3EHVRtyiguYfI0tLWVJ
	YIuvsP9POm9zFNC4dff/WsiSQtKdPaigPWS6FTf1f8N3Pzq8WoVR/hf+7D/eBRgPonqBjXR2xRGQs
	sGs+jasvV6/SZ9YlWDerdlvgQqOOqiB6o4At3npE5LBXEeGBp7urOtKawrq8/JmENgr9y2NKwhNZr
	oV5SlvzZqGydSP748HXcc5zKvwXShYj+iBFpfBeqanH+3a0rBC0l+CTENNiSUHCB3VEPQK+dWu6ok
	aIOP1lQxvnRNj7h1T6qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdBV-0000000EiUa-1u90;
	Sun, 16 Nov 2025 13:52:53 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdBR-0000000EiU2-1q4M
	for linux-mtd@lists.infradead.org;
	Sun, 16 Nov 2025 13:52:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-297d4a56f97so36741445ad.1
        for <linux-mtd@lists.infradead.org>; Sun, 16 Nov 2025 05:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763301169; x=1763905969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGznwiXto53wUSL9K3WoozgllAs4fYYvMV0IcFo9qMc=;
        b=jKB1CvmBJVHvdJnqJEJc/5r6tR1we+AaCAJDnq7cVu4FdcMEalUE2OUJ+AZEMw2mXa
         qt1V0qKXvm7DUvLMWlXSb89qXg6ZpiE6+LkPIosF/10MXE4ZU+WmmhBJItkNjCwJycVW
         +mV9OJlbEQxTRvO3Th0VQfyscOgV2n/uiewej5vZsSNtUfyXZ8Ef/bJd5NwtN3j4xrgk
         E0skh+YcVlRMkXnxeAF91/4t7w5Aaj8xt4sZqIMFKDnQIRZswaF0NLZ0RqRXzpZ/symL
         9Cp3fP8L8YONYq/Mwy0MFksytJnqJQHYT3Qs23DsPG0EaqqGtIaKY2V4yZCcrFEJ1EsF
         swNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763301169; x=1763905969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mGznwiXto53wUSL9K3WoozgllAs4fYYvMV0IcFo9qMc=;
        b=f46HK48482az+YewZ5xbnLTnZ4INaCaleeqot0J3M11t4rpagcGg44+rhqo3mhC1jf
         mYkuM/yQSejWdfrn6hFnpiMxs1Xr6eI19V963sJ3sVmxFw7m1DGFZYBfb5PEA2JkrGRJ
         04iPgk7ZXCWRE6Z064hRFAKHn9nF97A6M7HIz2eiTEqGvziNXhyjZRf+hCZQ3RLBoxMd
         96nu7A5c6F5SOvfRol0IX+2M+mq2vacFLAaOTe0Qw8FMaL8BCXUjGTUfD2hsfouaMhPb
         9WQ5nZcNO73Nxz1UFksGf+uCN00RGbFM958GCXEur2tyNXqjxmN2sizLRzy3XBmEfLv+
         FT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX56vXpHyLsmuivirNiaGWjfR5rXI22wL5jtqibLv1e4ZpO6MEf4w+iMwFi2c9vAwUJeJ0aFSxitQs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAqmTq9ktcQsuF9WP7YhMC8qir5kr0YGVzQh06NU1byqtJZ4WB
	2tuliUn4Xs2U2nST+Tzn7ARCg6/sqnMNuTXQG199RIuMKT7Gc6MJWytN
X-Gm-Gg: ASbGncsv81N2GuC64EbIUHgmSrbcSYuZ4bXvqVkfwyMSIVag8EUTJUC4sS/Gff1DBeQ
	WsvtAyX8R9NCdDoYUWglkQW8yRBnoDAayy9tKFuWBzYBk8IZWEP5UK7/lUiFcsYL8UG1niHEbx+
	TjiEnZk4ELhdf5V+7NQoSqMTIeUW4g838sCdQOMqGS2oiL8cdFaDejZwN9RV8wgQqPEwrbBYPZI
	EgsGPSAMPCWxy7QRWf+ZWXBfy24SSlKr6MgonM4FAP40otTMC+WA/O8VX41JKP+pD3sEADKBkCK
	wBAmy4yExlI+bNpJo3dyyS/zWcw9m5UL8QPSXOgA4Brz3nGqAINompQgNQMB75hIrpbmtI8IUZ6
	jdZoVRqQEhRQFX+xZSxW2Gul3V69KuD1JXgFJT27+M2bi+U+vUUZ/gaRLNOPksqectV6A6xMGhI
	VxNplFGMl72HtewiaeYnSMJ43Nil1uD2JGsWVFlWTG5tJE/aPX0nG+WKBVU442rlg2691AC/p3E
	iwBX3hssRI/N9sQIZRxNPLMLA==
X-Google-Smtp-Source: AGHT+IEwPKkAp9hQXoh80zvBevxtrCNr0J0sKz+4Ri9LRg43IJRW+3sSv7/mmP8fdgQqOx+K4hfjnQ==
X-Received: by 2002:a17:902:f70c:b0:298:3e3a:ae6 with SMTP id d9443c01a7336-2986a7420f6mr109348405ad.48.1763301168634;
        Sun, 16 Nov 2025 05:52:48 -0800 (PST)
Received: from x570.spacecubics.com (221x245x252x90.ap221.ftth.ucom.ne.jp. [221.245.252.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d91sm111436505ad.63.2025.11.16.05.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 05:52:48 -0800 (PST)
From: Yasushi SHOJI <yasushi.shoji@gmail.com>
X-Google-Original-From: Yasushi SHOJI <yashi@spacecubics.com>
To: tkuw584924@gmail.com
Cc: Takahiro.Kuwano@infineon.com,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	marek.vasut+renesas@mailbox.org,
	miquel.raynal@bootlin.com,
	mwalle@kernel.org,
	pratyush@kernel.org,
	richard@nod.at,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com,
	yashi@spacecubics.com
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: spansion: Add SMPT fixup for S25FS-S
Date: Sun, 16 Nov 2025 22:52:35 +0900
Message-ID: <20251116135235.1479860-1-yashi@spacecubics.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
References: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_055249_489968_8F1E6CEF 
X-CRM114-Status: UNSURE (   5.93  )
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

Hello,

I've seen the problem this patchset is aming at. I've tried this
patchset on both the latest and the 6.12 LTS, and I can confirm that
it fixes both.

For 6.12 LTS, you need to use spi_nor_get_params(), though.

Thus, if possible please forward it linux-stable. Let me know I can be
of any help.

Best,
--
    yashi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
