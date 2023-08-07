Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BF0C04A6A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4J1DQHNoWd7QgOyViW6+o21+GSaArJsW9lh2DPa6Ug=; b=3gt3u4DOH5nz6S
	KaYXRzv3Leqn42SMl/9qIQ2hMwkiGHDkQAFuaSXR9fNVVHY/cI8BaOqP5BJ+7r3xoL/q37rayXHFd
	6y4wHnsueNrJLSVT81+UbSIxG8KEdqMfOY4U2biIr/gB6f/IsG+rgpGGKvcIRIFCOO99UQt4PrpVY
	avgftlcWbRvUOZ+IqB5SwvYfZHHOW88M9R923vZqAJB7U3L6AFuUwILXsiqcxV4YCJnr0KM+/Eu7O
	01fCf2m4mpHkAAxcGKDEYFuC05SsSIzEOYaY0vZ3ldNr/lVkmlwurqbuBTaVmpsd630Q/q0DKU+s6
	E+UxxQfm2eCAxnEgzu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSykr-00H86J-2R;
	Mon, 07 Aug 2023 11:50:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSykp-00H85q-0p
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 11:50:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bc02bd4eafso38122065ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691409029; x=1692013829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DUiazTj+VYmFEy955EKtxmP3ocpz0QHylcvEbnBUq/k=;
        b=tL85YccuskFEAnglasCTymvzAvH0LOxoM1WtfMclwFxD5v4NAy2D4sNQhhQ/pu1Lko
         Me80FobM+DbAP5RVrWrbj0iXC79ccdLGV2seN2v4OjF9siDks3jCMR1D+IpLDcineBIh
         qET1XGb9sPiRpoPav6sxxJmqa0Mt8WCyo797sh4DBFwMC8cQzNO03+g7vO1sNmzBGLib
         sOIRMMMr5znMKn6gX++zsaSJNlvPS+mRwShY5qoekEKGzosRO2A9UgPqO9wEbRDcWQPS
         ZoGsAePYW7wfjwdmeSpck6lSACtr0iM3W6k0TQMAbOymijaEjmopVOaHq5DieJAZsqsB
         Pz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691409029; x=1692013829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUiazTj+VYmFEy955EKtxmP3ocpz0QHylcvEbnBUq/k=;
        b=KMG/47vnefgX/lAZ9o6FYpZWdA/SKTx9tWXmMo8w7X4FyPvSg1uss0XwO6hOxh0lym
         Io2laBrcKx5+znu/GmHmSeY7GPnSxeFOSY17bSXCA/LoXxjmtVobfpwGF6qXhqTvYK5O
         ihyKoOeR8K6knWo+Y9Kp+0cO7OoVKG2SuWvob0H7HJOeJdz34XhhbTy+ClsQK7TzNDaj
         nvgwlV2Yk61H6Qu3wdCHcOrpgNWtNgRnpY2H/yznrVIpWtff6Dd9ybGxkpuSego4rQW0
         Xd7ZEkqP1nXt+wxvGafbd46gthQBix8487jRCoMU/pjtpiMHTgy+Z932GALgMLbzT8R5
         y5Kg==
X-Gm-Message-State: AOJu0YyiDKpBYu/UHEEnHXDRv04v+cyz+odINCqScqJUtozHjqJCusCu
	DLdRkRgB73JCA/xAlQku3+c3
X-Google-Smtp-Source: AGHT+IGxyG24eMZv/l2Boj+w3NLo3TG8tCkd7qIJbJJtJvwpjYmapCBxD30NmTuiSRERTPfZu2DVRA==
X-Received: by 2002:a17:902:b68c:b0:1bc:2036:5338 with SMTP id c12-20020a170902b68c00b001bc20365338mr7850977pls.28.1691409029383;
        Mon, 07 Aug 2023 04:50:29 -0700 (PDT)
