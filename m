Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D316C47088
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x2/Pqsx5jUGSakNMo880ssg/QzIeh/pL1hfwZokIZMY=; b=U3mjziGOxtY59rycqgF3ZII+dY
	mTRFqCCyhSgXbyz0zWMwk1CWKesUFLI//33VIjW739LQRSrrz+YvOz19dgzs9yYKM3HOqHij27XLT
	aQjVFdDK/foDszD/rDghfGIP5/Nk1Vo4MUfZ5tGYUmTGCxy7HBYoj1sh81UDtdGc8yhzyzzWQ6EDo
	IUBvvPVnJV9Mc3Tu3GC6YP4CQJ+TuHxPollIzRPFXmn8yQPthxshepgzqCaExyePaSJtSgm/G0qje
	4CKiyh6m+Uqo9Wgm3Es6SQkNIKqO8Pr2BtIQPuMLEnWA4rzNzRB4gwh7wICIXZPiZUSOaQDcp5unX
	L59U93Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14xv-00GGS5-GS; Fri, 02 Dec 2022 12:16:27 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14xs-00GGQT-GU
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2022 12:16:26 +0000
Received: by mail-ed1-x536.google.com with SMTP id v8so6266340edi.3
        for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2022 04:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAcaE5r0DfWUfYcmzJrcHnrt0PL11rV6fil7GAWAGds=;
        b=GP8FT44lW+X+sg7sDa8bN+96pb2QkXH2/YaaI/8XzGKfPAS2i+9WAX/hRp2yhRzikG
         D+0vu+c4Z2oq163Cswc6hTbrFj5ZhaYeNKxMAtF6pN3NXLbSRly5u924Ac70xA4x9onO
         6o+UrrDgoKRYK5xYTuCWAwjUhUACmAzEmco0McpaSHHtGqIQ/tHy3moXeuNs1g/cfzuZ
         aJGKH4VjSu59n6KQkSzM1Q6miwJFkCdJEAHrwDHZWj8OLgGFbSS3AruwkUZ1ljbACi3w
         9FnRh7XpYblZDcmjGmKteZH1WUoS/NCMBXnZwUl5CdJrRoPRY2s4g6otBbUlL15ZR0LI
         DRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hAcaE5r0DfWUfYcmzJrcHnrt0PL11rV6fil7GAWAGds=;
        b=dbJARgDq0gFFkKFEfNEUyRwzPcSeK5uvxXC1Ly0M3mH7XFKbMjO77cSLswpjn8ijUw
         /6fOtVflZFERR7qv4myMrBuitf+7RvwkLFojV0duq+IGwLUEyF/IwQ3Pda7ZKQNM2s5i
         X+WoKZ5tiovDXIUi6jCq2M0bVvu43QFYolzV1GNxSTqZBPm0q3Rlzapr0dkLBuU4LM62
         s9J8kQEddTtbnafpmC5lZArnL/8PD+jIE4uh1EgeP9AkYK6nTAms2fVtCk81Lg1HJkPf
         x+0n1quqfuPe23j4Bl89BVtNVkXDuVkClUYdXzODwwVw8gyg6uI2xbcCR38p5f7WsqZC
         zdyw==
X-Gm-Message-State: ANoB5pkUtJPPWSVAAZ3xmGlk7s5PuhY45dZ3H2hMzo7r/Xw1TXYH3k00
	YCjTVx3Wd7Xcx3hUYjvzrmKJQicrL43PNIPRv90=
X-Google-Smtp-Source: AA0mqf5z4G9PzmXp9vjQ5sJ+4zjg2gviVP46FfA8PhG6Dt9tXTnjosvahZjW2n+xFhXLmum+TJC/ag==
X-Received: by 2002:a05:6402:43c7:b0:468:cd3a:4493 with SMTP id p7-20020a05640243c700b00468cd3a4493mr64681667edc.309.1669983381680;
        Fri, 02 Dec 2022 04:16:21 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.55])
        by smtp.gmail.com with ESMTPSA id h18-20020a170906829200b007c0bcfe6ebbsm1106465ejx.99.2022.12.02.04.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 04:16:21 -0800 (PST)
