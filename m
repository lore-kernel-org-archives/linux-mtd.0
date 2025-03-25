Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B46C35FFC
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Mar 2025 14:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pd1jtQPP51gmrjMY9L39u/EFt5cTNdp/y8rEZ6szNDU=; b=qxQ4cRjbaUDe9m
	qA+yqOIebOs4uYo47k6EMfsbbk8TM81NwJ4r6skonC+Q/oC06+T8dt/kzpU7Cg5ms+I6x/5Q+EZYJ
	jLyM+kWHx9b2OCMI1v+qqulU3m6R+Xk09eJFL5dAcJ2ZVU1vaNmydUl10fLXoOYGJ2P+qladq/fcL
	CJUTEez6jlJFAI1ScpVM+LZki/uLAkPtvFwNWncKLqC/HnAjKX/AetyEhfJ2Hwhaf9t5NJsuO4ZeL
	HQTzI+ed+Nl8eoToEqzLunfClxJXvnZ+p+ahE3wFioYd4SIajk76DcGCsRMjKcCvHLbPPg/S/LAWO
	dsuSv7vGUyBfsATlpwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5Ky-00000006Ci0-0lTm;
	Tue, 25 Mar 2025 14:33:04 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5Kv-00000006Cha-0T2O
	for linux-mtd@lists.infradead.org;
	Tue, 25 Mar 2025 14:33:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso10401298a91.3
        for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2025 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742913180; x=1743517980; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OKRABh44uDFI70lZVbe1fR/gjcdCuWiPeTV+hZF44Lg=;
        b=IPfeNj6H+sedeIi+eftGNDtZvnZvUZuB3oRv2FfFkp4xPpFr7AdC2oXpoVLMjgRKbs
         o/mlEJahi31qoeK14sgTnMfoUFGYQTYL24XiQrIXJj+oVAZZKGmKg7CtTy88XabOlhuB
         PGvy27KG1w1bkHR8rtkL6D4f6eX/Af1EFrjbFWXp9n+X/J5XEXMLJYGyb4wULD97u0sI
         NEwAH1ibPqJ0m8hECrivAbbKaHoeSWW6PVbU/GZptXB+dDy5+ynP+qBnDb7pNPQNGYB7
         ChNVL3jLxND2enOiF8dBHEIzVxPZ+F4jpqLf7Pk/wlnaN8t2uMnKzNc6Z2Yb8JqmRfNZ
         ibdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742913180; x=1743517980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKRABh44uDFI70lZVbe1fR/gjcdCuWiPeTV+hZF44Lg=;
        b=U0aUqunFCYuTBntqtd1VnXRjoJv85nIT4rROdxqwkkTRqtJl9o5/v0jFWy/eZUu7Np
         OL2MoKh1KK4HIyxfYhMFKqzj7hZydZ64OmFUPgC6N4StNtOzE0XMakhCCKA5UOZ4CRGJ
         JyaUYmbsMhr9OX2eKpoZU/A+erRLk8ZdHFTlGMXSQAiLEDMdGP4SZ7N571NxMDk2zac4
         trZpjz+0+IZHN3oiUAGLrbyh89V1Kk4aHSSY0DCvcWkF/pO7KgLbQ3b26VOolmVUiMvy
         2jOiNu2pEBokxeySROTJ49GYTym4a+ov+/oo3b975TATaKQBpZGqtqQitiqXvl5lg92k
         O6iA==
X-Forwarded-Encrypted: i=1; AJvYcCWnO7UicS7S6S635ZAIXh6iKRqum9abEy2VPZqTr+BTglSPSQvlo1y1kN6kIoFyS0ryw2un2QvxiAQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj+WSVLCeFbYcyw59Zm3x5JB1kT3XJiE5F3FnDtBh9KEV9rjJb
	O1iIivqgJlDK34cXXDLrsyw7LtQtAGemCGHBML2apsreuYWhw5sVq1W5umheOQ==
X-Gm-Gg: ASbGncsMrLwmbkMaUsLDCqKl/xhhtyCjiX/yg1wLlcXtKrhv68nmWy3C/zKh6/89Pu+
	FSLW6BRKcu3U5tjJYRuxZozXKNtkc3J6S3hJdaxrm0RFIzA80NxrKEQLO4/DhXeEG2PfHtfB8eQ
	v2SftyE+sRQ9tLnwXy0v46Fx0jZ4imKFz2ndfyBD7zxynwxKEhVPtnpAj5gJSU5tVx9zegW9o85
	GlQoyAitbZ4v5Ojd/t5qqz9kOTCSp8wSntbFnZl+zvBHrZW44Buubp9+ZXw2g2yr7psi3WaggEU
	95Y+CrVn1bv39QVVyr3M+8iLWTzX/ln326XnKKvrJIeZUkkR9nOJgIWE
