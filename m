Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20ACC10DCE
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 21:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SbwspjQwX7Wfghd+um46uFzTG+nIvVzZTeocY+JJxY=; b=fiuR6fERnSvFZS
	22vwXWkaLgELDWkSvS8KeNIEGEdk6dgAaHM96T30dCMdh/SzTIscBfIy61A0pf8iGvRjbz+CLhZnZ
	86srKNpgTxyjfo1e+B+EJA61i0bJv6FaW798gAiOASsTHY692noIOyeBT21SgKsWcHAqiwID8jeP6
	3QuvBh+PDsFzj9CO2yMwSRoGdFVzMvpnpeyw4dSPOM5R7b+L39UzGoxqZckfOGJQ9KsENCWdGt21R
	wda1tYtSqHgaWV+igiwTmyKef6wPnH6Vo9zE9vEjXEXZn5sU/clW499CdXMyH4eenTEtw9SuxJg9a
	bs1STZJm1zsqMUlveJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8p1a-00C0CF-0N;
	Thu, 30 Nov 2023 21:56:46 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8p1X-00C0B8-2p
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 21:56:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bca79244fso2060727e87.3
        for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 13:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701381401; x=1701986201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6T1aNAg61no1N+SmbMLx2/9NUrM7fA/7+H0oqRrQdcs=;
        b=YhhHUmq2DAcxq25xs77uuLAjFkKocq9c5rGSM+dxtF2UZrpmhSl+ZpSNP1lb+A2LNr
         6MdU4T2sI1hCOXsh8nX44/tfWRE7xW1OYycDRbwVqX1gxXUdjbj27cmYGu0hSGdkq03f
         p9IZ5I/XU/l2LA3F+lR1b2I5twnPUOEXPPT/2URmf9X3qx3BaVE9ceAJLWiHL06Je6vV
         Qfq4z7tnmZ8omxiiw23+lFpYwqOGMd5r7R2E+WoB6XZVgHHT/+U1KEZ52iFBy8wr3ilE
         q1NbcTn8UOgOfYZFcrkd/LM6jgtH/FbHVjU74Ck/bY+fP8wdONbRFQrV4C+BdU6+bkhU
         B3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381401; x=1701986201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6T1aNAg61no1N+SmbMLx2/9NUrM7fA/7+H0oqRrQdcs=;
        b=LSpC/gjodqzU3XRVVquhpttX19S41LvWxlL5g72dRYXZi9y3i5SdHLq2SgjY/0VSG1
         kFvXM+G2bMGT0s6/eHutnGAxMnH1R8Y8RRuaxHGFTq1uj/LRDpPTBygbJ/15MOwGImTI
         7R/cpdRMAbIvAtGTkg3uWeto6+iGBEBkXF6XSxSWDXs4dzIpbv9yGOSPpwX4U4+LLDvl
         pP0IXuByU1ZzYK3cDyVgbYJWyQmlFKAojK1iSctxu8TFrAZAMxq2148xp5ramWHJRjaq
         ksaOZXn6u6HFHV3FjteyEeoqFG5x4o9hiTVkVndjaXMdd9RsmeTDUsrSL4n44SnuwIvt
         8UFA==
X-Gm-Message-State: AOJu0YwnW0e0fO6GMc5UyEhJttjoIe2gXImNEYoSzQrSG4ci5MeRvWUx
	O6zkXv8cTae3efNLRZDs3XOVRGWhYBayQXmrZus=
X-Google-Smtp-Source: AGHT+IEVwtdg7JQ8s7Tb52T42zDzR3Try5WQnxoiViq2piy8sYPt62uvRMpKPBjnl0BAQUg8z8aMSE7nzuXLXNdmyME=
X-Received: by 2002:a05:6512:3711:b0:50b:c8a9:a65f with SMTP id
 z17-20020a056512371100b0050bc8a9a65fmr121320lfr.6.1701381400616; Thu, 30 Nov
 2023 13:56:40 -0800 (PST)
MIME-Version: 1.0
References: <CAFLxGvxiy9ofrNkfGmu4TvZgdZhdTbZBiK4pDmL8=8kjcPWO2g@mail.gmail.com>
 <ZWRTfaWFzgSfd9_Z@gardel-login> <CAFLxGvwJjhLEgDP73WepEbVmh9qXECaKrsarhp-hg3LMGVBn5Q@mail.gmail.com>
 <ZWb6vp7K5tx9Lx2s@gardel-login>
In-Reply-To: <ZWb6vp7K5tx9Lx2s@gardel-login>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 30 Nov 2023 22:56:27 +0100
Message-ID: <CAFLxGvy3j6sZ1CsctkJ2h8XwbC5CytG8Lka+Pmfu7eUjciBEvQ@mail.gmail.com>
Subject: Re: [systemd-devel] How to properly wait for udev?
To: Lennart Poettering <lennart@poettering.net>
Cc: systemd-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, 
	dxld@darkboxed.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_135643_918887_2CBFE8D3 
