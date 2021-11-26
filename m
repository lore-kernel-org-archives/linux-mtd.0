Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401BBC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qo9IdkxhGDqGenwF24ojL2wqt7O5L3w5HWOXajN01QQ=; b=zZrDdE0+CwgKcE
	4dkotlRtqGvZS1BwAiH9t/jmo+bs97gEQv9HmaIDs188+E5UXUdi+LM/j1fVaymN7JhVWOrcjt64O
	Mc8Vql5PDOwn+eMu+o60Yh8OuSzaJabdUd64Cpw5j2zi9lUL4ZgHsnCvT/F1+hQ6BbIQbr0wa8vH8
	1Xd4YrvXMXG56ccUvu2X7/ngbGEasvW8CICwe7RUxvDWBADZ+QBasuXo6kYpICOFfTVTsupt6hpfR
	ush92pdsBhT/cMwkOSbaHICHZakEFcBPgtFZePi0imqGCcg5DZLlFoqmaOh5JAomWd1/hjZtO8fDC
	sDlDYVjsDTi3dcXW5MzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqasG-00AWeC-M4; Fri, 26 Nov 2021 13:02:44 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqasC-00AWdM-UE
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 13:02:42 +0000
Received: by mail-lj1-x234.google.com with SMTP id j18so5431409ljc.12
 for <linux-mtd@lists.infradead.org>; Fri, 26 Nov 2021 05:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kempniu.pl; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TXOwpLv7KDX/kwKg8NXTBcWSQI5gKaFisLYfaSk/F6g=;
 b=SUdbpVmqbbzQ7GMGk5ybLBcdUOA8DYSC2v6K5Tuaxkogxu2DNLA4ClyRinwEuhHJAJ
 mctyH3gQW+gUfkKjDY2mFEhquFNAmjYC60OhMIAOsh921be6Z0RZaak/Ilanf1igyEhX
 nwNb/g+aGgtFVtjXE2WGR/kuzy4dEn8Y3NG8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TXOwpLv7KDX/kwKg8NXTBcWSQI5gKaFisLYfaSk/F6g=;
 b=GEt1B2Bu5NQc0ufim5wg4yIxpdaXyMzaUpWshyFECk+AEdSGCyJ7nyL/HSgFX8ii3u
 iVvK/Cr3mHEcZCD6MPf7dYcCOb80ny9aeJI9sfxL+Po6M1nvUtPLOPuTSxQ6C9W8sxpc
 KzyyA4RhG/Bev+tMBCbj1AsKeM1QHsdMbZJOtMnLBTZwET5GKWMadlc6QAhqSR8t/JTO
 v8ipBVGNB1NjIpiT9lkTYrWFCCYBTedaqGBDLXxD+XXI90+HMOp7tZPCeiAs/L2/xjmo
 RFNFQZ2AK5tYZ2Xd9Kbq8g1Ak9AgxCJhm4rCf00wZMTeWzgnYZ+ycVNgowBjyLG/EybO
 QbFA==
X-Gm-Message-State: AOAM530T3/wvsFqeQ38oHgjtBlzyfCHCDRlNkGrh9NEzWGSlS9hvIlZl
 0H/O23SYwg5Rn7Zb8pdLtGmtFg==
X-Google-Smtp-Source: ABdhPJxUIahQRLbelSRGX08f9pSLdmcbvpjLK0Wt0SB+d6q+QgKmvzsKL3CRC0Q1NgyqKJbbE8NRFA==
X-Received: by 2002:a2e:9ecb:: with SMTP id h11mr31283952ljk.212.1637931757336; 
 Fri, 26 Nov 2021 05:02:37 -0800 (PST)
Received: from larwa.hq.kempniu.pl ([2001:470:64df:111::e02])
 by smtp.gmail.com with ESMTPSA id 18sm490378ljr.17.2021.11.26.05.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 05:02:36 -0800 (PST)
