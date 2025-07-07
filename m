Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E119C8303C
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jul 2025 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnFIu2lwYQGgWikzn0J6Ko1WKmWM78TXhROztVn3eNA=; b=DN0ksObxfmUVbO
	hwpsww1Ta/eOEeGNcg7UUVQZht7lc8lOG4TLhmbpwFxQxXmstPj7DTSkpTy/Z+NvtNNAKix+qSPX1
	7ul7XNrPC4MKrIAKwokxXAl5J25rWzf+iFwCZpSYH/xm7UivrzhDDfXshqBSJG63W2T+6/+C4qZpG
	R/V+hIzLH8y/MPNr2aoJXQ/BYXNLH4sPL7nelUypqEixXGENURgBivEBBZ+yeIx/nBUodYOgu+fxW
	/Mr4C5pMuTGJg0S5yyTKW/OI8UkW5v1xzY9jXFecbRH+McfT1a7rU8PsqHPzVi5PFveXnJCd22oa5
	kIvQk7atMn/RJsPTAE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpKk-0000000382N-2RmD;
	Mon, 07 Jul 2025 17:08:50 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYofS-0000000315o-43HR
	for linux-mtd@lists.infradead.org;
	Mon, 07 Jul 2025 16:26:12 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-74b27c1481bso2010859b3a.2
        for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2025 09:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751905570; x=1752510370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMZpQ9eOFoE8pNgsOQRqqnHFwIZBV4HaD7a8eqAcnGw=;
        b=B7wzXj7DmDsQ96tZiFXZtEz9KJ2lrLV1rVZYtASp3sSlaNggTvMabab60mPKOFfRV1
         zkblGfoyl/pNZPGwXsTynPaWxeR2ilRz54PCsW0+fi3xuz5oHiQWaRaUk3wJaQac1tou
         Bp4CSleIJvzN4gTioecKgWFd7hFq386uOAAX2DSfr60X8dNC3yKErkZLz6j/N/AastaT
         3Xp3tOWGuAl+AtMJT4ITVSTlxiOiqCXzkGvTOO+PJnFJsQeOy2r6UUvaLl6f7scKVtc1
         ogJupJ80Rqhp1bj7A05RwsiJj1UHkk/zJEVGTJQCUmZDwkHzuYdDc3l8oF7sZPUgCTng
         Cepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751905570; x=1752510370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMZpQ9eOFoE8pNgsOQRqqnHFwIZBV4HaD7a8eqAcnGw=;
        b=bgHphVIYH+cWB1ewMdUPTnxmYOWweMQYry+jM3xAy7J4ShcLqgPN6TmNbbdjvNL94n
         XgYm+FPQIEw3pZnNbfQxLacNdjpFmfc0sqA+xWay17YWoA06JymNEuoqnC4oX3V7BgOd
         QlUPbelzDSU5MKjssuvcrX7sPh0n1dmSsWgWueqyJfTZviN0kdjpXxffmT7RoOxpseYb
         IgGN+iVTIXEMbmFT1RXNr+w31y7MEpRBrzeG8g7NPFI9KEj6F3ClF3HKJ6hOPRXTrws1
         NtSZ2taGIg9R+ZtvJFOeoXVABTcrYmnP5cRyUnTPZ6bGfYSLpZW9whXRCe74xbHZ6I7e
         lNUA==
X-Gm-Message-State: AOJu0YxmCrz2qjKZj5RzhP8nO0vYED5yKTJIcp8ZbpgTz55u/T36eCrS
	c+a4UpHZFVL1jtTzR6Z+HRhuNsjKCN6TTDTz+PGlEqIC1uh+GTlFjBqS
X-Gm-Gg: ASbGncu0u+mehANmvRvYxxHtu2NmCHRIX2wL6fAISbF5GVWOkOgiBUcMoSunIIiaXwu
	LcAI7j5V4Qr9t0mEbNmFiUQy0DrEVft9q3/+ipN28V3wPWqC1BaYLNuQPV+TJaDwhSKqTLOgrAl
	3VNBG4Gpog8didEwo/Fhz2wY9TxuMAQH5HaoONo4SgmjarwfsIGU8sUsmO6tz9mqIMj5NXEWFVu
	gQwz16YaNjBPKpz4oZAOca9Q3Wbu0oXnBUaGXuuTrUX6cucvClePK1MjULGDc6m6e2I+jGlWJR4
	iFDN/IcZXO0fj83KLyD8Ocw2aWS15t51uAtPWKJeH+mNixFTN5DpVf96CEdmWRtSDasVCTd1tWz
	Al73xDvM=
X-Google-Smtp-Source: AGHT+IHKrUm8QGhoJthX87geTEB36CdBFPOZKGlYVYs1Kcd+yMU0uZVtQYXHVFMTyos5kxuT0ePzdg==
X-Received: by 2002:a05:6a00:21cb:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-74cf6f2f348mr12547028b3a.6.1751905569978;
        Mon, 07 Jul 2025 09:26:09 -0700 (PDT)
Received: from sun-virtual-machine.localdomain ([104.168.88.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417ddb3sm9722842b3a.87.2025.07.07.09.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:26:09 -0700 (PDT)
From: Ssunk <ssunkkan@gmail.com>
To: mwalle@kernel.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] Add support for XM25LU64C
Date: Tue,  8 Jul 2025 00:25:47 +0800
Message-Id: <20250707162547.3518-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DB5U9G0LN7VG.S20GFFWQI81K@kernel.org>
References: <DB5U9G0LN7VG.S20GFFWQI81K@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_092611_002711_20FA097B 
X-CRM114-Status: GOOD (  10.00  )
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

Hi Michael,

Thanks for your review and my apologies for missing your earlier questions.  
Here is v4 of the patch, which addresses all open issues:

---

> *What is "Google AVL"?*

For clarity, "Google AVL" refers to the **Approved Vendor List** used by ChromiumOS to validate flash parts.  

---

> *The datasheet link gives a 404 here.*

The new and working datasheet link is:  
https://www.xmcwh.com/uploads/954/XM25LU64C_V1.5.pdf

---
> *does the flash support SFDP?*

Yes, I have verified that the chip does support SFDP.

Thanks again for your guidance.

Best regards,
Sun


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
