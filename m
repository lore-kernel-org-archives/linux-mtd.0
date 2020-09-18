Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7CAC43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 18:56:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C791206D4
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 18:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HH8npHfn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYt7LzIc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C791206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nKaDPYy1Pw6f0m9CK71oluQyTjq+hymVliL0ynvZh8s=; b=HH8npHfnWSNC5oySvorUNkpgG
	7dRGLMYz917bDQOc2fmhvvRWT/i5WvKxVShFhlDH05eZAhkbnDEbctBIQ5hV5/NwIv1DRndCurvkZ
	cgFv37rneMcN1A6OEKs3Ll3136ywyxOE9c/kETD3XUsPZtG6xDovK8nndBehoTE82nZOWx1OPz53i
	PP4QMxLK3wcSX6hiYVsd+gmbJykXhFlwHssOq/IOf6h0yt740DqIlQFMuzTnVinWucRd3SOFQSCPJ
	9Uj7U/ytAChPyn1XzmB0GmbIHrLQxhrGp/IKDDQJqzfcKjYUXRQq6C14gIeQCdP7Tn1ErLyTyeJy2
	0BEPodg8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJLXm-0008Az-Th; Fri, 18 Sep 2020 18:55:38 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJLXk-0008AH-B9; Fri, 18 Sep 2020 18:55:37 +0000
Received: by mail-ej1-x641.google.com with SMTP id z23so9393358ejr.13;
 Fri, 18 Sep 2020 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WNM04UE29uKK3wuddyaGzKe7MOJATBofLHcEB320/PU=;
 b=kYt7LzIcrvpwqmMbdRI4hVqkpGAD7KxGijYF6mTQ3/5ONN12qgv/k5ziY2mQdb+SeP
 KNPx1Y/ZVFNZmI2GTqg72XriWkAleHufZsVYNQKU7LFwNFeTh9r7QrEhoWMdbnhUL68U
 4fbU0Ok6TdApx4BqA+EcEgZnceEYdFgHPcF32rDsfai2DnCUvTWcAaPrKrGr90/uqIHx
 BGX4f8MFP4WS1LoB1WW0pUONRCPzbPcvTk2IVhYdMPt6DTpVwaz5A+DD5RslYI7dusGB
 GOFbFLZjf5ueQmvs8M/LO9yIW04SriR7hlArvhBLSJxG3ELdHuFMWlYMGKKJSubN+fDw
 1G6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WNM04UE29uKK3wuddyaGzKe7MOJATBofLHcEB320/PU=;
 b=La5sx/54avM+C//W8yDdSPgYZncshDlwbI/7ENSvyxIkfw3fA80u9ICKcjNpD4AptE
 zheEKM1zq70ASDUuHQNxGUZmZLglGXvQmceEA4Ee7/jgNWknJxj498tAD8Ep0bC+PVl3
 woacOUhj6OzY8cMux2eDFMc2rpSZ2ynzn161qo3+b0HZoGjZfkwdF7OVXeUFhp70Q+GB
 cP5/62iNbHSICg8s64OZJQtITg1W1IbaGCgaaczYe08vKlkWbCKjUjzKE38B8UJbQuTo
 7VIVy/CVeBsrcPcE943sWtrSWCLwLx+AnVIXIMNChu+icddyZNEzDy1pFlEHOIcim0af
 wbIQ==
X-Gm-Message-State: AOAM532e+KKVDD5ZuP9cK40vftUE651xJ0RG9VkhEhrpD1JDTNXlO/LN
 nOswVJu39tmLMiSnMmOdHUo=
X-Google-Smtp-Source: ABdhPJw6Je8MyCyx1IKpKToYRbax3WHJephEh6KetCjzQlLc6TjZ+XzB332+bwWysX/YLfSGb3jebA==
X-Received: by 2002:a17:906:4d97:: with SMTP id
 s23mr38635830eju.157.1600455335218; 
 Fri, 18 Sep 2020 11:55:35 -0700 (PDT)
Received: from debian64.daheim (p5b0d776c.dip0.t-ipconnect.de. [91.13.119.108])
 by smtp.gmail.com with ESMTPSA id e15sm2728253eds.5.2020.09.18.11.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 11:55:34 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1kJLXZ-002oKt-Oq; Fri, 18 Sep 2020 20:55:30 +0200
Subject: Re: R: [PATCH 2/2] dt: bindings: ath10k: Document qcom,
 ath10k-pre-calibration-data-mtd
To: ansuelsmth@gmail.com, 'Kalle Valo' <kvalo@codeaurora.org>
References: <20200918162928.14335-1-ansuelsmth@gmail.com>
 <20200918162928.14335-2-ansuelsmth@gmail.com>
 <8f886e3d-e2ee-cbf8-a676-28ebed4977aa@gmail.com>
 <000001d68de9$e7916450$b6b42cf0$@gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <ea0efd8f-6dd4-8b46-caeb-d49240882cb2@gmail.com>
