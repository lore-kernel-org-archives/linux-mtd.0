Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1DFC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 20:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8M0QmsOM9F6vE1R/FbOHd2yimBr3KebBk8Eujcxur7g=; b=2ktB4zsDx2/rHV
	Bn1/u7GD44vkDZSW/2t+3+taZdlVm1GSPbzwsH1hqOq22cHhNiRt4c0WMoM0/U6rjp5dDAla3l9hJ
	fmQDM1+esVnNgRCrIHVCs6o0/ND+oik+4wsfBlllhrMYlFiaZWWTKIUrSaqnlSvgCV3QZovkGjR2w
	Eb7UsGRklQ3C+xEfXyZ++PWP+O1S2MNDRKMPR2lYQSDHdc/NrgrDnfd9OOq92yJ0jr9ASclu8o3Xe
	+U0K7xYjbOU4XVitOMabMPEKMgVnhJy9uPdBJ8iGX7V7rHzuN/pcQ8rBOtT19TJXinxpaROFZfqN/
	2rtctheU6r1iF2F7MIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noW99-003ukx-Ul; Tue, 10 May 2022 20:07:52 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noW97-003uk2-JE
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 20:07:51 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso2000134wma.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2022 13:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7t/dYXLOrWyPR6e0gTNdWYUxgAYSle4zMbdfPRexeZ4=;
 b=HH/0nVElAF1y1rfGeHMRJkzArUwXxGETMXm7YSwP6adEtbBrqQeCIhTK1zmfD7cxv/
 si0xd5hAK4tTB9uTqtErFdShC6u/yyHfDgw/tjkcbWerpuQ5Usk3Xm9KGLuQVC4P8oOL
 F/zxSZkEI0z9D0uaZWYkXuQc7DJCuhwH6JlSG7nIO42IB5wCXZSYzeFcZH+OkuBmZezp
 Hq6hPw3ekzzNr45+LltY3RYlJSsP90dLJ7MWbMW/zVA5v1Yv6I7cjfu5Z/jDWZRtRvCv
 JX+WluFOWXgRCeVsSovdv+e5DgAIqMBcAWsrHPNaH9anvMVX4TCVPXMtPfbbmzJ9vRDy
 R10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7t/dYXLOrWyPR6e0gTNdWYUxgAYSle4zMbdfPRexeZ4=;
 b=aIjMeDuKiBhCSU1+kMdEONYAeXNvXTaGM8nvlyKR6ShUi3xjoLP9iZr6NIE9z5uiZM
 Xazgjz+ccqQiowYpBjgAt7iGENM8cgvL8kpbfqYCif+ZsroL6U8q2OISApRSh3zdDArM
 T/GimNzJTpbHP3hMFPB0+4Wt5AwtbWanxgx7DBa5ATGin5AmU6cPl8NZ9vAhIoWaqoVW
 cHgtiv8Td6eio4Um0Zuhy8fwzxwxM4GiO09suBHjsrBwh0o0ajmlg6DW07JsChS0Qncf
 TbCppMw7rNItU7w6R45LMAmO8Mx34/I1TdYretHltykmFNOE/dNKdrZrnFsBZKgpwQ1e
 Owgw==
X-Gm-Message-State: AOAM531efSEFsuideCXiPxk09VB9SKQNu8B16GLTa8JWGxyWNix05Qgt
 PpWKOmqMfMIzxVrOQ9EQEaQ=
X-Google-Smtp-Source: ABdhPJw8eBlTdeQItDiSVzgwx/oTcwDXSW+F/WbdYeS8IuSJSeObVG3fASZ44OIF6Fa5hCrhTAlAlA==
X-Received: by 2002:a05:600c:34c8:b0:394:92b4:f63c with SMTP id
 d8-20020a05600c34c800b0039492b4f63cmr1603994wmq.58.1652213266681; 
 Tue, 10 May 2022 13:07:46 -0700 (PDT)
Received: from [172.22.204.227] ([104.28.230.247])
 by smtp.gmail.com with ESMTPSA id
 c14-20020adffb0e000000b0020c6fa5a797sm15013148wrr.91.2022.05.10.13.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 13:07:46 -0700 (PDT)
Message-ID: <ede9e050-3b60-ba0e-c626-044f7825adb7@gmail.com>
Date: Tue, 10 May 2022 23:07:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] mtd: parsers: add support for Sercomm partitions
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 NOGUCHI Hiroshi <drvlabo@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Karim <Karimdplay@gmail.com>, M <x1@disroot.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20220329122016.4122899-1-csharper2005@gmail.com>
 <20220330100958.57dc4d61@xps13>
