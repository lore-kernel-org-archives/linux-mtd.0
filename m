Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC2EC5AD4C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 01:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrHf6yioII9qfwwmGjdQDjl+ZnsB7osCuC5pfguUYjQ=; b=BlwgLgwyr4l+fr
	AFWBT4GD9NTEPFQERqGqEcLFYk6ynz3A5LM3NmZ7V62e1aKlyrhLTzw/9e5xseLnvEIm8CTUQPzWL
	sBR9mQ5QfX9vxs4W2Azb3qVPCkYdtZbRHbGRcgV0B/LccjKuj0fuZh8d/vig6NXDrRt1W2an/stB5
	kSVmJFdhzxeRsdQ+pmwvIDBQLzYZ7BF4Xi+ehhmF4qJ0aSnxpaPdhJG3aes8FL5YUl9BiVXR4I52y
	pyzaGTkMHedw9OZAtw6tX6fJ/27hZ4/DEZJZj1cTV3n0cZh0gCIscxponBcs5APg1JYF89rRjQzQE
	cRHgoJflSv+ken4FHQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Fzl-00FN8T-0p;
	Tue, 21 Nov 2023 01:56:09 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Fzg-00FN7w-1M
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 01:56:06 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1f0f94a08a0so3037763fac.2
        for <linux-mtd@lists.infradead.org>; Mon, 20 Nov 2023 17:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1700531762; x=1701136562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQ56/e9gIXdSgfNSGdgWVptzKqn8eJWnAkxf2mpd0zs=;
        b=gyS99aorVvTPDsqojoezw5AZ06DseKWZAaCYNFpit4wKCCq5v5Yqc1p82H5d9QGlSg
         JjBRe3d2egJfQPwRM6wzg1lHx9KKmpy1DSddni2UNt7DZ9AMVkkRtQJI30UtohgzFAqD
         cw4e569qA2lllEfQ2SMll2WebCxIqQPZhVXic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700531762; x=1701136562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQ56/e9gIXdSgfNSGdgWVptzKqn8eJWnAkxf2mpd0zs=;
        b=CX6DHZaVVyytNmPztZJn83L68XsQKWcmiPj7SrAmsf9p+JYzsmu4jQFrGCKzkvxTg3
         IA6HXnTEni57w6H+sNWId+lRhyy4fPDn+WfxpZl+pFbU/oEjW2y4EvD4ty/8RkJu7Xbz
         rDVrSC7/rXnuFeb1Ypy9atrqTvE82KYtC8fJ+HdQLwMFeSeu4dPKzgTTEFpdceMguWIo
         guWxeg2CSCz9TyMWWEeNBN7a2cTF4G+ZZgAhh1lh6TOzvDLYfDl+0FyYFTosk+/NH3gM
         gjzWACU9x5CQI005oWYMURF/yrVXhhCxi0ziVO1CYByRx9oVSSWEU8Y577441EWnXwHx
         E9fg==
X-Gm-Message-State: AOJu0YxKrGyltrumFWp3JHKSu/D/sdfh5VroDKo4XlxzPcmsfxT/fF3o
	I2gHifgLgzJ8PDW0QkMIrCjRDLDtdx4GPoVy38AQGw==
X-Google-Smtp-Source: AGHT+IH0fBRLchJxCRhVoAf6immLgQYjvq1pVQPEvi6I95SQNpe9lMarDAxipV+rtV+96QOE+fW49ggtHWk6IL7ar2Q=
X-Received: by 2002:a05:6870:b514:b0:1d6:5133:2f37 with SMTP id
 v20-20020a056870b51400b001d651332f37mr10374711oap.48.1700531762538; Mon, 20
 Nov 2023 17:56:02 -0800 (PST)
MIME-Version: 1.0
References: <20231023171444.322311-1-dregan@broadcom.com> <20231023171444.322311-4-dregan@broadcom.com>
 <20231120112816.15a19e05@xps-13>
In-Reply-To: <20231120112816.15a19e05@xps-13>
From: David Regan <dregan@broadcom.com>
Date: Mon, 20 Nov 2023 17:55:51 -0800
Message-ID: <CAA_RMS4H3qxHehN5uZdeV9KKXEZqONAsyJHrBjgt57+2kQVqsg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] mtd: rawnand: brcmnand: exec_op implementation
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Regan <dregan@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	linux-mtd@lists.infradead.org, f.fainelli@gmail.com, rafal@milecki.pl, 
	Joel Peshkin <joel.peshkin@broadcom.com>, computersforpeace@gmail.com, 
	Dan Beygelman <dan.beygelman@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	frieder.schrempf@kontron.de, linux-kernel@vger.kernel.org, vigneshr@ti.com, 
	richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com, 
	JaimeLiao <jaimeliao.tw@gmail.com>, Adam Borowski <kilobyte@angband.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_175604_830433_C4F7B50D 
X-CRM114-Status: GOOD (  27.30  )
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

