Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F0BC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Mar 2022 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nO/GeGd/kZ60JrN3AH6zryykuBzLjvH8j9ogUtd6/CM=; b=JIcYZquToFKyTmEtJ/+GVPhQSZ
	88Qh74iN6XHpvGu4osL0reBYDT7KcAZm2gn5Av/xg0lH2koocbjkCUs5qGBprKsRkfCu/YNfV/vVR
	9yviuhn4AYpLHrjg5VG8c6fkSVxVtLYnd/YFPTMoPhnHDKKOW87+GYFWHjm4N4t856xqLMq6dxFsJ
	jutGo1yDrlzGzA08QZbi0989/iBwtT93BfYGBhnreAtQLXYJYBkYEZPal8IWSiS3IWDp3R+NWs9Fn
	lMMAJ5hJdFMGIzobKYw1wgxcyld/enSqxqgYcttpYqsPM3wirAhBtHDjAZFOJ+LSr+DSm7mIsM5jJ
	2EVSHfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVDsb-0023BN-WA; Fri, 18 Mar 2022 14:47:02 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVDsH-0022vJ-1T
 for linux-mtd@lists.infradead.org; Fri, 18 Mar 2022 14:46:46 +0000
Received: by mail-lf1-x12b.google.com with SMTP id p14so3137984lfe.4
 for <linux-mtd@lists.infradead.org>; Fri, 18 Mar 2022 07:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:from:to:references
 :in-reply-to:content-transfer-encoding;
 bh=bux2ijkVj3a9jH8jN1ho9JGyNauLfxzBnxzTssSi4BI=;
 b=R4QIyDo6rfMtqEz6VDkt3NmngJzLbF3MSojBNYG4V9Y56N0Ikbm+peTF7q3rkIHAJM
 WPsbCrc9XFOWr542rffBFodsY9ECucE42SUREQSUzy937FJELyHWKA7nnPkIVib6n6E0
 O1JM/K2vOriVT+jFPgkNGgqIjOMEF47Rtwk5WfOAf8QX05j7I4RpgTM2lGBKy8HrYt8d
 eJOskfbvnSEawU9HWfrzzxX5FVbdwupuKD1Pl8zV7rOwTW0tY6ABtaDh1O7D1ukghY8D
 zdZuzAtymLX5SI9WgXjESuSb7h+fz++pswWJzMCBPucIPvUcZx/4c4jcqDYdff7iJEX4
 9BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=bux2ijkVj3a9jH8jN1ho9JGyNauLfxzBnxzTssSi4BI=;
 b=p0KKED5YfM01unnUfmLhhHPolrgaugcwaWOjL03YwA2qvKxAlL215wrjU0XRitf/My
 /I+N13Ai93e5jy1FTZgPCCHq/hWPwJp5IhWIDcgEMFSOv6SxberPgaKbBFo9ICMPasIP
 OUtUANet+j3IfA0HIN3k4y62HTMYBE8XzpyXZDVMaQRUxQStEwgazhYxEWzlbUnfc9vY
 mYZ4TGwiDuYekvQB0kLGxBO1IHvHbXzxQa3Kkv8wdR8LFTlUEF0KeMsY6y1T3HJ8AWn6
 CTIQOECBCxbI6FP91452Z3IW4+kjxJ6dF6d4JKkSjnybF/6H3L9W3dxxt23QJJQRhEa7
 mxbg==
X-Gm-Message-State: AOAM531x/Lz2Uh5HiTqd3WkUFswRiY53Pl+lbBwmI/Ea7CRLqNeagL0N
 72g4OoOhNIc2FKnLQdElPAysclxrr3c=
X-Google-Smtp-Source: ABdhPJxF5VDggSg1krAZVpPT3vQ+QYIsJhPFtUVLRtmzDjZaqQl8hoPKRKcIgqaLb3gXgAD+1Nc9zg==
X-Received: by 2002:ac2:5d6c:0:b0:445:98f6:40d8 with SMTP id
 h12-20020ac25d6c000000b0044598f640d8mr6300470lft.475.1647614798057; 
 Fri, 18 Mar 2022 07:46:38 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a2e8e61000000b00247dd27e05bsm970731ljk.100.2022.03.18.07.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 07:46:37 -0700 (PDT)