Message-ID: <de60f4e6-e663-413c-171e-88ed8285d876@linaro.org>
Date: Fri, 2 Dec 2022 14:16:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: richard@nod.at, miquel.raynal@bootlin.com
Cc: pratyush@kernel.org, vigneshr@ti.com, michael@walle.cc,
 linux-mtd@lists.infradead.org
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [GIT PULL] mtd: spi-nor: Changes for 6.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_041624_601664_81EBA8F5 
X-CRM114-Status: GOOD (  14.79  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIFJpY2hhcmQsCgpZb3UnbGwgaGF2ZSB0byBkbyBhIHNtYWxsIG1hbnVhbCBtZXJnZSBhcyBp
bmRpY2F0ZWQgYnkgU3RlcGhlbiBhdDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbmV4
dC8yMDIyMTExODEyMDcyNi42YzQxMDkzOUBjYW5iLmF1dWcub3JnLmF1LwoKVGhhbmtzLAp0YQoK
VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAyNDdmMzRmN2I4MDM1Nzk0MzIzNGY5
M2YyNDdhMWFlNmI2YzNhNzQwOgoKICAgTGludXggNi4xLXJjMiAoMjAyMi0xMC0yMyAxNToyNzoz
MyAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICAgZ2l0
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQg
CnRhZ3Mvc3BpLW5vci9mb3ItNi4yCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMTc5
OWNkODU0MGI2N2I4ODUxNGM4MmY1ZmFlMWM3NWI5ODZiY2JkODoKCiAgIG10ZDogc3BpLW5vcjog
YWRkIFNGRFAgZml4dXBzIGZvciBRdWFkIFBhZ2UgUHJvZ3JhbSAoMjAyMi0xMS0yMiAKMDg6MTk6
MDEgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tClNQSSBOT1IgY29yZSBjaGFuZ2VzOgoqIEFkZCBzdXBwb3J0IGZv
ciBmbGFzaCByZXNldCB1c2luZyB0aGUgZHQgcmVzZXQtZ3Bpb3MgcHJvcGVydHkuCiogVXBkYXRl
IGh3Y2Fwcy5tYXNrIHRvIGluY2x1ZGUgOEQtOEQtOEQgcmVhZCBhbmQgcGFnZSBwcm9ncmFtIG9w
cwogICB3aGVuIHhTUEkgcHJvZmlsZSAxLjAgdGFibGUgaXMgZGVmaW5lZC4KKiBCeXBhc3MgemVy
byBlcmFzZSBzaXplIGluIHNwaV9ub3JfZmluZF9iZXN0X2VyYXNlX3R5cGUoKS4KKiBGaXggc2Vs
ZWN0X3VuaWZvcm1fZXJhc2UgdG8gc2tpcCAwIGVyYXNlIHNpemUKKiBBZGQgZ2VuZXJpYyBmbGFz
aCBkcml2ZXIuIElmIGEgZmxhc2ggaXMgbm90IGZvdW5kIGluIHRoZSBmbGFzaF9pbmZvCiAgIGFy
cmF5LCBmYWxsIGJhY2sgdG8gdGhlIGdlbmVyaWMgZmxhc2ggZHJpdmVyIHdoaWNoIGlzIGRlc2Ny
aWJlZCBzb2xlbHkKICAgYnkgdGhlIGZsYXNoJ3MgU0ZEUCB0YWJsZXMuCiogRml4IHRoZSBudW1i
ZXIgb2YgYnl0ZXMgZm9yIHRoZSBkdW1teSBjeWNsZXMgaW4KICAgc3BpX25vcl9zcGltZW1fY2hl
Y2tfcmVhZG9wKCkuCiogSW50cm9kdWNlIFNQSV9OT1JfUVVBRF9QUCBmbGFnLCBhcyBQUF8xXzFf
NCBpcyBub3QgU0ZEUCBkaXNjb3ZlcmFibGUuCgpTUEkgTk9SIG1hbnVmYWN0dXJlciBkcml2ZXJz
IGNoYW5nZXM6CiogU3BhbnNpb246CiAgIC0gdXNlIFBBUlNFX1NGRFAgZm9yIHMyOGhzNTEydCwK
ICAgLSBhZGQgc3VwcG9ydCBmb3IgczI4aGw1MTJ0LCBzMjhobDAxZ3QsIGFuZCBzMjhoczAxZ3Qu
CiogR2lnYWRldmljZTogUmVwbGFjZSBkZWZhdWx0X2luaXQoKSB3aXRoIHBvc3RfYmZwdCgpIGZv
ciBnZDI1cTI1Ni4KKiBNaWNyb24gLSBTVDogRW5hYmxlIGxvY2tpbmcgZm9yIG10MjVxdTI1NmEu
CiogV2luYm9uZDogQWRkIHN1cHBvcnQgZm9yIFcyNVE1MTJOVy1JUS4KKiBJU1NJOiBVc2UgUEFS
U0VfU0ZEUCBhbmQgU1BJX05PUl9RVUFEX1BQLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbGV4YW5kZXIgU3ZlcmRsaW4g
KDEpOgogICAgICAgbXRkOiBzcGktbm9yOiBDaGVjayBmb3IgemVybyBlcmFzZSBzaXplIGluIApz
cGlfbm9yX2ZpbmRfYmVzdF9lcmFzZV90eXBlKCkKCkFsbGVuLUtIIENoZW5nICgxKToKICAgICAg
IG10ZDogc3BpLW5vcjogRml4IHRoZSBudW1iZXIgb2YgYnl0ZXMgZm9yIHRoZSBkdW1teSBjeWNs
ZXMKCkVsaWF2IEZhcmJlciAoMSk6CiAgICAgICBtdGQ6IHNwaS1ub3I6IG1pY3Jvbi1zdDogRW5h
YmxlIGxvY2tpbmcgZm9yIG10MjVxdTI1NmEKCkphZSBIeXVuIFlvbyAoMSk6CiAgICAgICBtdGQ6
IHNwaS1ub3I6IHdpbmJvbmQ6IGFkZCBzdXBwb3J0IGZvciBXMjVRNTEyTlctSVEKCkpvbmF0aGFu
IE5ldXNjaMOkZmVyICgxKToKICAgICAgIG10ZDogc3BpLW5vcjogRml4IGZvcm1hdHRpbmcgaW4g
c3BpX25vcl9yZWFkX3JhdygpIGtlcm5lbGRvYyBjb21tZW50CgpNaWNoYWVsIFdhbGxlICg3KToK
ICAgICAgIG10ZDogc3BpLW5vcjogaGlkZSBqZWRlY19pZCBzeXNmcyBhdHRyaWJ1dGUgaWYgbm90
IHByZXNlbnQKICAgICAgIG10ZDogc3BpLW5vcjogc3lzZnM6IGhpZGUgbWFudWZhY3R1cmVyIGlm
IGl0IGlzIG5vdCBzZXQKICAgICAgIG10ZDogc3BpLW5vcjogcmVtZW1iZXIgZnVsbCBKRURFQyBm
bGFzaCBJRAogICAgICAgbXRkOiBzcGktbm9yOiBtb3ZlIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIG91
dCBvZiBzZmRwLmgKICAgICAgIG10ZDogc3BpLW5vcjogZml4IHNlbGVjdF91bmlmb3JtX2VyYXNl
IHRvIHNraXAgMCBlcmFzZSBzaXplCiAgICAgICBtdGQ6IHNwaS1ub3I6IGFkZCBnZW5lcmljIGZs
YXNoIGRyaXZlcgogICAgICAgbXRkOiBzcGktbm9yOiBzeXNmczogcHJpbnQgSkVERUMgSUQgZm9y
IGdlbmVyaWMgZmxhc2ggZHJpdmVyCgpTYWkgS3Jpc2huYSBQb3R0aHVyaSAoMik6CiAgICAgICBk
dC1iaW5kaW5nczogbXRkOiBzcGktbm9yOiBBZGQgcmVzZXQtZ3Bpb3MgcHJvcGVydHkKICAgICAg
IG10ZDogc3BpLW5vcjogQWRkIHN1cHBvcnQgZm9yIGZsYXNoIHJlc2V0CgpTdWRpcCBNdWtoZXJq
ZWUgKDIpOgogICAgICAgbXRkOiBzcGktbm9yOiBpc3NpOiBpczI1d3AyNTY6IEluaXQgZmxhc2gg
YmFzZWQgb24gU0ZEUAogICAgICAgbXRkOiBzcGktbm9yOiBhZGQgU0ZEUCBmaXh1cHMgZm9yIFF1
YWQgUGFnZSBQcm9ncmFtCgpUYWthaGlybyBLdXdhbm8gKDQpOgogICAgICAgbXRkOiBzcGktbm9y
OiBzZmRwOiBVcGRhdGUgcGFyYW1zLT5od2NhcHMubWFzayBhdCB4U1BJIHByb2ZpbGUgCjEuMCB0
YWJsZSBwYXJzZQogICAgICAgbXRkOiBzcGktbm9yOiBzcGFuc2lvbjogUmVtb3ZlIE5PX1NGRFBf
RkxBR1MgZnJvbSBzMjhoczUxMnQgaW5mbwogICAgICAgbXRkOiBzcGktbm9yOiBzcGFuc2lvbjog
UmVuYW1lIHMyOGhzNTEydCBwcmVmaXgKICAgICAgIG10ZDogc3BpLW5vcjogc3BhbnNpb246IEFk
ZCBzMjhobDUxMnQsIHMyOGhsMDFndCwgYW5kIHMyOGhzMDFndCBpbmZvCgpUdWRvciBBbWJhcnVz
ICgzKToKICAgICAgIG10ZDogc3BpLW5vcjogc3BhbnNpb246IFJlcGxhY2UgaGFyZGNvZGVkIHZh
bHVlcyBmb3IgCmFkZHJfbmJ5dGVzL2FkZHJfbW9kZV9uYnl0ZXMKICAgICAgIG10ZDogc3BpLW5v
cjogbWljcm9uLXN0LmM6IFJlcGxhY2UgaGFyZGNvZGVkIHZhbHVlcyBmb3IgCmFkZHJfbmJ5dGVz
L2FkZHJfbW9kZV9uYnl0ZXMKICAgICAgIG10ZDogc3BpLW5vcjogY29yZTogQWRkIGFuIGVycm9y
IG1lc3NhZ2Ugd2hlbiBmYWlsaW5nIHRvIGV4aXQgdGhlIAo0LWJ5dGUgYWRkcmVzcyBtb2RlCgpZ
YWxpYW5nIFdhbmcgKDEpOgogICAgICAgbXRkOiBzcGktbm9yOiBnaWdhZGV2aWNlOiBnZDI1cTI1
NjogcmVwbGFjZSBnZDI1cTI1Nl9kZWZhdWx0X2luaXQgCndpdGggZ2QyNXEyNTZfcG9zdF9iZnB0
CgogIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtYnVzLXNwaS1kZXZpY2VzLXNwaS1u
b3IgIHwgIDYgKysrCiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRl
YyxzcGktbm9yLnlhbWwgfCAgOCArKysrCiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA4NSAKKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tCiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNSArKysKICBkcml2ZXJzL210ZC9zcGktbm9yL2RlYnVnZnMuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAgZHJpdmVycy9tdGQvc3BpLW5vci9n
aWdhZGV2aWNlLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAyNCArKysrKysrLS0tCiAgZHJp
dmVycy9tdGQvc3BpLW5vci9pc3NpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NSArKy0KICBkcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDEyICsrKy0tCiAgZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAzNyAKKysrKysrKysrKysrKysrLQogIGRyaXZlcnMvbXRk
L3NwaS1ub3Ivc2ZkcC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgLQogIGRy
aXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
NjEgCisrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAgZHJpdmVycy9tdGQvc3BpLW5vci9zeXNm
cy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrKysrKy0KICBkcml2ZXJz
L210ZC9zcGktbm9yL3dpbmJvbmQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsr
CiAgaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMyArKwogIDE0IGZpbGVzIGNoYW5nZWQsIDIyOCBpbnNlcnRpb25zKCspLCA0NSBkZWxl
dGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