Date: Fri, 18 Sep 2020 20:55:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <000001d68de9$e7916450$b6b42cf0$@gmail.com>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_145536_416960_8975779C 
X-CRM114-Status: GOOD (  19.68  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, 'Bartosz Golaszewski' <bgolaszewski@baylibre.com>,
 'Srinivas Kandagatla' <srinivas.kandagatla@linaro.org>,
 'Rob Herring' <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 'Jakub Kicinski' <kuba@kernel.org>, "'David S. Miller'" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0wOS0xOCAyMDozMSwgYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGU6Cj4gCj4gCj4+
IC0tLS0tTWVzc2FnZ2lvIG9yaWdpbmFsZS0tLS0tCj4+IERhOiBDaHJpc3RpYW4gTGFtcGFydGVy
IDxjaHVua2VleUBnbWFpbC5jb20+Cj4+IEludmlhdG86IHZlbmVyZMOsIDE4IHNldHRlbWJyZSAy
MDIwIDE4OjU0Cj4+IEE6IEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+OyBLYWxs
ZSBWYWxvCj4+IDxrdmFsb0Bjb2RlYXVyb3JhLm9yZz4KPj4gQ2M6IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC0KPj4gd2lyZWxlc3NAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOwo+PiBhdGgxMGtAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0Pjsg
Um9iCj4+IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEpha3ViIEtpY2luc2tpIDxrdWJh
QGtlcm5lbC5vcmc+OyBsaW51eC0KPj4gbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IFNyaW5pdmFz
IEthbmRhZ2F0bGEKPj4gPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz47IEJhcnRvc3og
R29sYXN6ZXdza2kKPj4gPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4+IE9nZ2V0dG86IFJl
OiBbUEFUQ0ggMi8yXSBkdDogYmluZGluZ3M6IGF0aDEwazogRG9jdW1lbnQgcWNvbSwgYXRoMTBr
LQo+PiBwcmUtY2FsaWJyYXRpb24tZGF0YS1tdGQKPj4KPj4gT24gMjAyMC0wOS0xOCAxODoyOSwg
QW5zdWVsIFNtaXRoIHdyb3RlOgo+Pj4gRG9jdW1lbnQgdXNlIG9mIHFjb20sYXRoMTBrLXByZS1j
YWxpYnJhdGlvbi1kYXRhLW10ZCBiaW5kaW5ncyB1c2VkIHRvCj4+PiBkZWZpbmUgZnJvbSB3aGVy
ZSB0aGUgZHJpdmVyIHdpbGwgbG9hZCB0aGUgcHJlLWNhbCBkYXRhIGluIHRoZSBkZWZpbmVkCj4+
PiBtdGQgcGFydGl0aW9uLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuc3VlbCBTbWl0aCA8YW5z
dWVsc210aEBnbWFpbC5jb20+Cj4+Cj4+IFE6IERvZXNuJ3QgbXRkIG5vdyBjb21lIHdpdGggbnZt
ZW0gc3VwcG9ydCBmcm9tIHRoZSBnZXQgZ28/IFNvCj4+IHRoZSBNQUMtQWRkcmVzc2VzIGFuZCBw
cmUtY2FsZGF0YSBjb3VsZCBiZSBzcGVjaWZpZWQgYXMgYQo+PiBudm1lbS1ub2RlIGluIHRoZSBk
ZXZpY2V0cmVlPyBJIHJlbWVtYmVyIHNlZWluZyB0aGF0IHRoaXMgd2FzCj4+IHdvcmtlZCBvbiBv
ciB3YXMgdGhpcyBtdGQtPm52bWVtIGRyb3BwZWQ/Cj4+Cj4+IENoZWVycywKPj4gQ2hyaXN0aWFu
Cj4gCj4gU29ycnkgYSBsb3QgZm9yIHRoZSBkb3VibGUgZW1haWwuLi4gSSB0aGluayBJIGZvdW5k
IHdoYXQgeW91IGFyZSB0YWxraW5nIGFib3V0Lgo+IEl0IGxvb2tzIGxpa2UgdGhlIGNvZGUgd2Fz
IG1lcmdlZCBidXQgbm90IHRoZSBkb2N1bWVudGF0aW9uLgo+IFdpbGwgZG8gc29tZSB0ZXN0IGFu
ZCBjaGVjayBpZiB0aGlzIHdvcmtzLgo+IAo+IFRoaXMgc2hvdWxkIGJlIHRoZSByZWxhdGVkIHBh
dGNoLgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvcGF0
Y2gvMTUyMTkzMzg5OS0zNjItNC1naXQtc2VuZC1lbWFpbC1hbGJldUBmcmVlLmZyLwo+IAoKV2Vs
bCwgSSBndWVzcyB0aGUgdmVyc2lvbiB0aGF0IHdhcyBtZXJnZWQ6Cgp8Y29tbWl0IGM0ZGZhMjVh
YjMwN2EyNzdlYWZhNzA2N2NkOTI3ZmJlNGQ5YmU0YmEKfEF1dGhvcjogQWxiYW4gQmVkZWwgPGFs
YmV1QGZyZWUuZnI+CnxEYXRlOiAgIFR1ZSBOb3YgMTMgMTU6MDE6MTAgMjAxOCArMDEwMAp8Cnwg
ICAgbXRkOiBhZGQgc3VwcG9ydCBmb3IgcmVhZGluZyBNVEQgZGV2aWNlcyB2aWEgdGhlIG52bWVt
IEFQSQp8CnwgICAgQWxsb3cgZHJpdmVycyB0aGF0IHVzZSB0aGUgbnZtZW0gQVBJIHRvIHJlYWQg
ZGF0YSBzdG9yZWQgb24gTVREIGRldmljZXMuCnwgICAgRm9yIHRoaXMgdGhlIG10ZCBkZXZpY2Vz
IGFyZSByZWdpc3RlcmVkIGFzIHJlYWQtb25seSBOVk1FTSBwcm92aWRlcnMuCnwKfCA+Pj5XZSBk
b24ndCBzdXBwb3J0IGRldmljZSB0cmVlIHN5c3RlbXMgZm9yIG5vdy48PDwKCmFuc3dlcnMgdGhp
cy4gU29ycnkgZm9yIHRoZSBub2lzZS4gWWVlLCB0aGlzIGxpa2VseSBpc24ndCBnb2luZyB0byB3
b3JrCmFzIGl0IGlzIHN0aWxsIGRpc2FibGVkIG9uIHB1cnBvc2UuCgpSZWdhcmRzLApDaHJpc3Rp
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