SGkgTWlxdcOobCwKCk9uIE1vbiwgTm92IDIwLCAyMDIzIGF0IDI6MjjigK9BTSBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gZHJl
Z2FuQGJyb2FkY29tLmNvbSB3cm90ZSBvbiBNb24sIDIzIE9jdCAyMDIzIDEwOjE0OjQ0IC0wNzAw
Ogo+Cj4gPiBGcm9tOiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiA+Cj4gPiBl
eGVjX29wIGltcGxlbWVudGF0aW9uIGZvciBCcm9hZGNvbSBTVEIsIEJyb2FkYmFuZCBhbmQgaVBy
b2MgU29DCj4gPiBUaGlzIGFkZHMgZXhlY19vcCBhbmQgcmVtb3ZlcyB0aGUgbGVnYWN5IGludGVy
ZmFjZS4gQmFzZWQgb24gY2hhbmdlcwo+ID4gcHJvcG9zZWQgYnkgQm9yaXMgQnJlemlsbG9uLgo+
ID4KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9iYnJlemlsbG9uL2xpbnV4L2NvbW1pdC80ZWM2Zjhk
OGQ4M2Y1YWFjYTVkMTg3N2YwMmQ0OGRhOTZkNDFmY2JhCj4gPiBodHRwczovL2dpdGh1Yi5jb20v
YmJyZXppbGxvbi9saW51eC9jb21taXQvMTFiNGFjZmZkNzYxYzQ5Mjg2NTJkNzAyOGQxOWZjZDZm
NDVlNDY5Ngo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRj
b20uY29tPgo+Cj4gSSdtIGZpbmUgd2l0aCBwYXRjaGVzIDEtMywgYSBmZXcgbWlub3Igbml0cyBv
biB0aGlzIHZlcnNpb24gYXMgd2VsbCwKPiBub3RoaW5nIGJpZy4gSSBndWVzcyBJJ2xsIGxldCBz
b21lIHRpbWUgdG8gRmxvcmlhbiBhcyB3ZWxsIHRvIGdpdmUgaGlzCj4gZmVlZGJhY2sgYW5kIHBl
cmhhcHMgdGVzdCB0aGUgLT5leGVjX29wKCkgaW1wbGVtZW50YXRpb24uCgpUaGFuayB5b3UgdmVy
eSBtdWNoIGZvciB5b3VyIHRpbWUsIHNvcnJ5IGZvciBteSBtaXNzdGVwcy4KSW4gdGhlIG1lYW50
aW1lIEknbGwgdXBkYXRlIGFuZCBldmVyeW9uZSBjYW4gaGF2ZSBhZGRpdGlvbmFsCnRpbWUgdG8g
bG9vay4KCj4KPiAuLi4KPgo+ID4gK3N0YXRpYyBpbnQgYnJjbW5hbmRfZXhlY19pbnN0cihzdHJ1
Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCwgaW50IGksCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9vcGVyYXRpb24gKm9wKQo+ID4gK3sKPiA+ICsgICAg
IHN0cnVjdCBicmNtbmFuZF9jb250cm9sbGVyICpjdHJsID0gaG9zdC0+Y3RybDsKPiA+ICsgICAg
IGNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0ciA9ICZvcC0+aW5zdHJzW2ldOwo+ID4g
KyAgICAgY29uc3QgdTggKm91dDsKPiA+ICsgICAgIHU4ICppbjsKPiA+ICsgICAgIGludCByZXQg
PSAwOwo+ID4gKyAgICAgYm9vbCBsYXN0X29wOwo+ID4gKwo+ID4gKyAgICAgLyoKPiA+ICsgICAg
ICAqIGlmIHdlIGFyZSBvbiB0aGUgbGFzdCBjb21tYW5kIGluIHRoZSBzZXF1ZW5jZSAobm90IGlu
Y2x1ZGluZwo+ID4gKyAgICAgICogd2FpdHJkeSB3aGljaCBpcyBub3QgYSBOQU5EIGNvbW1hbmQp
IHRoZW4gZmxhZyB0aGUgY29udHJvbGxlcgo+Cj4gTWF5IEkgc3VnZ2VzdDoKPgo+ICAgICAgICAg
LyoKPiAgICAgICAgICAqIFRoZSBjb250cm9sbGVyIG5lZWRzIHRvIGJlIGF3YXJlIG9mIHRoZSBs
YXN0IGNvbW1hbmQgaW4gdGhlIG9wZXJhdGlvbgo+ICAgICAgICAgICogKFdBSVRSRFkgZXhjZXB0
ZWQpLgo+ICAgICAgICAgICovCj4KCldpbGwgY2hhbmdlLgoKPiA+ICsgICAgICAqLwo+ID4gKyAg
ICAgbGFzdF9vcCA9ICgoKGkgPT0gKG9wLT5uaW5zdHJzIC0gMSkpICYmCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgKGluc3RyLT50eXBlICE9IE5BTkRfT1BfV0FJVFJEWV9JTlNUUikpIHx8Cj4K
PiBZb3UgY2FuIGNyb3NzIHRoZSA4MCBjaGFycyBib3VuZGFyeS4gUGxlYXNlIHVzZSB0aGlzIGZv
cm06Cj4KPiAgICAgICAgIGxhc3Rfb3AgPSAoKGkgPT0gKG9wLT5uaW5zdHJzIC0gMSkpICYmIChp
bnN0ci0+dHlwZSAhPSBOQU5EX09QX1dBSVRSRFlfSU5TVFIpKSB8fAo+ICAgICAgICAgICAgICAg
ICAgICgoaSA9PSAob3AtPm5pbnN0cnMgLSAyKSkgJiYgKG9wLT5pbnN0cnNbaSsxXS50eXBlID09
IE5BTkRfT1BfV0FJVFJEWV9JTlNUUikpOwo+CgpXaWxsIGRvLgoKLi4uCgo+ID4gK3N0YXRpYyBp
bnQgYnJjbW5hbmRfZXhlY19vcF9pc19zdGF0dXMoY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9u
ICpvcCkKPgo+IGJyY21uYW5kX29wX2lzX3N0YXR1cygpIHdvdWxkIG1ha2UgbW9yZSBzZW5zZQo+
Cj4gPiArewo+ID4gKyAgICAgaWYgKChvcC0+bmluc3RycyA9PSAyKSAmJgo+ID4gKyAgICAgICAg
ICAgICAob3AtPmluc3Ryc1swXS50eXBlID09IE5BTkRfT1BfQ01EX0lOU1RSKSAmJgo+ID4gKyAg
ICAgICAgICAgICAob3AtPmluc3Ryc1swXS5jdHguY21kLm9wY29kZSA9PSBOQU5EX0NNRF9TVEFU
VVMpICYmCj4gPiArICAgICAgICAgICAgIChvcC0+aW5zdHJzWzFdLnR5cGUgPT0gTkFORF9PUF9E
QVRBX0lOX0lOU1RSKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gPiArCj4gPiArICAg
ICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBicmNtbmFuZF9leGVjX29w
X2lzX3Jlc2V0KGNvbnN0IHN0cnVjdCBuYW5kX29wZXJhdGlvbiAqb3ApCj4KPiBzYW1lIGhlcmUs
IHBsZWFzZSBzL2V4ZWNfLy8KPgoKSSdsbCB1cGRhdGUgdGhlIG5hbWVzLgoKPiA+ICt7Cj4gPiAr
ICAgICBpZiAoKG9wLT5uaW5zdHJzID09IDEpICYmCj4gPiArICAgICAgICAgICAgIChvcC0+aW5z
dHJzWzBdLnR5cGUgPT0gTkFORF9PUF9DTURfSU5TVFIpICYmCj4gPiArICAgICAgICAgICAgIChv
cC0+aW5zdHJzWzBdLmN0eC5jbWQub3Bjb2RlID09IE5BTkRfQ01EX1JFU0VUKSkKPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIDE7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiAr
Cj4gPiArc3RhdGljIGludCBicmNtbmFuZF9leGVjX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX29wZXJhdGlv
biAqb3AsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgY2hlY2tfb25seSkKPiA+
ICt7Cj4gPiArICAgICBzdHJ1Y3QgYnJjbW5hbmRfaG9zdCAqaG9zdCA9IG5hbmRfZ2V0X2NvbnRy
b2xsZXJfZGF0YShjaGlwKTsKPiA+ICsgICAgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90
b19tdGQoY2hpcCk7Cj4gPiArICAgICB1OCAqc3RhdHVzOwo+ID4gKyAgICAgdW5zaWduZWQgaW50
IGk7Cj4gPiArICAgICBpbnQgcmV0ID0gMDsKPiA+ICsKPiA+ICsgICAgIGlmIChjaGVja19vbmx5
KQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIGlmIChicmNtbmFu
ZF9leGVjX29wX2lzX3N0YXR1cyhvcCkpIHsKPiA+ICsgICAgICAgICAgICAgc3RhdHVzID0gb3At
Pmluc3Ryc1sxXS5jdHguZGF0YS5idWYuaW47Cj4gPiArICAgICAgICAgICAgICpzdGF0dXMgPSBi
cmNtbmFuZF9zdGF0dXMoaG9zdCk7Cj4gPiArCj4gPiArICAgICAgICAgICAgIHJldHVybiAwOwo+
ID4gKyAgICAgfQo+Cj4gSSB3b3VsZCBhZGQgdGhlIGJlbG93IGNodW5rIGhlcmU6Cj4KPiAgICAg
ICAgIH0gZWxzZSBpZiAoYnJjbW5hbmRfZXhlY19vcF9pc19yZXNldChvcCkpIHsKPiAgICAgICAg
ICAgICAgICAgLi4uCj4KPiAgICAgICAgICAgICAgICAgcmV0dXJuIC4uLgo+ICAgICAgICAgfQoK
R29vZCBpZGVhIHdpbGwgZG8uCgouLi4KCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzIQoK
LURhdmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