From: Mikhail Zhilkin <csharper2005@gmail.com>
In-Reply-To: <20220330100958.57dc4d61@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_130749_685426_A40BBE80 
X-CRM114-Status: GOOD (  14.56  )
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

SGkgTWlxdWVsLAoKT24gMy8zMC8yMDIyIDExOjA5IEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIE1pa2hhaWwsCj4KPiBjc2hhcnBlcjIwMDVAZ21haWwuY29tIHdyb3RlIG9uIFR1ZSwgMjkg
TWFyIDIwMjIgMTI6MjA6MTYgKzAwMDA6Cj4KPj4gVGhpcyBhZGRzIGFuIE1URCBwYXJ0aXRpb24g
cGFyc2VyIGZvciB0aGUgU2VyY29tbSBwYXJ0aXRpb24gdGFibGUgdGhhdAo+PiBpcyB1c2VkIGlu
IHNvbWUgQmVlbGluZSwgTmV0Z2VhciBhbmQgU2VyY29tbSByb3V0ZXJzLgo+Pgo+PiBUaGUgU2Vy
Y29tbSBwYXJ0aXRpb24gbWFwIHRhYmxlIGNvbnRhaW5zIHJlYWwgcGFydGl0aW9uIG9mZnNldHMs
IHdoaWNoCj4+IG1heSBkaWZmZXIgZnJvbSBkZXZpY2UgdG8gZGV2aWNlIGRlcGVuZGluZyBvbiB0
aGUgbnVtYmVyIGFuZCBsb2NhdGlvbiBvZgo+PiBiYWQgYmxvY2tzIG9uIE5BTkQuCj4+Cj4+IERl
dmljZSB0cmVlIGV4YW1wbGU6Cj4+IHBhcnRpdGlvbnMgewo+PiAJY29tcGF0aWJsZSA9ICJzZXJj
b21tLHNjLXBhcnRpdGlvbnMiLCAiZml4ZWQtcGFydGl0aW9ucyI7Cj4+IAkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKPj4gCSNzaXplLWNlbGxzID0gPDE+Owo+Pgo+PiAJcGFydGl0aW9uQDAgewo+PiAJ
CWxhYmVsID0gInUtYm9vdCI7Cj4+IAkJcmVnID0gPDB4MCAweDEwMDAwMD47Cj4+IAkJc2NwYXJ0
LWlkID0gPDA+Owo+PiAJCXJlYWQtb25seTsKPj4gCX07Cj4+IH07Cj4gWW91J2xsIG5lZWQgYSBE
VCBiaW5kaW5nIHBhdGNoIGFuZCBSb2IncyBhY2shCgpJIGhvcGUgdGhhdCBJIG5lYXIgdG8gZmlu
aXNoIHdpdGggRFQgYmluZGluZy4uLgoKTGluazoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjIwNTEwMTYyMzE0LjIwODEwLTEtY3NoYXJwZXIyMDA1QGdtYWlsLmNvbS8KCkxpbms6Cmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDUxMDE2MjQwMy4yMDg2MS0xLWNzaGFycGVy
MjAwNUBnbWFpbC5jb20vCgo+PiBUaGlzIGlzIGVzc2VudGlhbGx5IHRoZSBzYW1lIGNvZGUgYXMg
cHJvcG9zZWQgYnkgTk9HVUNISSBIaXJvc2hpCj4+IDxkcnZsYWJvQGdtYWlsLmNvbT4gaGVyZToK
PiBJIHdvdWxkIGNyZWRpdCBIaXJvc2hpIHdpdGggYSBTdWdnZXN0ZWQtYnkgYXQgbGVhc3QKCkkg
cmVhZCBzdWJtaXR0aW5nIHBhdGNoZXMgcnVsZXMgYWdhaW4gYW5kIHRob3VnaHQgdGhhdCBTaWdu
ZWQtb2ZmLWJ5IGlzCnN1aXRhYmxlIGZvciB0aGlzIGNhc2UuIElzIHRoaXMgb2s/CgpMaW5rOgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA1MTAxNjI2NTUuMjEwMTEtMS1jc2hhcnBl
cjIwMDVAZ21haWwuY29tLwoKPj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW53cnQvb3BlbndydC9w
dWxsLzEzMTgjaXNzdWVjb21tZW50LTQyMDYwNzM5NAo+IEFuZCB1c2UgYSBMaW5rOiB0YWcgZm9y
IHRoaXMuCj4KRml4ZWQsIHRoYW5rcyEKCkxpbms6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDIyMDUxMDE2MjY1NS4yMTAxMS0xLWNzaGFycGVyMjAwNUBnbWFpbC5jb20vCgo+IFRoYW5r
cywKPiBNaXF1w6hsCi0tIApCZXN0IHJlZ2FyZHMsCk1pa2hhaWwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