Received: from thinkpad ([117.217.180.167])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c20d00b001b8a1a25e6asm6706018pll.128.2023.08.07.04.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:50:28 -0700 (PDT)
Date: Mon, 7 Aug 2023 17:20:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, quic_mdalam@quicinc.com
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, dan.carpenter@linaro.org
Subject: Re: [PATCH 00/10] mtd: rawnand: qcom: Bunch of fixes and cleanups
Message-ID: <20230807115021.GB18257@thinkpad>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
 <20230806155309.25427927@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806155309.25427927@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_045031_310949_CBCF862E 
X-CRM114-Status: GOOD (  16.19  )
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

T24gU3VuLCBBdWcgMDYsIDIwMjMgYXQgMDM6NTM6MDlQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBNYW5pdmFubmFuLAo+IAo+IG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8u
b3JnIHdyb3RlIG9uIFNhdCwgIDUgQXVnIDIwMjMgMjM6MTE6MzYKPiArMDUzMDoKPiAKPiA+IEhp
IE1pcXVlbCwKPiA+IAo+ID4gVGhpcyBzZXJpZXMgaGFzIGZpeGVzIGZvciB0aGUgc21hdGNoIHdh
cm5pbmdzIHJlcG9ydGVkIGJ5IEtidWlsZCBib3QgWzFdCj4gPiBhbmQgYWxzbyBzZXZlcmFsIGNs
ZWFudXAgcGF0Y2hlcyBiYXNlZCBvbiBteSBjb2RlIG9ic2VydmF0aW9uLgo+ID4gCj4gPiBJJ3Zl
IG9ubHkgY29tcGlsZSB0ZXN0ZWQgdGhpcyBzZXJpZXMuIFNvIGxldCdzIHdhaXQgZm9yIFNhZHJl
L1NyaWNoYXJhbiB0bwo+ID4gZ2l2ZSBhIHRlc3RlZC1ieSB0YWcgdG8gbWFrZSBzdXJlIEkgZGlk
bid0IG1lc3MgdXAgYW55dGhpbmcuCj4gCj4gSSByZXZpZXdlZCBhbGwgdGhlIHBhdGNoZXMsIHRo
ZXkgbG9vayBnb29kIHRvIG1lLiBJJ20gd2FpdGluZyBmb3IgdGhlCj4gdGVzdHMuIFBsZWFzZSBw
cm92aWRlIHRoZSBvdXRwdXQgb2YgbmFuZGJpdGVycnMgLWkuCj4gCgpJIHRlc3RlZCB0aGUgc2Vy
aWVzIG9uIFFjb20gU0RYNTUgYmFzZWQgZGV2IGJvYXJkLCBidXQgaXQgd2FzIGJyb2tlbiBhbHJl
YWR5IGR1ZQp0byBjb21taXQgPDNmYzkyMzg0YjY1ND4gKCJtdGQ6IHJhd25hbmQ6IHFjb206IElt
cGxlbWVudCBleGVjX29wKCkiKS4KCkknbSBzZWVpbmcgYSBzdHJpbmcgb2YgdGhpcyBlcnJvciB3
aGlsZSB0aGUgcGFydGl0aW9ucyB3ZXJlIGJlaW5nIGVudW1lcmF0ZWQ6CnFjb20tbmFuZGMgMWIz
MDAwMC5uYW5kLWNvbnRyb2xsZXI6IGZhaWxlZCB0byBjb3B5IGxhc3QgY29kZXdvcmQKCkl0IGp1
c3QgZ29lcyBvbi4uLgoKU2FkcmUsIG9uIHdoYXQgcGxhdGZvcm0gZGlkIHlvdSB0ZXN0IDNmYzky
Mzg0YjY1ND8gRnJvbSBhIHF1aWNrIGxvb2ssIHRoZSBCQU0KRE1BIHRyYW5zYWN0aW9ucyBhcmUg
dGltaW5nIG91dC4KCi0gTWFuaQoKPiBUaGFua3MsCj4gTWlxdcOobAoKLS0gCuCuruCuo+Cuv+Cu
teCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