X-Google-Smtp-Source: AGHT+IEB+XaCO6duAN2wp0HmjUzHuf7tiQOHA3Esz/U9fWrPnrUspdywgNu7CbKOFz9lwCKIl8JtAA==
X-Received: by 2002:a17:90b:5450:b0:301:6343:1626 with SMTP id 98e67ed59e1d1-3030fe58e5bmr25896303a91.1.1742913179728;
        Tue, 25 Mar 2025 07:32:59 -0700 (PDT)
Received: from thinkpad ([120.60.136.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf64aca3sm14431313a91.49.2025.03.25.07.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:32:59 -0700 (PDT)
Date: Tue, 25 Mar 2025 20:02:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	broonie@kernel.org, bbrezillon@kernel.org, linux-mtd@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Message-ID: <bu2msy7ngxzjk54rdq3fmgvww5rrn5ogjm4uq2vt2pwp6toxfw@ytvk6x6wcgi5>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-2-quic_mdalam@quicinc.com>
 <20250318073332.guylcyqjmfq5nyyr@thinkpad>
 <004c7c4a-69b4-c6f6-14c2-eb62672a7125@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004c7c4a-69b4-c6f6-14c2-eb62672a7125@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_073301_172563_CE34A759 
X-CRM114-Status: GOOD (  35.75  )
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

T24gVGh1LCBNYXIgMjAsIDIwMjUgYXQgMTE6MjM6NDBBTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiAKPiAKPiBPbiAzLzE4LzIwMjUgMTowMyBQTSwgTWFuaXZhbm5hbiBTYWRoYXNpdmFt
IHdyb3RlOgo+ID4gT24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMDU6Mzk6MDNQTSArMDUzMCwgTWQg
U2FkcmUgQWxhbSB3cm90ZToKPiA+ID4gQ3VycmVudGx5IHdlIGFyZSBjb25maWd1cmluZyBsb3dl
ciAyNCBiaXRzIG9mIGFkZHJlc3MgaW4gZGVzY3JpcHRvcgo+ID4gPiB3aGVyZWFzIFFQSUMgZGVz
aWduIGV4cGVjdHMgMTggYml0IHJlZ2lzdGVyIG9mZnNldCBmcm9tIFFQSUMgYmFzZQo+ID4gPiBh
ZGRyZXNzIHRvIGJlIGNvbmZpZ3VyZWQgaW4gY21kIGRlc2NyaXB0b3JzLiBUaGlzIGlzIGxlYWRp
bmcgdG8gYQo+ID4gPiBkaWZmZXJlbnQgYWRkcmVzcyBhY3R1YWxseSBiZWluZyB1c2VkIGluIEhX
LCBsZWFkaW5nIHRvIHdyb25nIHZhbHVlCj4gPiA+IHJlYWQuCj4gPiA+IAo+ID4gPiB0aGUgYWN0
dWFsIGlzc3VlIGlzIHRoYXQgdGhlIE5BTkRjIGJhc2UgYWRkcmVzcyBpcyBkaWZmZXJlbnQgZnJv
bSB0aGUKPiA+ID4gUVBJQyBiYXNlIGFkZHJlc3MuIEJ1dCB0aGUgZHJpdmVyIGRvZXNuJ3QgdGFr
ZSBpdCBpbnRvIGFjY291bnQgYW5kIGp1c3QKPiA+ID4gdXNlZCB0aGUgUVBJQyBiYXNlIGFzIHRo
ZSBOQU5EYyBiYXNlLiBUaGlzIHVzZWQgdG8gd29yayBhcyB0aGUgTkFORGMgSVAKPiA+ID4gb25s
eSBjb25zaWRlcnMgdGhlIGxvd2VyIDE4IGJpdHMgb2YgdGhlIGFkZHJlc3MgcGFzc2VkIGJ5IHRo
ZSBkcml2ZXIgdG8KPiA+ID4gZGVyaXZlIHRoZSByZWdpc3RlciBvZmZzZXQuIFNpbmNlIHRoZSBi
YXNlIGFkZHJlc3Mgb2YgUVBJQyB1c2VkIHRvIGNvbnRhaW4KPiA+ID4gYWxsIDAgZm9yIGxvd2Vy
IDE4IGJpdHMgKGxpa2UgMHgwNzk4MDAwMCksIHRoZSBkcml2ZXIgZW5kZWQgdXAgcGFzc2luZyB0
aGUKPiA+IAo+ID4gV2hhdCBpcyB0aGlzIGFkZHJlc3M/IElzIGl0IGNvbWluZyBmcm9tIERUPwo+
ID4gCj4gPiA+IGFjdHVhbCByZWdpc3RlciBvZmZzZXQgaW4gaXQgYW5kIE5BTkRjIHdvcmtlZCBw
cm9wZXJseS4gQnV0IG9uIG5ld2VyIFNvQ3MKPiA+ID4gbGlrZSBTRFg3NSwgdGhlIFFQSUMgYmFz
ZSBhZGRyZXNzIGRvZXNuJ3QgY29udGFpbiBhbGwgMCBmb3IgbG93ZXIgMTggYml0cwo+ID4gPiAo
bGlrZSAweDAxQzk4MDAwKS4gU28gTkFORGMgc2VlcyB3cm9uZyBvZmZzZXQgYXMgcGVyIHRoZSBj
dXJyZW50IGxvZ2ljCj4gPiA+IAo+ID4gPiBUaGUgYWRkcmVzcyBzaG91bGQgYmUgcGFzc2VkIHRv
IEJBTSAweDMwMDAwICsgb2Zmc2V0LiBJbiBvbGRlciB0YXJnZXRzCj4gPiAKPiA+IFlvdSBnYXZl
IG5vIGV4cGxhbmF0aW9uIG9uIGhvdyB0aGlzIDB4MzAwMDAgb2Zmc2V0IGNhbWUgaW50byBwaWN0
dXJlLiBJIGdhdmUgdGhlCj4gPiByZWFzb25pbmcgaW4gdjI6Cj4gPiAKPiA+ICJTRFg1NSdzIE5B
TkRjIGJhc2UgaXMgMHgwMWIzMDAwMCBhbmQgaXQgaGFzIGJpdHMgMTcgYW5kIDE4IHNldCBjb3Jy
ZXNwb25kaW5nIHRvCj4gPiAweDMwMDAwLiBTbyBpdCBpcyBjb3JyZWN0IHRoYXQgdGhlIElQIG9u
bHkgY29uc2lkZXJzIGxvd2VyIDE4IGJpdHMgYW5kIGl0IHVzZWQKPiA+IHRvIHdvcmsgYXMgdGhl
IGRyaXZlciBlbmRlZCB1cCBwYXNzaW5nIDB4MzAwMCArIHJlZ2lzdGVyIG9mZnNldC4iCj4gPiAK
PiA+IFRoZW4geW91IHJlcGxpZWQ6Cj4gPiAKPiA+ICJUaGlzIGFkZHJlc3MgMHgzMDAwMCBpcyB0
aGUgYWRkcmVzcyBmcm9tIFFQSUNfQkFTRSB0byBRUElDX0VCSTJOQU5ECj4gPiBlLmcgZm9yIFNE
WDU1IGFuZCBTRFg2NSB0aGUgUVBJQ19CQVNFIGlzIDB4MDFCMDAwMDAuIFNvIGhlcmUgbG93ZXIg
MTgtYml0cwo+ID4gYXJlIHplcm8gb25seS4iCj4gPiAKPiA+IE5vIG9uZSBvdXRzaWRlIFFjb20g
a25vd3Mgd2hhdCBRUElDX0JBU0UgYW5kIFFQSUNfRUJJMk5BTkQgYXJlLiBXZSBqdXN0IGtub3cg
dGhlCj4gPiBOQU5EYyBhZGRyZXNzIG1lbnRpb25lZCBpbiBEVCwgd2hpY2ggY29ycmVzcG9uZHMg
dG8gMHgwMWIzMDAwMCBmb3IgU0RYNTUuCj4gPiAKPiA+IFBsZWFzZSByZXdvcmQgdGhlIGNvbW1p
dCBtZXNzYWdlIHRvIHByZXNlbnQgdGhlIGZ1bGwgcGljdHVyZSBhbmQgbm90IGhhbGYgYmFrZWQK
PiA+IGluZm8uIFRoaXMgaXMgdjMsIEkgc2VlIG5vIGltcHJvdmVtZW50IGluIHRoZSBjb21taXQg
bWVzc2FnZSwgc29ycnkuCj4gPiAKPiA+ID4gdGhlIGxvd2VyIDE4LWJpdHMgYXJlIHplcm8gc28g
dGhhdCBjb3JyZWN0IGFkZHJlc3MgYmVpbmcgcGFhc2VkLiBCdXQKPiA+ID4gaW4gbmV3ZXIgdGFy
Z2V0cyB0aGUgbG93ZXIgMTgtYml0cyBhcmUgbm9uLXplcm8gaW4gUVBJQyBiYXNlIHNvIHRoYXQK
PiA+ID4gMHgzMDAwMDAgKyBvZmZzZXQgZ2l2aW5nIHRoZSB3cm9uZyB2YWx1ZS4KPiA+ID4gCj4g
PiA+IFNEWDc1IDogUVBJQ19RUElDIHwgMHgwMUM5ODAwMCAoTG93ZXIgMTggYml0cyBhcmUgbm9u
IHplcm8pCj4gPiA+IFNEWDU1IDogUVBJQ19RUElDIHwgMHgxQjAwMDAwIChMb3dlciAxOCBiaXRz
IGFyZSB6ZXJvKSBTYW1lIGZvcgo+ID4gCj4gPiBUaGVyZSBpcyBubyBhZGRyZXNzIGFzICcweDFC
MDAwMDAnIGluIERULgo+IAo+IE1hbmksCj4gCj4gUGxlYXNlIHNlZSBpZiB0aGlzIGNvbW1pdCBt
ZXNzYWdlIHdvdWxkIGJlIGFjY2VwdGFibGU/Cj4gCj4gCVRoZSBCQU0gY29tbWFuZCBkZXNjcmlw
dG9yIHByb3ZpZGVzIG9ubHkgMTggYml0cyB0byBzcGVjaWZ5Cj4gCXRoZSBOQU5EIHJlZ2lzdGVy
IG9mZnNldC4gQWRkaXRpb25hbGx5LCBpbiB0aGUgQkFNIGNvbW1hbmQKPiAJZGVzY3JpcHRvciwg
dGhlIE5BTkQgcmVnaXN0ZXIgb2Zmc2V0IGlzIHN1cHBvc2VkIHRvIGJlCj4gCXNwZWNpZmllZCBh
cyAiKE5BTkRjIG9mZnNldCAtIEJBTSBiYXNlIG9mZnNldCkgKyByZWdfb2ZmIi4KCklzbid0IGl0
LCAoTkFORGMgYmFzZSAtIEJBTSBiYXNlKT8gJ29mZnNldCcgaXMgbm90IHZhbGlkIGhlcmUuCgpB
bmQgYWxzbywgeW91IGFyZSBqdXN0IG1peGluZyB0aGUgbmFtZXMgZXZlcnl3aGVyZS4gSGVyZSB5
b3Ugc2F5LCBOQU5EYyBiYXNlCmFuZCBCQU0gYmFzZSwgYnV0IGluIHBhdGNoIDQ6CgoiTkFORCBy
ZWdpc3RlciBhZGRyZXNzZXMgdG8gYmUgY29tcHV0ZWQgYmFzZWQgb24gdGhlIE5BTkQgcmVnaXN0
ZXIgb2Zmc2V0IGZyb20KUVBJQyBiYXNlIi4gU28gdGhlIHNlY29uZCBhZGRyZXNzIGlzIEJBTSBv
ciBRUElDPwoKUGxlYXNlIGJlIGNvbnNpc3RlbnQgd2l0aCBuYW1pbmcuCgo+IAlTaW5jZSwgdGhl
IG5hbmQgZHJpdmVyIGlzbid0IGF3YXJlIG9mIHRoZSBCQU0gYmFzZSBvZmZzZXQsCj4gCWhhdmUg
dGhlIHZhbHVlIG9mICJOQU5EYyBvZmZzZXQgLSBCQU0gYmFzZSBvZmZzZXQiIGluIGEgbmV3Cj4g
CWZpZWxkICduYW5kY19vZmZzZXQnIGluIHRoZSBOQU5EIHByb3BlcnRpZXMgc3RydWN0dXJlIGFu
ZCB1c2UKPiAJaXQgd2hpbGUgcHJlcGFyaW5nIHRoZSBkZXNjcmlwdG9yLgo+IAoKQW5kIHdoYXQg
YWJvdXQgJ25hbmRjX29mZnNldCc/IE5BTkRjIGlzIGFscmVhZHkgdGhlIHRlcm0gdXNlZCBmb3Ig
TkFORApjb250cm9sbGVyIHdoaWNoIGhhcyB0aGUgYmFzZSBhZGRyZXNzIG9mIDB4MDFiMzAwMDAg
aW4gRFQuIFNvIGNsZWFybHksIHRoZSBuYW1lCm9mIHRoZSBvZmZzZXQgdmFyaWFibGUgaXMgbm90
IGNvcnJlY3QuCgo+IAlQcmV2aW91c2x5LCB0aGUgTkFORCBkcml2ZXIgd2FzIGluY29ycmVjdGx5
IHNwZWNpZnlpbmcgdGhlCj4gCU5BTkQgcmVnaXN0ZXIgb2Zmc2V0IGRpcmVjdGx5IGluIHRoZSBC
QU0gZGVzY3JpcHRvci4KPiAKCk5vLiBQcmV2aW91c2x5LCB0aGUgZHJpdmVyIHdhcyBzcGVjaWZ5
aW5nIHRoZSBOQU5EYyBiYXNlIGFkZHJlc3MgaW4gdGhlIEJBTQpkZXNjcmlwdG9yLiBZb3UgYXJl
IG5vdyB0cnlpbmcgdG8gcGFzcyB0aGUgcmVnaXN0ZXIgb2Zmc2V0LgoKLSBNYW5pCgotLSAK4K6u
4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
