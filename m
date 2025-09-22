Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5979CAC5A8
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96XB2wdqFiuTIjHuvvQA6l3kzhT0DojZJoNF6zTaZF4=; b=NAVQn3G2C0C4fS
	Jg4ppa4Qxh/Iv1ac3sQRqFRhN7tOofg7ucP/fC9MmJXFxjA34wkBAFl3gzOG5lO87QZHSI1A6RBdu
	WB4i89F0sgzpON6u1rKbEdgm/P2CQ1956fCP+bW24oyphKnvLhSb27ry9p/EkuilidnMOInmEG/H5
	72U4u9mwQICKsAK48y0HALU33kPGL+8/6S6Ll5T+9hCIsuAe3DRT9lB2Pv0XtOFefZ9OLJLnKwPul
	PjMFmjzxMNz2JBlyXtE4Q0yijtHccVl8ftLq8YCqmJIeDUJQ4ZTZUn8VH0dlWTqJ3sBopecBJoQO5
	NVnz5b0e0xbhLSDR9Fig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gdQ-0000000AVxh-1zEw;
	Mon, 22 Sep 2025 13:31:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gdN-0000000AVx7-28pQ
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 13:31:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-26e68904f0eso22742145ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2025 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758547872; x=1759152672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOZ+3sPJjHhme5/KGeK2VfF1vjlB7AEmx0hb+K9u3c4=;
        b=nrRoguTG+wQX8CjtZ5dZWw2JEUj4IjBaYbrUQli8UYSdLdiuENzRx+iOWdfNYHzu6q
         pW5PBwZ/RnKo0bCzdj0UGRvp34INGDB/H5749pXYq1URK80SaI/gHjCWEto9IAbmtXVY
         Za5xizv89XzmcAPGsozCtp63TiyhIDCTiSU5h8kBteYUR3drO4nUimixO1wpmHKztIQo
         YbMU+kN8f3TtHwSMGXYtpCadZov4S1CjczdVKWja9UInD4KwexZowc1VzFqigVJ8n5T0
         g6mqD9qvFUx28fbR49Hh6IVgL9NW3gQ8dHIgXQLPX5jdU3wSKNIa3m0MQhDjhHeEW669
         DFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758547872; x=1759152672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOZ+3sPJjHhme5/KGeK2VfF1vjlB7AEmx0hb+K9u3c4=;
        b=ULgQROawIgZQ1Bnsr0lMIRnEDKtXeviJ2kV0H5PNV2GcOv+nbiXG+8o8OeDjWUkE0B
         8RfLtr6RHzhcIL5uIfE4Gzm/pvJ35ZGnTcUfww2v5dHoxdCCeATOk9fGT+D9Qc5pOmkk
         XW+duTWx7NFXqTHuLC9v+yxqtz6IyZK3qUODmKaSwOwyWvWNtkGe3banWOTrLyEZ3Sh5
         bDWkhXiPw15Z4tqCP6RlU/voT7Qz79V0Gbb+W5QGOms2GIE7MqhdoK5gx2gI42LirzZ3
         hsUFpmc1v0nFFvDxti2YmBZhSko2jDHKSbwmtUUayQSg7Q0ArfwZpiSWIFcLnbRdnwAq
         Zg5A==
X-Forwarded-Encrypted: i=1; AJvYcCVW1xjJetLACD3xPhR+u0mVQVRUeBkh5kJH/4pHRptHrDQuJIWgZPki/iucbR6IkX9mjdRblT4N5Lw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsMWLEn1qW/2onHRhilIeM6IisjAq35Hyj9Yn1vtNRh4+KVK7Y
	xEOEt8KQUFY2OnIQFBYABkJgLlZXSdBwTRNCxgRJq6F/oJapYOGpBjxd
X-Gm-Gg: ASbGncui++hXmbGr8Z+3sdOv9J9n59SKkU6nra6/ZH+8u6w5/HzkE99x+8U6BgOrT/a
	9IPiPu2qhPOU6qs/4xwb9jbmd6ldkgZypYzYFqt1DnGpWrX0clBIrpW1S2O+B++mLgUWVaWnkaH
	xOzgKlO5JTsTYiKOSFSAz/vJbu2mypfS8lZEnx5FX3porjIqUgkwZujDSGKJ9VTxMKUiWfVYMoK
	fLhNVzW9TaGirVR0WvLfIjgF078F3RUvSg1ZRG+UxlfBcBGfhwa7/zuz8MoYPCtrCX7h1DfmJAD
	piotlyGUDvig3TaCFUSxMaTRu9jzi1tUCQusjMeo1b1erpUPacAiS9jbjSMscAsxHQyKZpSHUXS
	PYbzr76hVSCGnnDRIH0JLEZhvPjO8DHoUR1/IAilmrw==
X-Google-Smtp-Source: AGHT+IFlTjUjT9pWpL0XES6XJeOQp9klXOqCDduhPdWixXuTgA5G1oF5J1nVDUpvKjADmsMp/r83wg==
X-Received: by 2002:a17:903:11d2:b0:268:cc5:5e4e with SMTP id d9443c01a7336-269ba3f5f96mr161584175ad.1.1758547872057;
        Mon, 22 Sep 2025 06:31:12 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c959sm134572465ad.48.2025.09.22.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:31:11 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: vigneshr@ti.com
Cc: david.hunter.linux@gmail.com,
	krishnagopi487@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] mtd: cfi: use struct_size() helper for cfiq allocation
Date: Mon, 22 Sep 2025 19:01:06 +0530
Message-ID: <20250922133106.2524-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e79d5220-2824-4cd2-8e61-b1da8d22d2a1@ti.com>
References: <e79d5220-2824-4cd2-8e61-b1da8d22d2a1@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_063113_554840_3523C38D 
X-CRM114-Status: UNSURE (   6.80  )
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

Hi Vignesh, Thanks for the review.

Regarding the other occurrence you pointed out in jedec_probe.c, after your
reply, someone (Rahul Kumar) submitted a patch addressing that occurence
in jedec_probe.c. 

link: https://lore.kernel.org/linux-kernel-mentees/20250922071137.900508-1-rk0006818@gmail.com/T/#u

Please let me know if any further changes are needed on my side.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