X-CRM114-Status: GOOD (  16.09  )
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

T24gV2VkLCBOb3YgMjksIDIwMjMgYXQgOTo0OOKAr0FNIExlbm5hcnQgUG9ldHRlcmluZwo8bGVu
bmFydEBwb2V0dGVyaW5nLm5ldD4gd3JvdGU6Cj4gPiBXaHkgZG9lc24ndCB1ZGV2IGZsb2NrKCkg
ZXZlcnkgZGV2aWNlIGl0IGlzIHByb2Jpbmc/Cj4gPiBPciBhc2tlZCBkaWZmZXJlbnRseSwgd2h5
IGlzIHRoaXMgZmVhdHVyZSBvcHQtaW4gaW5zdGVhZCBvZiBvcHQtb3V0Pwo+Cj4gU29tZSBzb2Z0
d2FyZSByZWFsbHkgZG9lc24ndCBsaWtlIGl0IGlmIHdlIHRha2UgQlNEIGxvY2tzIG9uIHRoZWly
Cj4gZGV2aWNlcywgaGVuY2Ugd2UgZG9uJ3QgdGFrZSBpdCBibGFua2V0IGV2ZXJ5d2hlcmUuIEFu
ZCB3aGF0J3MgbW9yZQo+IGltcG9ydGFudCBldmVuOiBmb3IgdmFyaW91cyBkZXZpY2VzIGl0IHNp
bXBseSBpc24ndCBzYWZlIHRvIGp1c3QKPiB3aWxseS1uaWxseSBldmVuIG9wZW4gdGhlbSAodGFw
ZSBkcml2ZXJzIGFuZCB0aGluZ3MsIHdoaWNoIG1pZ2h0IHN0YXJ0Cj4gdG8gcHVsbCBpbiBhIHRh
cGUgaWYgd2UgZG8pLiBGb3Igb3RoZXJzIHdlIG1pZ2h0IG5vdCBiZSBhYmxlIHRvIGV2ZW4KPiBv
cGVuIHRoaW5nIGF0IGFsbCB3aXRoIHRoZSB3cm9uZyBmbGFncyAoZm9yIGV4YW1wbGUsIGJlY2F1
c2UgdGhleSBhcmUKPiBvdXRwdXQgb25seSkuCj4KPiBCb2NrIGRldmljZXMgaGF2ZSByZWxhdGl2
ZWx5IHdlbGwgZGVmaW5lZCBzZW1hbnRpY3MsIHRoZXJlIGl0J3MKPiBnZW5lcmFsbHkgc2FmZSB0
byBkbyB0aGlzLCBoZW5jZSB3ZSBkby4KCkkgc2VlLgoKPiBIZW5jZSwgaXQgbWlnaHQgYmUgc2Fm
ZSBmb3IgVUJJLCBidXQgZm9yIHRoZSBnZW5lcmFsIGNhc2UgaXQgbWlnaHQKPiBub3QgYmUuCj4K
PiBUaGF0IHNhaWQsIHdvdWxkIEJTRCBsb2NraW5nIGV2ZW4gYWRkcmVzcyB5b3VyIGlzc3VlPyBJ
ZiB5b3UgZGV2aWNlcwo+IGFyZSBleGNsdXNpdmUgYWNjZXNzIHRoaW5ncyBhbmQgd2UgZmlyc3Qg
b3BlbigpIHRoZW0gYW5kIHRoZW4gZmxvY2soKQo+IHRoZW0sIHRoZW4gdGhhdCdzIG5vdCBhdG9t
aWMuIFNvIGlmIHlvdXIgdGVzdCBjYXNlcyBvcGVuIHRoZSBkZXZpY2VzLAo+IHRoZW4gZmxvY2so
KSB0aGVtIHlvdSBtaWdodCBzdGlsbCBnZXQgaW50byBjb25mbGljdCB1ZGV2IGJlY2F1c2UgaXQK
PiBqdXN0IG9wZW4oKWVkIHRoZSBkZXZpY2UsIGJ1dCBkaWRuI3QgZ2V0IHRvIGNhbGwgZmxvY2so
KSB5ZXQuCj4KPiBEb2Vzbid0IFVCSSBoYXZlIHNvbWV0aGluZyBsaWtlIE9fRVhDTC1iZWhhdmlv
dXIgdGhhdCBncmFudHMgdHJ1ZQo+IGV4Y2x1c2l2ZSBhY2Nlc3M/CgpJdCBoYXMgaW4ta2VybmVs
IHN1cHBvcnQgZm9yIHRoYXQgYnV0IG5vdCBmcm9tIHVzZXJzcGFjZSwgSSdtCmN1cnJlbnRseSBl
dmFsdWF0aW5nCndoZXRoZXIgaXQncyB3b3J0aCBleHBvc2luZyBleGNsdXNpdmUgYWNjZXNzIHRv
IHVzZXJzcGFjZS4KClN0YXkgdHVuZWQuIDotKQoKLS0gClRoYW5rcywKLy9yaWNoYXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
