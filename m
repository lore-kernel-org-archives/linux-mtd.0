Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222C3C3DA64
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2024 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBU/jO5ab7RDtJit9OBmDU02U0lM4GjRJbTFG2UMN9w=; b=rANyMrviAYUJ79
	TfYEesCxZAP59dfwFo6BzdGSiVsryZenPRq/1kk1zmEkmywbQ+hlHgaZk8CvpvffFBhxOxyKCi4FJ
	VHoi6MK68D/Vigd2Ej+lztT91sDtOos4BtrpROhmlz9DK63EcneCygRxXem0thBoYy9KLK+Favxr1
	EWFlJlToqDphV2mrNPTQXFhpIApC3szGeRz06Iwv4xPf9bWE/+CEOK1UFvDqGYgSznq2eD+G8E7RV
	zfRpLq+9nlmuz3/uyI+7Y1QxiHgGo/+J7md2jO5CBQbW3tL68y4jiENKELKt98igx2tMje+fxi/65
	JR++5Y05QBTI0A7WwpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSic-00000004h2x-2ofG;
	Thu, 01 Aug 2024 10:07:34 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSiC-00000004gt3-3oSy
	for linux-mtd@lists.infradead.org;
	Thu, 01 Aug 2024 10:07:10 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5ab2baf13d9so9543993a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2024 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722506827; x=1723111627; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vSY6lydLkfNDrrATRB5SSKr4Pg3eOn4NQvD8VeqDqo=;
        b=MwgJdgQ7CRbka+09EQ3prqCsyNLMaJNJ/4X5h1ZVuW7AUPh5zQCJ7ywu3FmCc7QFZV
         0kp+2Zlld5YcnY90rRh4KJYWE86O6ObCQdkEhSPAD82Hs1VVDEUtEiGUjGjQLq+CK/B1
         D43XhgDOeezZBUU2f/fYH6oYSDShx4YKOhSK+u0ixVQRgKLEbWiRfvunOehLks1m4Lp7
         8JLs45hY+7mOlFvgOAy+WH7v/cOB4PW/gKWvm8rq5sUoqKjemK5iaAXUAByn9LmLQk53
         MzcQK1r16a2daVNx3+YEpFkJ4qUONC+taCED4mQk7WinTqcUVg7Vb7QJ2v4TJ+h+qj0j
         hYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722506827; x=1723111627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vSY6lydLkfNDrrATRB5SSKr4Pg3eOn4NQvD8VeqDqo=;
        b=IMSCaAHk0GFfVJ+CB5M/DEwETkEIUdHn2WVv5ndJBvca2PKyXKO1dV0s3cDDuFhO1J
         IBafQRY9ws+Mvsrit6V9aetHSH6yETFJKSUh1Z0uo/tirb/E8fOfjonDD9gr4TlB0xt6
         YHZVxkYhveMil/coi3cu4uUCgaus59LMVVDAffOOLE/sdsoag7OWfLCP6D5Y3lQaPSGw
         QtObZKN3FyiAhkXHINp15buvdIvjwBpcANGyjGilekC/zYBEmLLFhPPE+Htm4PJ+YX4M
         MuTNX4tWZQlY0EA0tjgjvqQYxuEkJFCzqqUK+84oWAhTzDb5/gCFrg/XTY2d1O3riYT5
         hxYw==
X-Forwarded-Encrypted: i=1; AJvYcCVn2LKZJW5z67ByaLiwSAgJgLycXp+wkfLqz2LlD5ujfH6TB2YxZe6TOcc5kHXpsYP1KqUM9ZThGU3rBpa7L2KqUMz1UX9JjDvkgZ6Nmw==
X-Gm-Message-State: AOJu0YwI5fQ6GqWFK0rniUy4A+VG3Qpli56nX8XnFsvE9kRmW0/lsKrh
	VJrG+pRqB/Teqz8DP9hqX5mZc4XgPtcS91jXAXnq+nIIVHBiVyb8p9faFnP6AgwbQ3KZL+/tfIV
	flnhXAMnGYkcMe2T9KAoxPDdb5To=
