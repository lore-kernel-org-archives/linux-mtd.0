Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B155C02198
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 11:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYLGJtYHRxq+6QTYvHyTXh2N2terg/QQUy3zVq1svUs=; b=NPuJ/URy2RXafh
	K9Ed5n62mpUUMWJt8ujlI3SahZMHaDyirFQ2Ht+TevQctjhyPG+o168m9zj5wbY16L3wfvCDaOIBa
	9i0RxMcjH2R84ish2lUDco/+Qvv0gVoD0pT8nJqYV/GrmJI62jN5+FzyxCLT68KVVvdaSJImT9tAA
	8EOh+PDImtiTD+50Mpwb+ZVFBlLFhRKj/CfnR0AiE9plR7I3ocZ+qU7ne3wlw92wcbc1KEywKsfrE
	Yy/QZca/caGb7gQW8qOEExz0Ystf02CEVS8w4CIAb/BMYf6Lcq5lhOuG/tI8K18TbeEn95pajpGu7
	NrwSL9H0yYZk4jqUxrbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLMc-00000007rcw-2F0s;
	Tue, 18 Feb 2025 11:02:06 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLMa-00000007rbO-1cdJ
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 11:02:05 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-545316f80beso2639070e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739876522; x=1740481322; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3c5mu6heXh+SexZYS5zkCb1lhHMAsj3OS7ZqFAAxSA=;
        b=MpOmxjIVjr9zTYUwLCDc0SIVmBEhJzqRG610HB7ijOBsnWXE87E5x6oSzXGrMKnBd5
         1gtvCdQbV4izdtvoQd8fFMBjbNbj2prxcSJaW/fD8eW8X0Dv0A0xnyfj2b6j7Wac9g2z
         6+r5fG5+NOjO8eVBGHOaa4E9a7Prlo8Vk3SbRfDRuKa7tDC4L2T1BZShxdp0hi1egpZ0
         G7KeOltpyjE2Ldtci2czBBboT0qaMw1pJcrw29TOQ0eF3FfVB8FiwVCzNZcTkjxsaQBC
         tpX4qADU6K4Rr61Kp++3v50iHCjn08aVaiigTdGG+2fRL+zjqsKvRXJsAmFhjwP2MqNv
         UB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739876522; x=1740481322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3c5mu6heXh+SexZYS5zkCb1lhHMAsj3OS7ZqFAAxSA=;
        b=mE1GkedD3jGGAmj0Bt7VTtO4/YK3EmG3ZzPE6MgKa8ef2t8QQKQt1VkSmk4P4m0oR8
         IgDK7/wwROax5+CQ9Mn/nVtowa304DD97AUKYsiBXlUecb2rr4KgyHGTASmF4j8qw4HJ
         1JLbhdObCZ0sXd9C3qccxZ/Vyxzx5s98Yk0sSRm1YcqoWN+N9O8yb12IEXZ6FMi0vMuV
         sDSS2VBUyJaXLmSWO1YjMTWd0wqI2TujLm+CPewG59e9yrO4xKtgntw7epQ02UnN7k01
         MJaMCGEa1lMOLZoOaiGULCtIm5tf2E/nSlD+tLsrS/dCOE6GHM0WtfISn8y5DTb3+FGy
         WBdg==
X-Forwarded-Encrypted: i=1; AJvYcCUHZ1PfRnebHbTITxKhI4CMtJIGWhRmT9+Lht7URwZr/JG2qBtCgKrXfwi0owe8vH2sHxGPaqeyvPU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkoIwses7vLLga42da2A3GzDAnghHDPjRBWoMfVuAV0odjSK5u
	YYnbk6PWXk2qqwq7nuIWygtBB/TSJR5vji6DWmbD73jMcZYCHhpuEfehxUiyhqACEPs9em/DE+j
	8wkMpdMTkMkGvK4PoGaVIhPUCJbpLfTeY
X-Gm-Gg: ASbGncu5PXbjig7efw72nFzrhxaiILMj5m9XxKeQAEWeyQAK58Xt58HoM7NRC4iMzTQ
	Gck8mkS8dZIprOaOknRJZTk6atCAcqOLX4iSip6OP7rCMgZelBfv5WdBSfvAVzDFt4lRLx3/+VU
	1epnnJJ/NddEKGkbLHP3TanMSsTf0n