Message-ID: <6512b80b-ee21-6da2-a9bf-6b0f83a76102@gmail.com>
Date: Fri, 18 Mar 2022 15:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: Handling ubinized image flashed on not erased flash space
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
References: <bb8bccf4-b5ca-c0a7-22c9-39f9263e2c56@gmail.com>
In-Reply-To: <bb8bccf4-b5ca-c0a7-22c9-39f9263e2c56@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_074641_122611_FCFBD0CB 
X-CRM114-Status: GOOD (  18.89  )
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

T24gMTEuMDMuMjAyMiAxMzowNCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE15IHF1ZXN0aW9u
IGlzOiBob3cgdG8gZG8gdGhhdD8gSSBuZWVkIHRvIGVyYXNlIGZsYXNoIHBhcnRpdGlvbiBzdGFy
dGluZwo+IHdpdGggc29tZSBtaWRkbGUgYmxvY2sgKHRoZSBmaXJzdCBhZnRlciB1YmluaXplZCBp
bWFnZSkuIEkgbmVlZCB0byBnZXQKPiB0aGF0IG9mZnNldCBzb21laG93Lgo+IAo+IEkgKmNhbid0
KiBzY2FuIGJsb2NrIGFmdGVyIGJsb2NrIGxvb2tpbmcgZm9yIHRoZSBmaXJzdCBvbmUgd2l0aG91
dCBhCj4gbWF0Y2hpbmcgRUMgbWFnaWMuIFRoYXQgd291bGRuJ3Qgd29yayB3aXRoIHRoZSBzYW1l
IHViaW5pemVkIGltYWdlCj4gZmxhc2hlZCB0d2ljZS4KPiAKPiBSZWFkaW5nIHZvbHVtZXMgdGFi
bGUsIGVhY2ggdm9sdW1lIHNpemUsIHRyeWluZyB0byBjYWxjdWxhdGUgdWJpbml6ZWQKPiBpbWFn
ZSBzaXplIG9uIHRoYXQgZGF0YSAtIHNvdW5kcyBsaWtlIG92ZXJraWxsIGZvciB1c2VyLXNwYWNl
IGFwcC4KPiAKPiBBbnkgc3VnZ2VzdGlvbnMsIHBsZWFzZT8KCkknZCBsaWtlIHRvIHByb3ZpZGUg
c29tZSBzdW1tYXJ5IGZvciBmdXJ0aGVyIHJlc2VhcmNoZXJzLgoKCkkgaGFkIHNvbWUgZGlzY3Vz
c2lvbiBvbiB0aGlzIHdpdGggUmljaGFyZCBvbiAjbXRkIG9uIFdlZG5lc2RheSBhbmQgaXQKc2Vl
bXMgdGhlcmUgaXNuJ3QgYSByZWxpYWJsZSB3YXkgZm9yIGZpbmRpbmcgZW5kIG9mIHViaW5pemVk
IGltYWdlIG9uCmZsYXNoLgoKSSB3YXMgc3VnZ2VzdGVkIHRvIHVzZSBhIGN1c3RvbSBmbGFzaCBi
bG9jayBhcyBhbiBFT0YgKEVuZCBPZiBVQkk/KQptYXJrZXIuIFRoZW4gZGV0ZWN0IHN1Y2ggYSBt
YXJrZXIgZnJvbSBlaXRoZXI6IHVzZXItc3BhY2Ugb3Iga2VybmVsOgoKWzIwMjItMDMtMTZdIFsx
Mjo1NDozOSBDRVRdIDxkZXJSaWNoYXJkPiBvbmUgbW9yZSB0aGluZzogaSBkb24ndCBoYXZlIGEg
cHJvYmxlbSB3aXRoIGluLWtlcm5lbCBjbGVhbnVwIGNvZGUuIGkgaGF2ZSBhIHByb2JsZW0gd2l0
aCBhIGNoYW5nZWQgdWJpIGRpc2sgZm9ybWF0LgoKU2FkbHkgaXQgc2VlbXMgYSBrZXJuZWwgc29s
dXRpb24gZm9yIHRoZSB3aG9sZSBpc3N1ZSB3b24ndCBnZXQgYWNjZXB0ZWQKYXMgdXBzdHJlYW0g
Y29kZToKClsyMDIyLTAzLTE2XSBbMTQ6Mjc6MDUgQ0VUXSA8cm1pbGVja2k+IGRlclJpY2hhcmQ6
IHlvdSB3cm90ZSAiaSBkb24ndCBoYXZlIGEgcHJvYmxlbSB3aXRoIGluLWtlcm5lbCBjbGVhbnVw
IGNvZGUiClsyMDIyLTAzLTE2XSBbMTQ6Mjc6MTEgQ0VUXSA8cm1pbGVja2k+IGRlclJpY2hhcmQ6
IGRpZCB5b3UgbWVhbiBkb3duc3RyZWFtIG9yIHVwc3RyZWFtPwpbMjAyMi0wMy0xNl0gWzE0OjI3
OjE5IENFVF0gPGRlclJpY2hhcmQ+IGRvd25zdHJlYW0KWzIwMjItMDMtMTZdIFsxNDoyNzozMyBD
RVRdIDxkZXJSaWNoYXJkPiBsb29rLCB3ZSBjYW5ub3QgYWRkIHN1Y2ggaGFja3MgdXBzdHJlYW0K
WzIwMjItMDMtMTZdIFsxNDoyODoxNCBDRVRdIDxybWlsZWNraT4gd2UgYWxzbyBjYW4ndCBmaWd1
cmUgb3V0IGFueSBub24taGFjayB3YXkgdG8gc3VwcG9ydCB0aG9zZSBjYXNlClsyMDIyLTAzLTE2
XSBbMTQ6Mjg6MTYgQ0VUXSA8cm1pbGVja2k+ICpjYXNlcwpbMjAyMi0wMy0xNl0gWzE0OjI4OjI0
IENFVF0gPHJtaWxlY2tpPiB3aGljaCBpcyBkaXNhcHBvaW50aW5nClsyMDIyLTAzLTE2XSBbMTQ6
Mjg6MzYgQ0VUXSA8ZGVyUmljaGFyZD4gc2luY2UgdGhlIGJvb3Rsb2FkZXIgaGF0ZXMgeW91Li4u
CgoKU28gYmFzaWNhbGx5IHdlIGp1c3QgY2lyY2xlZCBiYWNrLiBUaGUgYmVzdCBzb2x1dGlvbiBz
ZWVtcyB0byBiZSB0aGUgb25lCmltcGxlbWVudGVkICYgdXNlZCBpbiBPcGVuV3J0IGZvciBkZWNh
ZGVzLgoKUGVyc29uYWxseSBJJ20gYSBiaXQgZGlzYXBwb2ludGVkLiBJJ2xsIG5lZWQgdG8gY2Fy
cnkgb24gYSB3b3JrYXJvdW5kCmZvciB0aG9zZSBwb29yIGJvb3Rsb2FkZXJzIGluIGV2ZXJ5IHBy
b2plY3QgKE9wZW5XcnQgLyBCdWlsZHJvb3QgLyBZb2N0bwovIHdoYXRldmVyKS4KCkZldyBNVEQg
Z3V5cyBrZXB0IG5hZ2dpbmcgT3BlbldydCBmb3IgaXRzIGRvd25zdHJlYW0gbXRkIGhhY2tzIGJ1
dCBpdAphcHBlYXJzIHRoZXJlIGlzIG5vIGlkZWEgb3IgcGxhY2UgZm9yIGFuIHVwc3RyZWFtIHNv
bHV0aW9uLiBVbmxlc3Mgd2UKcmV2ZXJzZSBlbmdpbmVlciB0aG9zZSBwb29yIGJvb3Rsb2FkZXJz
IGFuZCByZXBsYWNlIHRoZW0gd2l0aCBVLUJvb3QuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