X-Google-Smtp-Source: AGHT+IEtvdEGMEdlpwj3fZzWkXiTreBRhSwXUsC3Ll4UR5KrAHhq3dJbqwzS/CodcHNC4Ebn20/zdzul4iKt8ZqGaUU=
X-Received: by 2002:a50:ec82:0:b0:5a0:d481:a22a with SMTP id
 4fb4d7f45d1cf-5b6fe82383emr1267700a12.7.1722506826299; Thu, 01 Aug 2024
 03:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
 <20240430-loongson1-nand-v7-2-60787c314fa4@gmail.com> <20240506091748.18c120d5@xps-13>
 <CAJhJPsVOx_AZmsRuZ5jy2-wJ+7-Wm+8RQAJ_LhKGLU3aFzrR7g@mail.gmail.com> <20240520173325.79fee6a5@xps-13>
In-Reply-To: <20240520173325.79fee6a5@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 1 Aug 2024 18:06:29 +0800
Message-ID: <CAJhJPsWczs4o0Fj9+77r8jPcd4C9Hih5kxy=3X-3Tyz-0-3SDg@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] mtd: rawnand: Enable monolithic read when reading subpages
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_030709_050381_B251FD40 
X-CRM114-Status: GOOD (  29.51  )
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

U29ycnkhCkkgYWRtaXQgdGhpcyBpcyB0YWtpbmcgYSBzaG9ydGN1dC4KV2lsbCBkcm9wIHRoaXMg
cGF0Y2ggYW5kIGltcGxlbWVudCBzdWJwYWdlIHJlYWQgaW5zdGVhZC4KVGhhbmtzIQoKT24gTW9u
LCBNYXkgMjAsIDIwMjQgYXQgMTE6MzPigK9QTSBNaXF1ZWwgUmF5bmFsCgo8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBLZWd1YW5nLAo+Cj4ga2VndWFuZy56aGFuZ0Bn
bWFpbC5jb20gd3JvdGUgb24gTW9uLCAyMCBNYXkgMjAyNCAxODo0MjozMCArMDgwMDoKPgo+ID4g
T24gTW9uLCBNYXkgNiwgMjAyNCBhdCAzOjE34oCvUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBkZXZu
dWxsK2tlZ3VhbmcuemhhbmcuZ21haWwuY29tQGtlcm5lbC5vcmcgd3JvdGUgb24gVHVlLCAzMCBB
cHIgMjAyNAo+ID4gPiAxOToxMToxMSArMDgwMDoKPiA+ID4KPiA+ID4gPiBGcm9tOiBLZWd1YW5n
IFpoYW5nIDxrZWd1YW5nLnpoYW5nQGdtYWlsLmNvbT4KPiA+ID4gPgo+ID4gPiA+IG5hbmRfcmVh
ZF9zdWJwYWdlKCkgcmVhZHMgZGF0YSBhbmQgRUNDIGRhdGEgYnkgdHdvIHNlcGFyYXRlCj4gPiA+
ID4gb3BlcmF0aW9ucy4KPiA+ID4gPiBUaGlzIHBhdGNoIGFsbG93cyB0aGUgTkFORCBjb250cm9s
bGVycyB3aG8gc3VwcG9ydAo+ID4gPiA+IG1vbm9saXRoaWMgcGFnZSByZWFkIHRvIGRvIHN1YnBh
Z2UgcmVhZCBieSBhIHNpbmdsZSBvcGVyYXRpb24sCj4gPiA+ID4gd2hpY2ggaXMgbW9yZSBlZmZl
Y3RpdmUgdGhhbiBuYW5kX3JlYWRfc3VicGFnZSgpLgo+ID4gPgo+ID4gPiBJIGFtIGEgYml0IHB1
enpsZWQgYnkgdGhpcyBjaGFuZ2UuIFVzdWFsbHkgbmFuZF9yZWFkX3N1YnBhZ2UgaXMgdXNlZAo+
ID4gPiBmb3Igb3B0aW1pemF0aW9ucyAod2hlbiBsZXNzIGRhdGEgdGhhbiBhIGZ1bGwgcGFnZSBt
dXN0IGJlIHJldHJpZXZlZCkuCj4gPiA+IEkga25vdyBpdCBtYXkgYmUgdXNlZCBpbiBvdGhlciBj
YXNlcyAoYmVjYXVzZSBpdCdzIGVhc2llciBmb3IgdGhlIGNvcmUKPiA+ID4gaW4gb3JkZXIgdG8g
c3VwcG9ydCBhIHdpZGUgcmFuZ2Ugb2YgY29udHJvbGxlcnMpLiBDYW4geW91IHBsZWFzZSBzaG93
IGEKPiA+ID4gc3BlZWQgdGVzdCBzaG93aW5nIHRoZSByZXN1bHRzIGJlZm9yZSBJIGNvbnNpZGVy
IG1lcmdpbmcgdGhpcyBwYXRjaD8KPiA+ID4KPiA+IFdpdGggdGhpcyBwYXRjaDoKPiA+ICMgZmxh
c2hfc3BlZWQgLWMgMTI4IC1kIC9kZXYvbXRkMQo+ID4gc2Nhbm5pbmcgZm9yIGJhZCBlcmFzZWJs
b2Nrcwo+ID4gc2Nhbm5lZCAxMjggZXJhc2VibG9ja3MsIDAgYXJlIGJhZAo+ID4gdGVzdGluZyBl
cmFzZWJsb2NrIHdyaXRlIHNwZWVkCj4gPiBlcmFzZWJsb2NrIHdyaXRlIHNwZWVkIGlzIDIxMTIg
S2lCL3MKPiA+IHRlc3RpbmcgZXJhc2VibG9jayByZWFkIHNwZWVkCj4gPiBlcmFzZWJsb2NrIHJl
YWQgc3BlZWQgaXMgMzQ1NCBLaUIvcwo+ID4gdGVzdGluZyBwYWdlIHdyaXRlIHNwZWVkCj4gPiBw
YWdlIHdyaXRlIHNwZWVkIGlzIDE5MTUgS2lCL3MKPiA+IHRlc3RpbmcgcGFnZSByZWFkIHNwZWVk
Cj4gPiBwYWdlIHJlYWQgc3BlZWQgaXMgMjk5OSBLaUIvcwo+ID4gdGVzdGluZyAyIHBhZ2Ugd3Jp
dGUgc3BlZWQKPiA+IDIgcGFnZSB3cml0ZSBzcGVlZCBpcyAyMDAwIEtpQi9zCj4gPiB0ZXN0aW5n
IDIgcGFnZSByZWFkIHNwZWVkCj4gPiAyIHBhZ2UgcmVhZCBzcGVlZCBpcyAzMjA3IEtpQi9zCj4g
PiBUZXN0aW5nIGVyYXNlIHNwZWVkCj4gPiBlcmFzZSBzcGVlZCBpcyA3MjQ5NSBLaUIvcwo+ID4g
VGVzdGluZyAyeCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZAo+ID4gMnggbXVsdGktYmxvY2sgZXJh
c2Ugc3BlZWQgaXMgNzQxMzUgS2lCL3MKPiA+IFRlc3RpbmcgNHggbXVsdGktYmxvY2sgZXJhc2Ug
c3BlZWQKPiA+IDR4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDc0ODEyIEtpQi9zCj4gPiBU
ZXN0aW5nIDh4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkCj4gPiA4eCBtdWx0aS1ibG9jayBlcmFz
ZSBzcGVlZCBpcyA3NTUwMiBLaUIvcwo+ID4gVGVzdGluZyAxNnggbXVsdGktYmxvY2sgZXJhc2Ug
c3BlZWQKPiA+IDE2eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NTg1MSBLaUIvcwo+ID4g
VGVzdGluZyAzMnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKPiA+IDMyeCBtdWx0aS1ibG9jayBl
cmFzZSBzcGVlZCBpcyA3NTg1MSBLaUIvcwo+ID4gVGVzdGluZyA2NHggbXVsdGktYmxvY2sgZXJh
c2Ugc3BlZWQKPiA+IDY0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NjIwNCBLaUIvcwo+
ID4gZmluaXNoZWQKPiA+Cj4gPiBXaXRob3V0IHRoaXMgcGF0Y2g6Cj4gPiAjIGZsYXNoX3NwZWVk
IC1jIDEyOCAtZCAvZGV2L210ZDEKPiA+IHNjYW5uaW5nIGZvciBiYWQgZXJhc2VibG9ja3MKPiA+
IHNjYW5uZWQgMTI4IGVyYXNlYmxvY2tzLCAwIGFyZSBiYWQKPiA+IHRlc3RpbmcgZXJhc2VibG9j
ayB3cml0ZSBzcGVlZAo+ID4gZXJhc2VibG9jayB3cml0ZSBzcGVlZCBpcyAyMDc0IEtpQi9zCj4g
PiB0ZXN0aW5nIGVyYXNlYmxvY2sgcmVhZCBzcGVlZAo+ID4gZXJhc2VibG9jayByZWFkIHNwZWVk
IGlzIDI4OTUgS2lCL3MKPiA+IHRlc3RpbmcgcGFnZSB3cml0ZSBzcGVlZAo+ID4gcGFnZSB3cml0
ZSBzcGVlZCBpcyA5OTggS2lCL3MKPiA+IHRlc3RpbmcgcGFnZSByZWFkIHNwZWVkCj4gPiBwYWdl
IHJlYWQgc3BlZWQgaXMgMTQ5OSBLaUIvcwo+ID4gdGVzdGluZyAyIHBhZ2Ugd3JpdGUgc3BlZWQK
PiA+IDIgcGFnZSB3cml0ZSBzcGVlZCBpcyAxMDAyIEtpQi9zCj4gPiB0ZXN0aW5nIDIgcGFnZSBy
ZWFkIHNwZWVkCj4gPiAyIHBhZ2UgcmVhZCBzcGVlZCBpcyAxNTU0IEtpQi9zCj4gPiBUZXN0aW5n
IGVyYXNlIHNwZWVkCj4gPiBlcmFzZSBzcGVlZCBpcyA3NjU2MCBLaUIvcwo+ID4gVGVzdGluZyAy
eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZAo+ID4gMnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQg
aXMgNzQwMTkgS2lCL3MKPiA+IFRlc3RpbmcgNHggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKPiA+
IDR4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDc0NzY5IEtpQi9zCj4gPiBUZXN0aW5nIDh4
IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkCj4gPiA4eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBp
cyA3NTE0OSBLaUIvcwo+ID4gVGVzdGluZyAxNnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKPiA+
IDE2eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NTkyMSBLaUIvcwo+ID4gVGVzdGluZyAz
MnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQKPiA+IDMyeCBtdWx0aS1ibG9jayBlcmFzZSBzcGVl
ZCBpcyA3NTkyMSBLaUIvcwo+ID4gVGVzdGluZyA2NHggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQK
PiA+IDY0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyA3NTkyMSBLaUIvcwo+ID4gZmluaXNo
ZWQKPiA+Cj4gPiBUaGUgdGhyb3VnaHB1dCBvZiB0aGUgZm9ybWVyIGlzIHR3aWNlIHRoYXQgb2Yg
dGhlIGxhdHRlci4KPgo+IEFuZCB3aGF0IGlzIHlvdXIgTkFORCBjb250cm9sbGVyIGRyaXZlcj8K
Pgo+IHN1YnBhZ2UgcmVhZHMgYXJlIHVzZWQgd2hlbiB5b3Ugb25seSB3YW50IHRvIHJlYWQgYSBz
dWJzZXQgb2YgYSBOQU5ECj4gcGFnZS4KPgo+IE90aGVyd2lzZSB0aGUgY29yZSBtYXkgdXNlIHRo
ZSBSTkRPVVQgY29tbWFuZCB0byBjaGFuZ2UgdGhlIHBvaW50ZXIgaW4KPiB0aGUgY2hpcCdzIFNS
QU0gdG8gcmVhZCBmcm9tIGEgZGlmZmVyZW50IGxvY2F0aW9uLCBidXQgSSBkb24ndCBzZWUgd2hh
dAo+IGlzIGltcGFjdGluZyBzbyBtdWNoLCB1bmxlc3MgaWYgdGhlIGRyaXZlciBpbXBsZW1lbnRh
dGlvbiBpcyByZWFsbHkKPiBzdWItb3B0aW1pemVkLgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCgoK
LS0KQmVzdCByZWdhcmRzLAoKS2VndWFuZyBaaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