X-Google-Smtp-Source: AGHT+IHpVT7Z4o4Z1UWD01k3hDYDWEj3itoENBUuR9LfUL+pJQcV1yG5l2oJ4uZHZ54AjqUFU7wMlv90cyqRVAf02xc=
X-Received: by 2002:a05:6512:3ba9:b0:545:2271:3108 with SMTP id
 2adb3069b0e04-5452fe6b190mr3757127e87.38.1739876522205; Tue, 18 Feb 2025
 03:02:02 -0800 (PST)
MIME-Version: 1.0
References: <20250218001512.1862030-1-festevam@gmail.com> <20250218001512.1862030-4-festevam@gmail.com>
 <2bdc04b3-05c8-42f4-682b-e46a1a1a10c1@huawei.com>
In-Reply-To: <2bdc04b3-05c8-42f4-682b-e46a1a1a10c1@huawei.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 18 Feb 2025 08:01:50 -0300
X-Gm-Features: AWEUYZm52zWBpB-I5NGTooGLXWCX7l2wz1rjcDOlgkHq1mbWwGzYtu4reC_fExw
Message-ID: <CAOMZO5CnxXYpM0QeuZD4Dwd0RmCEXXD6XUaSSkeBfE9cooLZNQ@mail.gmail.com>
Subject: Re: [PATCH mtd-utils 4/5] configure.ac: Add a check for execinfo and backtrace
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: david.oberhollenzer@sigma-star.at, raj.khem@gmail.com, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_030204_426001_CE6AA970 
X-CRM114-Status: GOOD (  11.39  )
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

SGkgWmhpaGFvLAoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIFR1ZSwgRmViIDE4LCAyMDI1
IGF0IDY6NDjigK9BTSBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90
ZToKCj4gSGkgRmFiaW8sCj4gSSdtIG5vdCBzdXJlIHdoaWNoIGxpYiBpcyBkZXBlbmRlZCBmb3Ig
ZXhlY2luZm8gYnkgbXVzbC4gV2UgZG9uJ3QgZGVwZW5kCj4gYW55IGxpYnMgZm9yIG90aGVyIGNv
bW1vbiBjb21waWxlcnMsIG90aGVyd2lzZSB3ZSBjb3VsZCBnZXQgZm9sbG93aW5nCj4gbWVzc2dh
Z3MgZm9yIGRvaW5nIGNvbmZpZ3VyZToKClRoZSBtdXNsIGxpYnJhcnkgZG9lIG5vdCBwcm92aWRl
IGV4ZWNpbmZvLgpJdCByZWxpZXMgb24gYW4gZXh0ZXJuYWwgZXhlY2luZm8gbGlicmFyeSB0byBw
cm92aWRlIGJhY2t0cmFjZSBzdXBwb3J0LgoKPiAgIGNoZWNraW5nIGZvciBzeXMvcmFuZG9tLmgu
Li4geWVzCj4gY2hlY2tpbmcgZm9yIGJhY2t0cmFjZSBpbiAtbGV4ZWNpbmZvLi4uIG5vICAjIElu
IGZhY3QgYmFja3RyYWNlIGlzCj4gc3VwcG9ydGVkLCBidXQgdGhlIG1lc3NhZ2UgdGVsbHMgdXMg
bm90LgoKVGhhdCBtZXNzYWdlIGlzIE9LLiBJbiB0aGlzIGNhc2UsIHRoZSBiYWNrdHJhY2UgZG9l
cyBub3QgY29tZSBmcm9tIHRoZQpleHRlcm5hbCBsaWJleGVjaW5mby4KSXQgY29tZXMgZnJvbSB0
aGUgQyBsaWJyYXJ5LiBJdCBkb2VzIG5vdCBtZWFuIHRoYXQgYmFja3RyYWNlIGlzIG5vdApzdXBw
b3J0ZWQuIEl0IG9ubHkgbWVhbnMgdGhhdApiYWNrdHJhY2UgZG9lcyBub3QgY29tZSBmcm9tIHRo
ZSBleHRlcm5hbCBsaWJleGVjaW5mby4KCldpdGggbXVzbCwgdGhlIGZvbGxvd2luZyBpcyBzZWVu
OgoKY2hlY2tpbmcgZm9yIGJhY2t0cmFjZSBpbiAtbGV4ZWNpbmZvLi4uIHllcwoKVGhpcyBtZWFu
cyB0aGF0IGJhY2t0cmFjZSBjb21lcyBmcm9tIHRoZSBleHRlcm5hbCBsaWJleGVjaW5mby4KCkkg
d2lsbCBhZGRyZXNzIHlvdXIgb3RoZXIgY29tbWVudHMgYW5kIHN1Ym1pdCBhIHYyIHNvb24uCgpU
aGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
