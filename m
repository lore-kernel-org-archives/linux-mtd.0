Return-Path: <SRS0=RMHD=KJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCB2C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 14 May 2021 11:43:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A50E61458
	for <linux-mtd@archiver.kernel.org>; Fri, 14 May 2021 11:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A50E61458
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvgriSfeHTtC6QpTGNCMgkuaN2IhZiHnanVNl0kM2AM=; b=N0pnCSHERyp2Rr
	PSHdKN/+8QAf8hKmze0ap4z6V5lTtRFUxcgseIyU2g1f2fvUdOyiC2SA23k2iO0q96hpXj+DPNNqv
	WRtC6oHEfJ8t6csMU6JgFfWSkRpZrTJosZ7s+4SxhnN3XbJaGUHWqRRMhb06jNf6vlO9l2aT3POgA
	6LjYfEdknWkhaEPJizOgqbDn03xScT6AHQJsTcpL2OHWBSZTC02fKDPa3sGWSnW9dSlIGhkKf8Y+O
	CNHeVEa1armYY1473QBqo5NThq27oKxyD64qlxVTeDusKgQd5ChUGpYgHmbgQnnmNMYyprtW2mnxJ
	lkmbsXBEj7gt3Qsu/S4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhWCm-007wh1-9G; Fri, 14 May 2021 11:42:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWCk-007wgP-29
 for linux-mtd@desiato.infradead.org; Fri, 14 May 2021 11:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=uBdbEWH3X+scS8Nyxw8OcymFh2SsY7MeUYXlJf//Dp0=; b=VDyrn43VQkqiAdZUct2sNoBlAo
 hiTPVPdbIF+t2BDIftzjw/kBGEsylofFyKG9yd6Pv/wYd6hFk03w6Ak2bCCqVcU9u+CLS5Oh0Gggc
 YwgqRKtb2SMMrmJ4qyMD+964YS0609HNaXCwJ76Xzv8a7ygz4KUMk3U+0FIGC4maCcpOjg9SX2Ckr
 qb/yhuxjn9HBd3+/HhOdodA92h6KFfGWvOrKErMsqh7AuviKUG7ssTE0ggzz43HroXX7e/ePblhwQ
 WUvbXKLdu6XYKDrNV7mql5L3ejLgqWfP+9QkMPhuyvcCMDkXA+o4EYSmhAVDjewzgXskXqK+krwI6
 T5LmgVTg==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWCh-00BwcO-2O
 for linux-mtd@lists.infradead.org; Fri, 14 May 2021 11:42:04 +0000
Received: by mail-ed1-x529.google.com with SMTP id t3so1879814edc.7
 for <linux-mtd@lists.infradead.org>; Fri, 14 May 2021 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=uBdbEWH3X+scS8Nyxw8OcymFh2SsY7MeUYXlJf//Dp0=;
 b=uyQignAYQ7SFA9aPkbXJ3JEYnSw8j8fcGGf6bhERQ+TZfYo+QUhwNme6jUNuJ0pDv+
 64k8yElvjX1YwkdKLD0J04StiU+eyro1gQ5g0qJ5WFmTW/Rz31ztcumVLq6L7N+4mGfF
 e7AESFy0xdo0+dZNZwPmBaQA4Kp/1KqeVJY6vBhpClKkPnk/FelGnJSaDzHcK3jPywo1
 bonmsyFbqW8tyGhu4c/ROyNfcZ/eeUeVps0pgO+9AYpS6H1fkvVkm9jzYfvvDV53oOJy
 n+hPqaDmPYTS4WHKXGYUnqzOWWnsLpnAHYvUf8Ykmoqo7QLIpHCd0+CV8wHZ+LNA3Qtm
 Xj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=uBdbEWH3X+scS8Nyxw8OcymFh2SsY7MeUYXlJf//Dp0=;
 b=TA2AwyTi/X/pVne6STxiOJKvjT6mIyZ/MBENJD09NnhHDt/UXSr+jTNGIpphpi1TBP
 8g9MOK0JFBLUaZspI18XXIaGLMgLTxW9w/RcWrDnqY0xfHPEl9mYG+Y0R5tQG8WI8bX2
 HRqQ7wBVBK/Wv672xpxC/+6L1iFnAVonz3Ow/2NN1Z+50TMrAxEuqeSqN9kJmyK3KSY5
 IXBhG+33OD2wWU5B9/28Bk78p7dcv4rZUS3Eks3vdeFw/oacNpIBqaO1m8sICUST6dii
 zs2vQ393Y5P0vvzGsmupjMxPryXKRrG84FbK7PwCGyD2XMFmcKyOqHMgWh0qBEE+ulxC
 OTfA==
