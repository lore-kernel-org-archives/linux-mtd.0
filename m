Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63102C6FD20
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Mar 2023 10:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BhJnG6AnYBx8azcSrgt8rBPPQDByxW8n3O6OimBtbk=; b=C5DHFN1lHyRVDl
	9+6dXF1MxRkAI2m4AcstfCoQjD+YmcnYuNGwaniDln615EyAy7txPODl5DN88BYX3GYCQOnkltbK2
	xmfvLOZOUfyYmvdk4p7odaOuPIKprgqiV43yPE+6ZjqtTd3LQMxNIyzzoVPokpCoaGqZmyJcawBmj
	QYo7J7GqjFCZ8Yx4HVTbbL3oGRz5tY8JaV8qEgTmExZom0lav+AFcI10U3GqPs9hXLPwm2B/zDMy3
	UrjBwXdr5Y+okQt7H0TYt8lH3lPtzbhJjyZVEQONdOodmMnBzFy8IOc7ALoa14DyaYTj0hHyXPBwn
	8k8Z5Glv7YLNDKj+qEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfehr-004Ags-04;
	Fri, 24 Mar 2023 10:31:35 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeho-004Afx-0y
	for linux-mtd@lists.infradead.org;
	Fri, 24 Mar 2023 10:31:33 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-54184571389so25195407b3.4
        for <linux-mtd@lists.infradead.org>; Fri, 24 Mar 2023 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679653888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8LJ+2gNxDWzsoGiFhmZ/B/FieuTyyGjuau6AfS/ml8=;
        b=oj4xmZQv8SdZ+QXoTWZ34SKWMeCxupNXfejiX3Lt0MOtSlOrvLNncbLNnnicWMpfzW
         opwxxhtbTelWiTBteCkWzskVHcOMlBZmDy2GgtGSyjd3WWfLrnSLWzFf45dyzGVT985F
         D5MvHp3xKPuRloSlE9Jt/mxSi+lBfJJOQZHGdv4eJ0stIOiI0Wo4JVeQPWlgDaK/ycRm
         UARaWcMj+9odpEly9N/vjqgLgfp2J7bp7tjrvj8wLVGUglRJZMKCmn2WrIl+sW0fkZBj
         DMJS6rPbmgxiOjpB9tfroqNrhRqLS1KCsoTCX0nCMn87RnMHQ4BX+FHbNOhepJwSl+7s
         t4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679653888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LJ+2gNxDWzsoGiFhmZ/B/FieuTyyGjuau6AfS/ml8=;
        b=Vzv2rZjHn//KFLbxmwFjxOV3Lw/OFgibo96eDl2WbynI7ljSsczsXB+9QhUPi8YLyL
         oVn0ZysV0gf2g0e0kZSx5/rlKMBO3pMiTqqwZ/SgRPClwH5Vsuktv63ReU1MPQYnYpHo
         Oj+WMBvC6/ht5nN9uZmD1APiGIK97+5wy+NIuxrOkJrQuKyE11m0X6qWdcpRRgt3XeVd
         ORXreoUXnNW3nO8wN2Akk27JsOLOM2OpG2q/l/mUWmB8apZASujK5LIb+H3mFAHAVjFC
         d2XaIonIryXwIUnTd0nadS66Ew+GNGoZ4LoUtez77TunaWd8ZJcKcNej7Hi2f4ed+hrd
         1WIw==
X-Gm-Message-State: AAQBX9dGaEy50uWtZCJQxCDD6dw2xtRLqiGnfVe2Qv2ji/POOdwsCcpD
	qCKkkSbNrWqxf4oOk/9y3po8U+sfzkZTlccqQbo=
X-Google-Smtp-Source: AKy350YCwRIztWFByFXdBbQ4j7qQpWwm9DOJaxzeYjSi7RZPTo610GlaH1m9RBJrbiYZ/O/ilFrAh5cp9ZufQUGaVow=
X-Received: by 2002:a81:ac67:0:b0:541:9063:8e9e with SMTP id
 z39-20020a81ac67000000b0054190638e9emr790386ywj.2.1679653888027; Fri, 24 Mar
 2023 03:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230323124510.2484808-1-noltari@gmail.com> <20230323124510.2484808-2-noltari@gmail.com>
 <20230324104020.54754079@xps-13>
In-Reply-To: <20230324104020.54754079@xps-13>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Fri, 24 Mar 2023 11:31:17 +0100
Message-ID: <CAKR-sGcbRRjqt3raXHcvfCfKFDfFWsuu+C7XW3qFckawMsqe4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: nand: Macronix: document new binding
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, masonccyang@mxic.com.tw, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_033132_360950_BAAE1BFD 
X-CRM114-Status: GOOD (  22.80  )
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