Date: Fri, 26 Nov 2021 14:02:33 +0100
From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtdchar: prevent unbounded allocation in MEMWRITE ioctl
Message-ID: <YaDa6Znbms3tVkr/@larwa.hq.kempniu.pl>
References: <20211025082104.8017-1-kernel@kempniu.pl>
 <20211122103122.424326a1@xps13>
 <YZ98sDJZIqdhP0NF@larwa.hq.kempniu.pl>
 <20211126103116.5bef6bc0@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126103116.5bef6bc0@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_050241_075386_8FC3DF80 
X-CRM114-Status: GOOD (  34.49  )
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

SGkgTWlxdcOobCwKCj4gPiAgNS4gVGhlIGFib3ZlIGNhdXNlcyB0aGUgZHJpdmVyIHRvIHJlY2Vp
dmUgMjA0OCBieXRlcyBvZiBkYXRhIGZvciBhIHBhZ2UKPiA+ICAgICB3cml0ZSBpbiByYXcgbW9k
ZSwgd2hpY2ggcmVzdWx0cyBpbiBhbiBlcnJvciB0aGF0IHByb3BhZ2F0ZXMgYWxsIHRoZQo+ID4g
ICAgIHdheSB1cCB0byBtdGRjaGFyX3dyaXRlX2lvY3RsKCkuCj4gCj4gVGhpcyBpcyBkZWZpbml0
ZWx5IGZhciBmcm9tIGFuIGV4cGVjdGVkIGJlaGF2aW9yLiBXcml0aW5nIGEgcGFnZQo+IHdpdGhv
dXQgT09CIGlzIGNvbXBsZXRlbHkgZmluZS4KCkNvdWxkIGl0IGJlIGEgbmFuZHNpbSBxdWlyaz8g
IFNvcnJ5LCBJIGRvIG5vdCBmZWVsIHF1YWxpZmllZCBlbm91Z2ggdG8KY29tbWVudCBvbiB0aGlz
LiAgSSBwcmVwYXJlZCBhIGNvZGUgZmxvdyBhbmFseXNpcyBiZWxvdywgdGhvdWdoLgoKPiA+IFRo
ZSBuYW5kc2ltIGRyaXZlciByZXR1cm5zIHRoZSBzYW1lIGVycm9yIGlmIHlvdSBwYXNzIHRoZSBm
b2xsb3dpbmcKPiA+IHJlcXVlc3QgdG8gdGhlIE1FTVdSSVRFIGlvY3RsOgo+ID4gCj4gPiAgICAg
c3RydWN0IG10ZF93cml0ZV9yZXEgcmVxID0gewo+ID4gICAgICAgICAuc3RhcnQgPSAyMDQ4LAo+
ID4gICAgICAgICAubGVuID0gMjA0OCwKPiA+ICAgICAgICAgLm9vYmxlbiA9IDAsCj4gPiAgICAg
ICAgIC51c3JfZGF0YSA9IDB4MTAwMDAwMDAsCj4gPiAgICAgICAgIC51c3Jfb29iID0gTlVMTCwK
PiA+ICAgICAgICAgLm1vZGUgPSBNVERfT1BTX1JBVywKPiA+ICAgICB9Owo+ID4gCj4gPiBzbyBp
dCBpcyBub3QgdGhlIGRyaXZlciB0aGF0IGlzIGJyb2tlbiBvciBpbnNhbmUsIGl0IGlzIHRoZSBz
cGxpdHRpbmcKPiA+IHByb2Nlc3MgdGhhdCBtYXkgY2F1c2UgdGhlIE1FTVdSSVRFIGlvY3RsIHRv
IHJldHVybiBkaWZmZXJlbnQgZXJyb3IKPiA+IGNvZGVzIHRoYW4gYmVmb3JlLgo+ID4gCj4gPiBJ
IHBsYXllZCB3aXRoIHRoZSBjb2RlIGEgYml0IG1vcmUgYW5kIEkgZm91bmQgYSBmaXggd2hpY2gg
YWRkcmVzc2VzIHRoaXMKPiA+IGlzc3VlIHdpdGhvdXQgYnJlYWtpbmcgb3RoZXIgc2NlbmFyaW9z
OiBzZXR0aW5nIG9vYmJ1ZiB0byB0aGUgc2FtZQo+ID4gcG9pbnRlciBmb3IgZXZlcnkgbG9vcCBp
dGVyYXRpb24gKGlmIG9vYmxlbiBpcyAwLCBubyBPT0IgZGF0YSB3aWxsIGJlCj4gPiB3cml0dGVu
IGFueXdheSkuCj4gCj4gWW91IG1lYW4gdGhhdAo+IAl7IC51c2VyX29vYiA9IE5VTEwsIC5vb2Js
ZW4gPSAwIH0KPiBmYWlscywgd2hpbGUKPiAJeyAudXNlcl9vb2IgPSByYW5kb20sIC5vb2JsZW4g
PSAwIH0KPiB3b3Jrcz8gVGhpcyBzZWVtcyBhIGxpdHRsZSBiaXQgZnJhZ2lsZS4KClRoYXQgaXMg
aW5kZWVkIHRoZSBiZWhhdmlvciBJIGFtIG9ic2VydmluZyB3aXRoIG5hbmRzaW0sIGV2ZW4gb24g
YQprZXJuZWwgd2hpY2ggZG9lcyBub3QgaW5jbHVkZSBteSBwYXRjaC4KCj4gQ291bGQgeW91IHRl
bGwgdXMgdGhlIG9yaWdpbiBvZiB0aGUgZXJyb3I/IEJlY2F1c2UgaW4KPiBuYW5kX2RvX3dyaXRl
X29wcygpIGlmIG9wcy0+b29iYnVmIGlzIHBvcHVsYXRlZCB0aGVuIG9vYl9yZXF1aXJlZCBpcwo+
IHNldCB0byB0cnVlIG5vIG1hdHRlciB0aGUgdmFsdWUgc2V0IGluIG9vYmxlbi4KCkNvcnJlY3Qg
LSBhbmQgdGhhdCBpcyB3aGF0IGNhdXNlcyB0aGUgYmVoYXZpb3IgZGVzY3JpYmVkIGFib3ZlIChh
bmQgd2h5CnRoZSB0d2VhayBJIGNhbWUgdXAgd2l0aCB3b3JrcyBhcm91bmQgdGhlIHByb2JsZW0p
LgoKbmFuZF9kb193cml0ZV9vcHMoKSBjYWxscyBuYW5kX3dyaXRlX3BhZ2UoKSB3aXRoICdvb2Jf
cmVxdWlyZWQnIHBhc3NlZAphcyB0aGUgZmlmdGggcGFyYW1ldGVyLiAgSW4gcmF3IG1vZGUsIG5h
bmRfd3JpdGVfcGFnZSgpIGNhbGxzCm5hbmRfd3JpdGVfcGFnZV9yYXcoKS4gIEhlcmUgaXMgd2hh
dCBoYXBwZW5zIHRoZXJlOgoKIDEuIG5hbmRfcHJvZ19wYWdlX2JlZ2luX29wKCkgc2V0cyB1cCBh
IHBhZ2UgcHJvZ3JhbW1pbmcgb3BlcmF0aW9uIGJ5CiAgICBzZW5kaW5nIGEgZmV3IGNvbW1hbmRz
IHRvIHRoZSBjaGlwLiAgU2VlIG5hbmRfZXhlY19wcm9nX3BhZ2Vfb3AoKQogICAgZm9yIGRldGFp
bHMuICBOb3RlIHRoYXQgc2luY2UgdGhlICdwcm9nJyBwYXJhbWV0ZXIgaXMgc2V0IHRvIGZhbHNl
LAogICAgdGhlIGxhc3QgdHdvIGluc3RydWN0aW9ucyBmcm9tIHRoZSAnaW5zdHJzJyBhcnJheSBh
cmUgbm90IHJ1biB5ZXQuCgogMi4gJ29vYl9yZXF1aXJlZCcgaXMgY2hlY2tlZC4gIElmIGl0IGlz
IHNldCB0byAxLCBPT0IgZGF0YSBpcyBzZW50IHRvCiAgICB0aGUgY2hpcDsgb3RoZXJ3aXNlLCBp
dCBpcyBub3Qgc2VudC4KCiAzLiBuYW5kX3Byb2dfcGFnZV9lbmRfb3AoKSBpcyBjYWxsZWQgdG8g
ZmluaXNoIHRoZSBwcm9ncmFtbWluZwogICAgb3BlcmF0aW9uLgoKQXQgdGhhdCBwb2ludCwgdGhl
IEFDVElPTl9QUkdQQUdFIHN3aXRjaCBjYXNlIGluIG5zX2RvX3N0YXRlX2FjdGlvbigpCihpbiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kc2ltLmMpIGNoZWNrcyB3aGV0aGVyIHRoZSBudW1iZXIg
b2YgYnl0ZXMKaXQgcmVjZWl2ZWQgc28gZmFyIGZvciB0aGlzIG9wZXJhdGlvbiAobnMtPnJlZ3Mu
Y291bnQsIHVwZGF0ZWQgYnkKbnNfbmFuZF93cml0ZV9idWYoKSBhcyBkYXRhIGlzIHB1c2hlZCB0
byB0aGUgY2hpcCkgZXF1YWxzIHRoZSBudW1iZXIgb2YKYnl0ZXMgaW4gYSBmdWxsIHBhZ2Ugd2l0
aCBPT0IgZGF0YSAobnVtKS4gIElmIG5vdCwgYW4gZXJyb3IgaXMgcmV0dXJuZWQsCndoaWNoIHJl
c3VsdHMgaW4gdGhlIE5BTkRfU1RBVFVTX0ZBSUwgZmxhZyBiZWluZyBzZXQgaW4gdGhlIHN0YXR1
cyBieXRlLAp0cmlnZ2VyaW5nIGFuIC1FSU8uCgpUaGlzIGRvZXMgbm90IGhhcHBlbiBmb3IgYW55
IG90aGVyIE1URCBvcGVyYXRpb24gbW9kZSBiZWNhdXNlIHRoZSBjaGlwCmNhbGxiYWNrcyB0aGF0
IG5hbmRfd3JpdGVfcGFnZSgpIGludm9rZXMgaW4gdGhvc2Ugb3RoZXIgbW9kZXMgY2F1c2UgT09C
CmRhdGEgdG8gYmUgc2VudCB0byB0aGUgY2hpcC4KCj4gUGx1cywgdGhlIGNvZGUgaW4gbXRkY2hh
ciBpcyBjbGVhcjogLm9vYmJ1ZiBpcyBzZXQgdG8gTlVMTCBpZiB0aGVyZSBhcmUKPiBubyBPT0Jz
IHByb3ZpZGVkIGJ5IHRoZSB1c2VyIHNvIEkgYmVsaWV2ZSB0aGlzIGlzIGEgc2l0dWF0aW9uIHRo
YXQKPiBzaG91bGQgYWxyZWFkeSB3b3JrLiAKCkNvcnJlY3QsIHRob3VnaCBjdXJyZW50IG10ZGNo
YXJfd3JpdGVfaW9jdGwoKSBjb2RlIG9ubHkgbG9va3MgYXQgdGhlCnZhbHVlIG9mIHRoZSAndXNy
X29vYicgZmllbGQgaW4gdGhlIHN0cnVjdCBtdGRfd3JpdGVfcmVxIHBhc3NlZCB0byBpdCwKc28g
ZXZlbiBpZiB5b3UgcGFzcyB7IC51c3Jfb29iID0gPHNvbWV0aGluZyBub24tTlVMTD4sIC5vb2Js
ZW4gPSAwIH0sIGl0CndpbGwgc3RpbGwgc2V0IG9wcy5vb2JidWYgdG8gdGhlIHBvaW50ZXIgcmV0
dXJuZWQgYnkgbWVtZHVwX3VzZXIoKS4KCi0tIApCZXN0IHJlZ2FyZHMsCk1pY2hhxYIgS8SZcGll
xYQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