X-Gm-Message-State: AOAM530DNtqJGRYFKlVqCve80CjSCZm/M2ff1n/j613RTFNYu8DrdEev
 rfar52U/HmMJQcYbkgELnNsVtE+ro4yZjIQabjzX4/WiqzY=
X-Google-Smtp-Source: ABdhPJyCPlewuE9q4K/EBnLH4uSKyGTAz+j861NTtHAZ6pFR5ngaIZVxCybE8Ld3FD0BhgKfWNMpEhSvgRm70Tevp60=
X-Received: by 2002:a05:6402:11c7:: with SMTP id
 j7mr56476798edw.129.1620992520957; 
 Fri, 14 May 2021 04:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjgpkBh9dnfNTdDcfk5HiL=HjjiB9o_=fjrm+0vP7Re2Q@mail.gmail.com>
In-Reply-To: <CAOuPNLjgpkBh9dnfNTdDcfk5HiL=HjjiB9o_=fjrm+0vP7Re2Q@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Fri, 14 May 2021 17:11:49 +0530
Message-ID: <CAOuPNLh_0Q9w96GKT-ogC0BBcEHgo=Hv3+c=JBcas2VgqDiyaw@mail.gmail.com>
Subject: Re: Kernel 4.14: SQUASHFS error: unable to read xattr id index table
To: phillip@squashfs.org.uk, linux-fsdevel@kvack.org, 
 open list <linux-kernel@vger.kernel.org>, sean@geanix.com, 
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_044203_134606_BC455828 
X-CRM114-Status: GOOD (  13.06  )
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

