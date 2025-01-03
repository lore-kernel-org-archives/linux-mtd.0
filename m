Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00328E77188
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jan 2025 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZlVmrRqQL6+xPleZrvyCRQ0w8Muhf+/VMNxGXtY5oQ=; b=CfF5KUsB94H03n
	NKLc7vrLPa2UccprReICI3sKtq5Ae89vRnRViEi1ZeqnECpOR7bYjXFMRO+3LhUH+Ud7ds+j/UC5Y
	UkA3pCfSKRli6vKRglUBr2ng/B64RvagGfEcnJ/k+TOHCwuIoiUjJ4ZEZqkMRb3Y4XNo9xiVjqhKt
	ICe1X5drbmdbDC71MKn3j7rFPakofR99LKxkBGzgKTdbNQRdAKK4VieTQ7zIj/MG2IZ4PLi53KPFK
	qIrjGwXbRtMKQiA2YB6z9zqJc0JbUEsOvS+EaS49Mzl8pzawK9LsDSe92jA6tENIwv3eOAAAwWpRU
	HpZ3FOx2wRg93BAFW/Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeC3-0000000CehF-0PXt;
	Fri, 03 Jan 2025 09:42:11 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTeBM-0000000Cedg-0EV3
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jan 2025 09:41:29 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so17366350a12.0
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2025 01:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735897286; x=1736502086; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT6/x98Xtbu625guReaHxczcC7qjmFNMQJGS0Y0cutA=;
        b=i11eRqBlZK4/wvS8LlvXVKdYtPzZvqrzkcKpgJ5mXHWWJuUSMwx6AfJa3CTYp4MSTG
         Duf99L35NKiwzTBEsKbXF4btudh/47HCiFHQqpIFuUW77u1kXhX5Ii6kKxk+auevwO0G
         QzMLlKjRv18k7PaKK0HOFbjfjqbZfQrqLWXZ7rnUvtn7ozxDNcStNyI3N4ObzcK4TvK7
         IDerkhRc/sESz42mAZ+Kc42oAMtBqE3poQLn1loMqzzAmBTQKD0H24yph978AFiZHdzW
         VEqUrq4FgayP+2DdAv6U3OU84vvRQmJ6kTrNjrnsU1R45rAE2u234q9e/4CUuJ8SDlDV
         ktzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735897286; x=1736502086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dT6/x98Xtbu625guReaHxczcC7qjmFNMQJGS0Y0cutA=;
        b=TW4cyHKkL3FixI9m5dywELQbxLP46ngurR6g/eQtGeCPvK8zA+6tjKNA8rx7sIppxX
         lziA67IVwEgSUq7QpYNxmNFwvVmj39yMzlA9YFXoDfh2W9Jorl8keg9Kes1SkXJmSKY1
         ZR9sBWR9VmY6nephnBq89TvRD6luq+YRFNZk+XqGAGGAIzRealkza77jcKuuZzkvUbFv
         VsF1W9g/ZJtSnheCKLSOq985/nd/8Usz568Rty2Rg9NxKkoGH2LUHUrZ9cXs7uFc07CL
         URPjeTs3WzWOZnH+mfpC/x9trOz1pzDXaLt6YgEFESTQGhcNl9TDm+YRJuqdybCAayCQ
         eC5A==
X-Forwarded-Encrypted: i=1; AJvYcCVxBHM/aRrBJr53lRMxRevX2QYPS9e6KRIzdW+VTxG0QOdiFUOY2CKiCdwehuS6Vly/4rDhlWGMOLI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyVjBLlXlFDD78Hjc1hjmYZFjqFIcZXtZBSjT+QxUa9RJTDtba
	mbUBMP+d14T82/PSrRqhmNj3DfDrEy9ujcOZyoMvPuc8ZzpDJXdKB/N8aCkFR0mnEn8nKYGOpn2
	rsTlBd7hXgKciCbZVNZW0IzsezXI=
X-Gm-Gg: ASbGncuEIL1+E2N3h9EM8aqOzD+a7n1wyiqSd3t6FpnF4sEWQmkvKI0ki+r2HTd7IPx
	AA3NPaQeApwXb2nmXoaxKdtSZ2SQFjMgkRVwKPq8=
X-Google-Smtp-Source: AGHT+IHGePmIqn0E6yEr1anghkKxluDYlPRGxsLiyInwKsuuK64cRydIZZ2Zb1ZRFnRYAJ4Rd4T1OF44NlB0fzJRiMg=
X-Received: by 2002:a05:6402:4011:b0:5d0:b040:4616 with SMTP id
 4fb4d7f45d1cf-5d81de17fa4mr51237902a12.28.1735897284465; Fri, 03 Jan 2025
 01:41:24 -0800 (PST)
MIME-Version: 1.0
References: <20241209162104.15331-1-quic_pintu@quicinc.com> <17a995ba-5088-7a67-2e84-e0d7633c95f0@huawei.com>
In-Reply-To: <17a995ba-5088-7a67-2e84-e0d7633c95f0@huawei.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Fri, 3 Jan 2025 15:11:12 +0530
Message-ID: <CAOuPNLhMU71YWh8ZnaaJJtTks4J=nV8de5x=xNdqZ6q33pH9Ew@mail.gmail.com>
Subject: Re: [PATCH v2] ubifs: ubifs_dump_leb: remove return from end of void function
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Pintu Kumar <quic_pintu@quicinc.com>, richard@nod.at, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_014128_091105_834BC77C 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBUdWUsIDEwIERlYyAyMDI0IGF0IDA2OjQwLCBaaGloYW8gQ2hlbmcgPGNoZW5nemhp
aGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPgo+IOWcqCAyMDI0LzEyLzEwIDA6MjEsIFBpbnR1IEt1
bWFyIOWGmemBkzoKPiA+IE5vdGljZWQgdGhhdCB0aGVyZSBpcyBhIHVzZWxlc3MgcmV0dXJuIHN0
YXRlbWVudCBhdCB0aGUgZW5kIG9mIHZvaWQKPiA+IGZ1bmN0aW9uIHViaWZzX2R1bXBfbGViKCku
Cj4gPiBKdXN0IHJlbW92ZWQgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGludHUgS3VtYXIg
PHF1aWNfcGludHVAcXVpY2luYy5jb20+Cj4gPgo+Cj4gUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVu
ZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+CgpUaGFuayB5b3Ugc28gbXVjaCBmb3IgeW91ciBy
ZXZpZXcuCkp1c3QgYSByZW1pbmRlciwgSSBkb24ndCBzZWUgdGhlc2UgMiBwYXRjaGVzIGdldHRp
bmcgcGlja2VkLgpBbSBJIG1pc3NpbmcgYW55dGhpbmcgPwoKClRoYW5rcywKUGludHUKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
