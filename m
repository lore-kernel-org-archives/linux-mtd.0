Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D306E98E0F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLZb8CyzfT/HB4g//d6FkgIRFDUTYNzKWzpJGf2P+XA=; b=rFvuM2t1NiBRMM
	HBgLU5iYXq1Xv7Ip0voKHZdKXkA3Jzyy/uLybCh+Hufdv0g072PosTjB7KrWbANmofh8eELAIB26H
	bKwPvclV8DqvnmNzTmTeGL2x1cDR9FDoPXggmgFffrA6BdqFC18ZWeVmhGgzXPtYSQmTwYBnW/RJ0
	3xJ2tA+mvxdYBJi98tKkWGQg5aM/53Y69vfW2vz2Ga7EPjkOLeIWYirfSMq+Jq58DGvj41lgG41Sv
	tltM7bLrjXCCszMmkiX0R029qrWITvRidO+LgpfBEGocrlhWPv/b1igG/vK1DVXXbDfRCodmMUXs7
	VfnSXcdiJhqP9SL0RuMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS4i-0000000HWLb-1ZwM;
	Mon, 23 Feb 2026 09:17:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS4g-0000000HWKt-0VKu
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 09:17:55 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8249aca0affso2086091b3a.3
        for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2026 01:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771838273; x=1772443073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsAzAZV+vDh9kg6mWOSA63o6/YiuK/GmIL99VmqCAg8=;
        b=nKi7Zbv740VHiWiuH//03esWtNlg2BPkQzrFm9CfLQ9mNI4Vc18y6996RXFvnebwQ3
         Bg/36/4lBD9meCjLu9JlsDNIW5CKsJGdFOI+FA1RQu2ZxA9a+HfFUDZYaZC6IUGD3nNk
         tR45zgHXkBTh1k6ReePW0YF/ozRvrsh08PRLQy2cKoHjYgXNiGRC/jVu/z8iFsj6ZGJu
         yt73n8QTotuq78IgG9OcG+kG0oWQtz3oIFFMxbupdHDncwxtZkufA6RRKBNg3sWpTLgN
         GwmBrFLew1u0PfpGuL/kODPaOLorpGvBp4ZR9UKoMf2A24vJnWELQJWgQZbiX+0+hEF0
         eZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771838273; x=1772443073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vsAzAZV+vDh9kg6mWOSA63o6/YiuK/GmIL99VmqCAg8=;
        b=XJhTqxq5VYT3CIgW+zgjw88RAl5BSgDjoy7liLlxez2DsM7KBlSx21yQ056jvyzT6z
         Trf5gMFI50etDEmZjS28VHpt78xsQ5UTk9yE/dwr6ARlnXnccEU0jAPWZGCOXhsbmZAt
         OPKemS5PCf7rJElCaKbQJMUGSPtZqvamY5+T09ger2T99DBUCcelgGQMnEZqMlthNDw/
         Lj74YFIKupebau3DDwyDFVsO5Y1kxCzKnmqTe+3EhGiN5+XjAFaE6DpqQ1KU4xysH4wF
         LBVTLJ0EpG7k7Tw61/pCEPLEHfwzgU5FoQH9Gc/9si0yfuFqoWmQjc1RgeS9mGSrzkQl
         f3bA==
X-Forwarded-Encrypted: i=1; AJvYcCUSDch8RPuONEGWb71GdCjTEmZ1zZErBN5U3HNEJDKjHIueD51f+kro4PWCUIHzyb7osS1DF5WYq0Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl5reik/HRFTEQnYRnau4debf3791CTc9+fqxBRQoRatL3uOsK
	KZkgo1fG0+C1KfVUsuXTx8lWbadRF+jJ2pJWxtq7TTt9B4stde6nQGyJ
X-Gm-Gg: AZuq6aJelq1wc57WK479UcXg3RdWRnEKongWlgBFuM032WFg9xBuQvEKnhYTzqK0JMX
	tXoTXpAkTkDSNnLL7F0QZRqAsmrfNlkaVVF7XH24hHnr71/2kd9W337G1DQOxh3pNVQ2Ybdbipu
	SUH78OcZugNA+Y2WFXMnNwc6ClZ2Hnr+5b3HVvmZRfCe01p5pfQuIhibrwt8ZVtr4QrcGlTDrV1
	DhLyHmWUiaE2h94BVxE2A7KKWdd6dCd4bniQNhVXAQCewQxw1sTDeJPNb/jEIs7E84o8fs9fOj0
	4xQ6dSDxp7/PeM7+Zyyu8p48qGV6ice1I/9PrpU7pGnHgqPH26J3qiflPeuQElB1v5CMLaFaC3P
	fQ1wQn9O0T+SbN8h1M0LQheNqrLVVq5LV08e0A8G7AGJexvnbGroeSAbMrUqjKBJkh/o5C0Cs2h
	dnTxzdCvqpIoqZwf6qIgj+GWm51Czk3FJWHX00B8ie
X-Received: by 2002:a05:6a00:2389:b0:81f:3f03:6832 with SMTP id d2e1a72fcca58-826daa62853mr6926447b3a.44.1771838272905;
        Mon, 23 Feb 2026 01:17:52 -0800 (PST)
Received: from e50dbb8e4021 ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd689474sm6353180b3a.15.2026.02.23.01.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:17:52 -0800 (PST)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: mwalle@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	sanjaikumar.vs@dicortech.com,
	sanjaikumarvs@gmail.com,
	stable@vger.kernel.org,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: sst: Fix write enable before AAI sequence 
Date: Mon, 23 Feb 2026 09:17:33 +0000
Message-ID: <20260223091733.47-1-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <DGM6ZPOT1WCR.157JI0LW4W3E8@kernel.org>
References: <DGM6ZPOT1WCR.157JI0LW4W3E8@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_011754_165406_BD105353 
X-CRM114-Status: GOOD (  10.72  )
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

Thank you for the review.

> Raises concern about writes ending at odd offsets potentially having the same issue

The odd end address case (trailing byte) is already handled in the existing code at lines 243-255:

/* Write out trailing byte if it exists. */
if (actual != len) {
    ret = spi_nor_write_enable(nor);
    ...
    ret = sst_nor_write_data(nor, to, 1, buf + actual);
}

So write_enable is already called before writing the trailing byte. My patch only addresses the odd start case where BP clears WEL before the AAI sequence begins.

> Suggests simplifying the conditional logic by removing the length check

The condition `if (actual < len - 1)` avoids an unnecessary write_enable when len == 1 (single byte write at odd address, no AAI follows). But if you prefer unconditional write_enable for simplicity, I can change it in v3.

> Notes the patch lacks runtime testing

I don't have the hardware setup to test odd-address writes at the moment. The fix is based on code analysis. I have tested patch 2/2 (dirmap fallback) on hardware.

Please let me know if you'd like me to send a v3 with the simplified unconditional write_enable.

Thanks,
Sanjaikumar

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