SGksCgpUaGlzIGlzIHJlZ2FyZGluZyB0aGUgc3F1YXNoZnMgbW91bnQgZmFpbHVyZSB0aGF0IEkg
YW0gZ2V0dGluZyBvbiBteQpkZXZpY2UgZHVyaW5nIGJvb3QgdGltZS4KSSBqdXN0IHdhbnRlZCB0
byBrbm93IGlmIHNvbWVvbmUgZWxzZSBoYXMgY29tZSBhY3Jvc3MgdGhpcyBpc3N1ZSwgb3IKdGhp
cyBpc3N1ZSBpcyBhbHJlYWR5IGZpeGVkLCBvciB0aGlzIGlzIGFsdG9nZXRoZXIgYSBkaWZmZXJl
bnQgaXNzdWU/CgpIZXJlIGFyZSBtb3JlIGRldGFpbHM6Cktlcm5lbDogNC4xNC4xNzAgOyBRdWFs
Y29tbSBjaGlwc2V0IChhcm0zMiBiaXQpClBsYXRmb3JtOiBidXN5Ym94ClN0b3JhZ2U6IE5BTkQg
NTEyTUIKRmlsZXN5c3RlbTogdWJpZnMgKyBzcXVhc2hmcwp1YmkwIDogd2l0aCA1IHZvbHVtZXMg
KHJvb3RmcywgdXNyZnMsIG90aGVycykKS2VybmVsIGNvbW1hbmQgbGluZTogcm8gcm9vdHdhaXQg
Y29uc29sZT10dHlNU00wLDExNTIwMCxuOApyb290ZnN0eXBlPXNxdWFzaGZzIHJvb3Q9L2Rldi9t
dGRibG9jazM0IHViaS5tdGQ9MzAsMCwzMCAuLi4uCgpCYWNrZ3JvdW5kOgpXZSBhcmUgdXNpbmcg
dWJpZnMgZmlsZXN5c3RlbSB3aXRoIHNxdWFzaGZzIGZvciByb290ZnMgKGFzIHJlYWR5IG9ubHkp
LgpGaXJzdCB3ZSB0cmllZCB0byBmbGFzaCAidXNyZnMiIChkYXRhKSB2b2x1bWUgKHViaTBfMSkg
YW5kIGl0IHdvcmtlZApmaW5lICh3aXRoIGRldmljZSBib290aW5nIHN1Y2Nlc3NmdWxseSkuCgpO
ZXh0IHdlIGFyZSB0cnlpbmcgdG8gZmxhc2ggInJvb3RmcyIgdm9sdW1lICh1YmkwXzApIG5vdy4g
VGhlIHZvbHVtZQpmbGFzaGluZyBpcyBzdWNjZXNzZnVsIGJ1dCBhZnRlciB0aGF0IHdoZW4gd2Ug
cmVib290IHRoZSBzeXN0ZW0gd2UgYXJlCmdldHRpbmcgYmVsb3cgZXJyb3JzLgoKTG9nczoKWy4u
Li5dClsgICAgNC41ODkzNDBdIHZyZWdfY29ubl9wYTogZGlz4paSWyAgICA0LjYwMjc3OV0gc3F1
YXNoZnM6IFNRVUFTSEZTCmVycm9yOiB1bmFibGUgdG8gcmVhZCB4YXR0ciBpZCBpbmRleCB0YWJs
ZQpbLi4uXQpbICAgIDQuOTY0MDgzXSBObyBmaWxlc3lzdGVtIGNvdWxkIG1vdW50IHJvb3QsIHRy
aWVkOgpbICAgIDQuOTY0MDg3XSAgc3F1YXNoZnMKWyAgICA0Ljk2NjI1NV0KWyAgICA0Ljk3MzQ0
M10gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IFZGUzogVW5hYmxlIHRvIG1vdW50IHJvb3QK
ZnMgb24gdW5rbm93bi1ibG9jaygzMSwzNCkKCi0tLS0tLS0tLS0tClsgICAgNC4yNDY4NjFdIHVi
aTA6IGF0dGFjaGluZyBtdGQzMApbICAgIDQuNDUzMjQxXSB1YmkwOiBzY2FubmluZyBpcyBmaW5p
c2hlZApbICAgIDQuNDYwNjU1XSB1YmkwOiBhdHRhY2hlZCBtdGQzMCAobmFtZSAic3lzdGVtIiwg
c2l6ZSAyMTYgTWlCKQpbICAgIDQuNDYwNzA0XSB1YmkwOiBQRUIgc2l6ZTogMjYyMTQ0IGJ5dGVz
ICgyNTYgS2lCKSwgTEVCIHNpemU6IDI1Mzk1MiBieXRlcwpbICAgIDQuNDY1NTYyXSB1YmkwOiBt
aW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6IDQwOTYvNDA5Niwgc3ViLXBhZ2Ugc2l6ZSA0MDk2Clsg
ICAgNC40NzI0ODNdIHViaTA6IFZJRCBoZWFkZXIgb2Zmc2V0OiA0MDk2IChhbGlnbmVkIDQwOTYp
LCBkYXRhIG9mZnNldDogODE5MgpbICAgIDQuNDc5Mjk1XSB1YmkwOiBnb29kIFBFQnM6IDg2NCwg
YmFkIFBFQnM6IDAsIGNvcnJ1cHRlZCBQRUJzOiAwClsgICAgNC40ODYwNjddIHViaTA6IHVzZXIg
dm9sdW1lOiA1LCBpbnRlcm5hbCB2b2x1bWVzOiAxLCBtYXguIHZvbHVtZXMKY291bnQ6IDEyOApb
ICAgIDQuNDkyMzExXSB1YmkwOiBtYXgvbWVhbiBlcmFzZSBjb3VudGVyOiA0LzAsIFdMIHRocmVz
aG9sZDogNDA5NiwKaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyOiAxClsgICAgNC40OTkzMzNdIHViaTA6
IGF2YWlsYWJsZSBQRUJzOiAwLCB0b3RhbCByZXNlcnZlZCBQRUJzOiA4NjQsIFBFQnMKcmVzZXJ2
ZWQgZm9yIGJhZCBQRUIgaGFuZGxpbmc6IDYwCgpTbywgd2UganVzdCB3YW50ZWQgdG8ga25vdyBp
ZiB0aGlzIGlzc3VlIGlzIHJlbGF0ZWQgdG8gc3F1YXNoZnMgb3IgaWYKdGhlcmUgaXMgc29tZSBp
c3N1ZSB3aXRoIG91ciB2b2x1bWUgZmxhc2hpbmcuCk5vdGU6IFdlIGFyZSB1c2luZyBmYXN0Ym9v
dCBtZWNoYW5pc20gdG8gc3VwcG9ydCBVQkkgdm9sdW1lIGZsYXNoaW5nLgoKT2JzZXJ2YXRpb246
ClJlY2VudGx5IEkgaGF2ZSBzZWVuIHNvbWUgc3F1YXNoZnMgY2hhbmdlcyByZWxhdGVkIHRvIHNp
bWlsYXIgaXNzdWVzCih4YXR0cikgc28gSSB3YW50ZWQgdG8gdW5kZXJzdGFuZCBpZiB0aGVzZSBj
aGFuZ2VzIGFyZSByZWxldmFudCB0byBvdXIKaXNzdWUgb3Igbm90ID8KCkFnZSAgICAgICAgICAg
Q29tbWl0IG1lc3NhZ2UoRXhwYW5kKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEF1
dGhvcgoyMDIxLTAzLTMwICAgIHNxdWFzaGZzOiBmaXggeGF0dHIgaWQgYW5kIGlkIGxvb2t1cCBz
YW5pdHkgY2hlY2tzClBoaWxsaXAgTG91Z2hlcgoyMDIxLTAzLTMwICAgIHNxdWFzaGZzOiBmaXgg
aW5vZGUgbG9va3VwIHNhbml0eSBjaGVja3MKU2VhbiBOeWVramFlcgoyMDIxLTAyLTIzICAgIHNx
dWFzaGZzOiBhZGQgbW9yZSBzYW5pdHkgY2hlY2tzIGluIHhhdHRyIGlkIGxvb2t1cApQaGlsbGlw
IExvdWdoZXIKMjAyMS0wMi0yMyAgICBzcXVhc2hmczogYWRkIG1vcmUgc2FuaXR5IGNoZWNrcyBp
biBpbm9kZSBsb29rdXAKUGhpbGxpcCBMb3VnaGVyCjIwMjEtMDItMjMgICAgc3F1YXNoZnM6IGFk
ZCBtb3JlIHNhbml0eSBjaGVja3MgaW4gaWQgbG9va3VwClBoaWxsaXAgTG91Z2hlcgoKUGxlYXNl
IGxldCB1cyBrbm93IHlvdXIgb3BpbmlvbiBhYm91dCB0aGlzIGlzc3VlLi4uCkl0IHdpbGwgaGVs
cCB1cyB0byBkZWNpZGUgd2hldGhlciB0aGUgaXNzdWUgaXMgcmVsYXRlZCB0byBzcXVhc2hmcyAg
b3Igbm90LgoKClRoYW5rcywKUGludHUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