SGkgTWlxdcOobCwKCkVsIHZpZSwgMjQgbWFyIDIwMjMgYSBsYXMgMTA6NDAsIE1pcXVlbCBSYXlu
YWwKKDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPikgZXNjcmliacOzOgo+Cj4gSGkgw4FsdmFy
bywKPgo+IG5vbHRhcmlAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgMjMgTWFyIDIwMjMgMTM6NDU6
MDkgKzAxMDA6Cj4KPiA+IEFkZCBuZXcgIm14aWMsZGlzYWJsZS1ibG9jay1wcm90ZWN0aW9uIiBi
aW5kaW5nIGRvY3VtZW50YXRpb24uCj4gPiBUaGlzIGJpbmRpbmcgYWxsb3dzIGRpc2FibGluZyBi
bG9jayBwcm90ZWN0aW9uIHN1cHBvcnQgZm9yIHRob3NlIGRldmljZXMgbm90Cj4gPiBzdXBwb3J0
aW5nIGl0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8
bm9sdGFyaUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL25hbmQtbWFjcm9uaXgudHh0IHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1tYWNyb25peC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtbWFjcm9uaXgudHh0Cj4gPiBpbmRleCBmZmFiMjhh
MmM0ZDEuLjAzZjY1Y2EzMmNkMyAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1tYWNyb25peC50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFuZC1tYWNyb25peC50eHQKPiA+IEBAIC0xNiw2
ICsxNiw5IEBAIGluIGNoaWxkcmVuIG5vZGVzLgo+ID4gIFJlcXVpcmVkIE5BTkQgY2hpcCBwcm9w
ZXJ0aWVzIGluIGNoaWxkcmVuIG1vZGU6Cj4gPiAgLSByYW5kb21pemVyIGVuYWJsZTogc2hvdWxk
IGJlICJteGljLGVuYWJsZS1yYW5kb21pemVyLW90cCIKPiA+Cj4gPiArT3B0aW9uYWwgTkFORCBj
aGlwIHByb3BlcnRpZXMgaW4gY2hpbGRyZW4gbW9kZToKPiA+ICstIGJsb2NrIHByb3RlY3Rpb24g
ZGlzYWJsZTogc2hvdWxkIGJlICJteGljLGRpc2FibGUtYmxvY2stcHJvdGVjdGlvbiIKPiA+ICsK
Pgo+IEJlc2lkZXMgdGhlIGZhY3QgdGhhdCBub3dhZGF5cyB3ZSBwcmVmZXIgdG8gc2VlIGJpbmRp
bmcgY29udmVyc2lvbnMgdG8KPiB5YW1sIGJlZm9yZSBhZGRpbmcgYW55dGhpbmcsIEkgZG9uJ3Qg
dGhpbmsgdGhpcyB3aWxsIGZseS4KPgo+IEknbSBub3Qgc3VyZSBleGFjdGx5IHdoYXQgImRpc2Fi
bGUgYmxvY2sgcHJvdGVjdGlvbiIgbWVhbnMsIHdlCj4gYWxyZWFkeSBoYXZlIHNpbWlsYXIgcHJv
cGVydGllcyBsaWtlICJsb2NrIiBhbmQgInNlY3VyZS1yZWdpb25zIiwgbm90Cj4gc3VyZSB0aGV5
IHdpbGwgZml0IGJ1dCBJIHRoaW5rIGl0J3Mgd29ydGggY2hlY2tpbmcuCgpBcyBleHBsYWluZWQg
aW4gMi8yLCBjb21taXQgMDNhNTM5YzdhMTE4IGludHJvZHVjZWQgYSByZWdyZXNzaW9uIG9uClNl
cmNvbW0gSDUwMC1zIChCQ002MzI2OCkgT3BlbldydCBkZXZpY2VzIHdpdGggTWFjcm9uaXggTVgz
MExGMUcxOEFDCndoaWNoIGhhbmdzIHRoZSBkZXZpY2UuCgpUaGlzIGlzIHRoZSBsb2cgd2l0aCBi
bG9jayBwcm90ZWN0aW9uIGRpc2FibGVkOgpbICAgIDAuNDk1ODMxXSBiY202MzY4X25hbmQgMTAw
MDAyMDAubmFuZDogdGhlcmUgaXMgbm90IHZhbGlkIG1hcHMgZm9yCnN0YXRlIGRlZmF1bHQKWyAg
ICAwLjUwNDk5NV0gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4YzIsIENo
aXAgSUQ6IDB4ZjEKWyAgICAwLjUxMTUyNl0gbmFuZDogTWFjcm9uaXggTVgzMExGMUcxOEFDClsg
ICAgMC41MTU1ODZdIG5hbmQ6IDEyOCBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFn
ZSBzaXplOgoyMDQ4LCBPT0Igc2l6ZTogNjQKWyAgICAwLjUyMzUxNl0gYmNtNjM2OF9uYW5kIDEw
MDAwMjAwLm5hbmQ6IGRldGVjdGVkIDEyOE1pQiB0b3RhbCwKMTI4S2lCIGJsb2NrcywgMktpQiBw
YWdlcywgMTZCIE9PQiwgOC1iaXQsIEJDSC00ClsgICAgMC41MzU5MTJdIEJhZCBibG9jayB0YWJs
ZSBmb3VuZCBhdCBwYWdlIDY1NDcyLCB2ZXJzaW9uIDB4MDEKWyAgICAwLjU0NDI2OF0gQmFkIGJs
b2NrIHRhYmxlIGZvdW5kIGF0IHBhZ2UgNjU0MDgsIHZlcnNpb24gMHgwMQpbICAgIDAuOTU0MzI5
XSA5IGZpeGVkLXBhcnRpdGlvbnMgcGFydGl0aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNlIGJyY21u
YW5kLjAKLi4uCgpUaGlzIGlzIHRoZSBsb2cgd2l0aCBibG9jayBwcm90ZWN0aW9uIGVuYWJsZWQ6
ClsgICAgMC40OTUwOTVdIGJjbTYzNjhfbmFuZCAxMDAwMDIwMC5uYW5kOiB0aGVyZSBpcyBub3Qg
dmFsaWQgbWFwcyBmb3IKc3RhdGUgZGVmYXVsdApbICAgIDAuNTA0MjQ5XSBuYW5kOiBkZXZpY2Ug
Zm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHhjMiwgQ2hpcCBJRDogMHhmMQpbICAgIDAuNTEwNzcy
XSBuYW5kOiBNYWNyb25peCBNWDMwTEYxRzE4QUMKWyAgICAwLjUxNDg3NF0gbmFuZDogMTI4IE1p
QiwgU0xDLCBlcmFzZSBzaXplOiAxMjggS2lCLCBwYWdlIHNpemU6CjIwNDgsIE9PQiBzaXplOiA2
NApbICAgIDAuNTIyNzgwXSBiY202MzY4X25hbmQgMTAwMDAyMDAubmFuZDogZGV0ZWN0ZWQgMTI4
TWlCIHRvdGFsLAoxMjhLaUIgYmxvY2tzLCAyS2lCIHBhZ2VzLCAxNkIgT09CLCA4LWJpdCwgQkNI
LTQKWyAgICAwLjUzOTY4N10gQmFkIGJsb2NrIHRhYmxlIG5vdCBmb3VuZCBmb3IgY2hpcCAwClsg
ICAgMC41NTAxNTNdIEJhZCBibG9jayB0YWJsZSBub3QgZm91bmQgZm9yIGNoaXAgMApbICAgIDAu
NTU1MDY5XSBTY2FubmluZyBkZXZpY2UgZm9yIGJhZCBibG9ja3MKWyAgICAwLjYwMTIxM10gQ1BV
IDEgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbAphZGRy
ZXNzIDEwMjc3ZjAwLCBlcGMgPT0gODAzOWNlNzAsIHJhID09IDgwMTZhZDUwCioqKiBEZXZpY2Ug
aGFuZ3MgKioqCgpFbmFibGluZyBtYWNyb25peF9uYW5kX2Jsb2NrX3Byb3RlY3Rpb25fc3VwcG9y
dCgpIG1ha2VzIHRoZSBkZXZpY2UKdW5hYmxlIHRvIGRldGVjdCB0aGUgYmFkIGJsb2NrIHRhYmxl
IGFuZCBoYW5ncyBpdCB3aGVuIHRyeWluZyB0byBzY2FuCmZvciBiYWQgYmxvY2tzLgoKPgo+IE90
aGVyd2lzZSwgd2h5IHdvdWxkIHlvdSBkaXNhYmxlIHRoZSBibG9jayBwcm90ZWN0aW9uPyBXaGF0
IGRvZXMgaXQKPiBtZWFuIGV4YWN0bHk/IEknbSBub3QgaW4gZmF2b3Igb2YgYSBNYWNyb25peC1z
cGVjaWZpYyBwcm9wZXJ0eSBoZXJlLgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCi0tCsOBbHZhcm8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
