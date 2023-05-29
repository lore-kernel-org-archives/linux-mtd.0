Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7844C77B7A
	for <linux-mtd@archiver.kernel.org>; Mon, 29 May 2023 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGL4spAWlJ9KiemKQyNsRHANdt21KeJKtudjpmZ5/cg=; b=1OOiPeTa0uQNgu
	ODkv0PBDvATtsRnskhEw7vsbQyk/eVgMJDvZFKzwu78HjLwMb9kdkPiFX2Sxx4+1GQSHrXWhC8dIJ
	mE0dh+psyk97QBztmYGQ6ygPuN0eFXsuf2o+ZdCgTxrwmhuMWYf3l0VI4DlODg3anHKsbKvNPmmq9
	kgnA9YmdE9EfHU6LYFEU9rvNo85tkYVmsuQw1pv4cwOtSXBjXbs6MZ6+kDagESP9pmScl+YpDewQ2
	jt20zxUkxRW3KTRCXDJHQzepcn0e4pDSu4rfB3ZoHBGrucZHhKy3PGatocX+r+zlfbmNvqmZbmNw7
	0PW6gMHuSVKd7yC9VoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3X61-009VPb-2Z;
	Mon, 29 May 2023 07:15:13 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3W5d-009K0f-3A
	for linux-mtd@lists.infradead.org;
	Mon, 29 May 2023 06:10:47 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-25692ff86cdso167878a91.2
        for <linux-mtd@lists.infradead.org>; Sun, 28 May 2023 23:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685340644; x=1687932644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KULrYHC+FTRnUj0/C78lyECvXrmyULJ2Kvoh4+7oI5Y=;
        b=VvApFlEJa30QMVjMyZRT4dVHTSZfWJUhzwYQfQY5ZhOsMmqVzVk8ESDnFusphVfiq2
         t97eEkliq4Sr7Cf0iNdJkt0AoDDhoa71vK4f5lnmt3ofAb+FRPG4GuZGzc3Et/NV/s4c
         A/P0gUxOHT75ijUhh6/aoveqG7x7MfqiUQ1z4ZZD3xLX+1F+sztH7pswZqEqaubN2LDW
         aujVrN3yrkGGmXONNPR31keOxGa9pC7hDV0Br+iQlyigiEdbppdSjKMi4QFiTKM9SsNF
         oGLe0YbvGSG9OJLM3vCo6Jd2sWV5WBPlEB+riKWCNGsqI91FOKbKvX7rc7P4Cvdvwjl+
         OvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685340644; x=1687932644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KULrYHC+FTRnUj0/C78lyECvXrmyULJ2Kvoh4+7oI5Y=;
        b=RCuxElZCkhliJ1qJT1t9cBJej4909uoIyS8hDR7FhufA8/IgawQOd4HAF3VBjY1nCl
         AZgu+GdxS2xlTOPfa5jZwJbPrUzqtgd5XYAOlWAYJGzk7ftE4tlMEXPwTnBI29fon3Sv
         5TW2Nj63b/6xVlRkcnrOd71O8SXE3XquOr5KarzLAvzSMbMAeW/0lyebz4syDhB6/hOl
         9A/LcOcPE9XvQQTmGYhOq6gYkRauLyDNiPcDbV9NaF83tK4ofbhPZvT1sFBoik1yAr8t
         octT8/5GSPEWtQHD9t5GpOJRScKP59+bpQ4YM446lkQ6ePFwLm/dxy+XUFKDSGs0C1B+
         vMqQ==
X-Gm-Message-State: AC+VfDxVzq0NaJBmpqvcbjG/czzAQ5vvGswTn4AjGRKIW2+Gxkm01wTH
	ngwAWmr+IwJZthMuSZH7DWciNSBBTKojSYixQXA=
X-Google-Smtp-Source: ACHHUZ5RyXRyy98x3AJ81FH1oreQJgYtTuYJgRETJ/w/RX8fJ/PojyncWlZKhLlVm4zTuyTb5h2dr7jgmPONnKI+JZE=
X-Received: by 2002:a17:90a:430e:b0:255:8802:937a with SMTP id
 q14-20020a17090a430e00b002558802937amr9643397pjg.11.1685340643703; Sun, 28
 May 2023 23:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
 <20230526201420.231092a0@xps-13>
In-Reply-To: <20230526201420.231092a0@xps-13>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Mon, 29 May 2023 09:10:32 +0300
Message-ID: <CAP1tNvQsmYKMHZ662f1yiLv2JmZZrnQsJr2Lf5xiafxJSkZfBQ@mail.gmail.com>
Subject: Re: Boot failed after patch "mtd: rawnand: Support for sequential
 cache reads"
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: JaimeLiao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_231046_019678_D4DC1EF9 
X-CRM114-Status: GOOD (  30.48  )
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

SGVsbG8gTWlxdWVsLgoK0L/RgiwgMjYg0LzQsNGPIDIwMjPigK/Qsy4g0LIgMjE6MTQsIE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ogo+IEhpIEFsZXhhbmRlciwKPiBl
YWdsZS5hbGV4YW5kZXI5MjNAZ21haWwuY29tIHdyb3RlIG9uIFRodSwgMjUgTWF5IDIwMjMgMTA6
NDg6MzkgKzAzMDA6Cj4gPiBIZWxsby4KPiA+IEtlcm5lbCBib290IGZhaWxzIGFmdGVyIHBhdGNo
ICJtdGQ6IHJhd25hbmQ6IFN1cHBvcnQgZm9yIHNlcXVlbnRpYWwKPiA+IGNhY2hlIHJlYWRzIiAo
dGhhbmtzIHRvIGdpdCBiaXNlY3QpLgo+ID4gUGxlYXNlIGFkdmlzZSB3aGF0IGNhbiBiZSBkb25l
IGhlcmUgYW5kIHdoZXJlIHRvIGxvb2sgZm9yIGEgYnVnLgo+IFRoYW5rcyBmb3IgdGhlIHJlcG9y
dCwgYW5kIHNvcnJ5IGZvciB0aGUgdHJvdWJsZS4gUmlnaHQgbm93IEkgZG9uJ3QKPiBrbm93IHdo
YXQncyB3cm9uZyB3aXRoIHRoZSBkcml2ZXIgYnV0IGFzIGEgZmlyc3Qgc3RlcCwgeW91IGNvdWxk
IGp1c3QKPiB0cnkgdG8gcmVzZXQgY2hpcC0+Y29udHJvbGxlci0+c3VwcG9ydGVkX29wLmNvbnRf
cmVhZCBhZnRlcgo+IHJhd25hbmRfY2hlY2tfY29udF9yZWFkX3N1cHBvcnQoKS4gSXQgc2hvdWxk
IGp1c3QgYXZvaWQgdXNpbmcgdGhlCj4gb3B0aW1pemF0aW9uIGFuZCBzb2x2ZSB0aGUgYm9vdC4g
VGhhdCdzIG9mIGNvdXJzZSBhIHZlcnkgZWFybHkgZml4LCB3ZQo+IG5vdyBuZWVkIHRvIHVuZGVy
c3RhbmQgZnVydGhlciB3aGF0J3MgZ29pbmcgb24uCgpXaGVuIEkgY29tbWVudCBvdXQgdGhlIGxp
bmUgInJhd25hbmRfY2hlY2tfY29udF9yZWFkX3N1cHBvcnQoY2hpcCk7Igp0aGUgYm9vdGluZyB3
b3JrcyBhcyBleHBlY3RlZC4KCj4gTXkgZmlyc3QgZ3Vlc3Mgd291bGQgYmUgdGhhdCB0aGUgc2Vx
dWVudGlhbCByZWFkIHBhdHRlcm5zIGFyZSBub3QKPiBzdXBwb3J0ZWQgYnkgdGhlIGNvbnRyb2xs
ZXIgb3IgYmFkbHkgaW1wbGVtZW50ZWQgYnkgaXRzIGRyaXZlci4gQnV0Cj4gdGhhdCBpcyBzdHJh
bmdlIGdpdmVuIHRoZSBzaW1wbGljaXR5IG9mIHRoaXMgY29udHJvbGxlci4gVGhpcwo+IGNvbnRy
b2xsZXIgaXMgbWVhbnQgdG8gYmUgdmVyc2F0aWxlLCBJIGRvdWJ0IGl0IGRvZXMgbm90IHN1cHBv
cnQgdGhlc2UKPiBvcGVyYXRpb25zLiBQbHVzLCBJIHdvdWxkIGV4cGVjdCBwYWdlIGFjY2Vzc2Vz
IHRvIGJlIGRpcmVjdGx5Cj4gaW1wbGVtZW50ZWQgYnkgdGhlIGRyaXZlciBhbmQgbm90IGJlIGFm
ZmVjdGVkIGJ5IHRoaXMgbG9naWMuIENvdWxkIHlvdQo+IHRyeSB0byB0cmFjZSB0aGUgYWN0dWFs
IGNhbGxzIHdoaWNoIGFyZSBtYWRlIHRocm91Z2ggdGhlIG10ZCBsYXllcgo+IHdoaWNoIGxlYWQg
dG8gdGhlc2UgZXJyb3JzPyBJcyAtPmV4ZWNfb3AoKSBpbnZvbHZlZCBpbiB0aGUgcHJvY2Vzcz8K
PiBXaGVyZT8gSG93PwoKWWVzLCBIZXJlIGV2ZXJ5dGhpbmcgZ29lcyBhcyBleHBlY3RlZCwgZGVi
dWdnaW5nIHNob3dzIHRoYXQgdGhlIGNvcnJlY3QKb3Bjb2RlcyBhcmUgcGFzc2luZywgZm9yIHRo
ZSBOQU5EX0NNRF9SRUFEQ0FDSEVTRVEgaXQgaXMgMHgzMS4KCj4gQWxzbywgd2hhdCBrZXJuZWwg
YXJlIHlvdSB1c2luZyBleGFjdGx5PyBJJ20gc3VycHJpc2VkIHRoZXJlIGlzIG5vCj4gbXRkLXJl
bGF0ZWQgZXJyb3IuIElmIHlvdSByZWJvb3Qgd2l0aCBhbiBvbGRlciBrZXJuZWwsIHlvdSBnZXQg
eW91cgo+IGRhdGEsIHJpZ2h0PwoKUmlnaHQuIFRoaXMgYnVnIGFwcGVhcmVkIGluIExpbnV4IDYu
My4gRm9yIDYuMiBldmVyeXRoaW5nIHdvcmtlZCBhcyBleHBlY3RlZCwKc28gSSB1c2VkICJnaXQg
YmlzZWN0IiB0byBmaW5kIHRoZSBwb2ludCB3aGVyZSB0aGUgZXJyb3Igb2NjdXJzLgoKPiBPdGhl
cndpc2UgbWF5YmUgdGhlIE1pY3JvbiBjaGlwIGlzIGluIGZhdWx0LiBXaGljaCB3b3VsZCBtZWFu
IHRoYXQKPiB0aGVyZSBhcmUgdW5zdXBwb3J0ZWQgY29tbWFuZHMuIEkgYmVsaWV2ZWQgdGhleSB3
ZXJlIGFsbCBzdGFuZGFyZCwKPiBtYXliZSBzb21lIG9mIHRoZW0gYXJlIG9wdGlvbmFsPyBDb3Vs
ZCB5b3UgY2hlY2sgaW4gdGhlIGNoaXAgZGF0YXNoZWV0Cj4gaWYgdGhlcmUgaXMgYW55IGNvbW1h
bmQgdXNlZCB0aGVyZSB0aGF0IGlzIHVuc3VwcG9ydGVkPwoKQWNjb3JkaW5nIHRvIHRoZSBNVDI5
RjJHMDhBQkFFQVdQIGRhdGFzaGVldCwgdGhlIGNoaXAgc3VwcG9ydHMKdGhlIFJFQUQgUEFHRSBD
QUNIRSBTRVFVRU5USUFMIG9wY29kZSwgYnV0IHdpdGggdHdvIGNhdmVhdHM6CiA0LiBUaGVzZSBj
b21tYW5kcyBzdXBwb3J0ZWQgb25seSB3aXRoIEVDQyBkaXNhYmxlZC4KIDUuIElzc3VpbmcgYSBS
RUFEIFBBR0UgQ0FDSEUgc2VyaWVzICgzMWgsIDAwaC0zMWgsIDNGaCkgY29tbWFuZAogIHdoZW4g
dGhlIGFycmF5IGlzIGJ1c3kgKFJEWSA9IDEsIEFSRFkgPSAwKSBpcyBzdXBwb3J0ZWQgaWYgdGhl
IHByZXZpb3VzCiAgY29tbWFuZCB3YXMgYSBSRUFEIFBBR0UgKDAwaC0zMGgpIG9yIFJFQUQgUEFH
RSBDQUNIRSBzZXJpZXMKICBjb21tYW5kOyBvdGhlcndpc2UsIGl0IGlzIHByb2hpYml0ZWQuCgpB
cyBmYXIgYXMgSSB1bmRlcnN0YW5kLCB0aGUgc2Vjb25kIHJlbWFyayBzdWl0cyB1cywgc2luY2Ug
d2UgY3JlYXRlCnRoZSBjb3JyZWN0IHNlcXVlbmNlLgpCdXQgdGhlIGZpcnN0IHJlbWFyayBjYW4g
YmUgYSBwcm9ibGVtIGluIHRoaXMgY2FzZS4KCj4gPiAuLi4KPiA+IG9tYXAtZ3BtYyA1MDAwMDAw
MC5ncG1jOiBHUE1DIHJldmlzaW9uIDYuMAo+ID4gLi4uCj4gPiBuYW5kOiBkZXZpY2UgZm91bmQs
IE1hbnVmYWN0dXJlciBJRDogMHgyYywgQ2hpcCBJRDogMHhkYQo+ID4gbmFuZDogTWljcm9uIE1U
MjlGMkcwOEFCQUVBV1AKPiA+IG5hbmQ6IDI1NiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtp
QiwgcGFnZSBzaXplOiAyMDQ4LCBPT0Igc2l6ZTogNjQKPiA+IG5hbmQ6IHVzaW5nIE9NQVBfRUND
X0JDSDhfQ09ERV9IVyBFQ0Mgc2NoZW1lCj4gPiAuLi4KPiA+IFZGUzogTW91bnRlZCByb290IChz
cXVhc2hmcyBmaWxlc3lzdGVtKSByZWFkb25seSBvbiBkZXZpY2UgMjU0OjAuCj4gPiBkZXZ0bXBm
czogbW91bnRlZAo+ID4gRnJlZWluZyB1bnVzZWQga2VybmVsIGltYWdlIChpbml0bWVtKSBtZW1v
cnk6IDEwMjRLCj4gPiBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKPiA+IFNRVUFTSEZT
IGVycm9yOiBsem8gZGVjb21wcmVzc2lvbiBmYWlsZWQsIGRhdGEgcHJvYmFibHkgY29ycnVwdAo+
ID4gU1FVQVNIRlMgZXJyb3I6IEZhaWxlZCB0byByZWFkIGJsb2NrIDB4ZDI5MWMyOiAtNQo+ID4g
U1FVQVNIRlMgZXJyb3I6IGx6byBkZWNvbXByZXNzaW9uIGZhaWxlZCwgZGF0YSBwcm9iYWJseSBj
b3JydXB0Cj4gPiBTUVVBU0hGUyBlcnJvcjogRmFpbGVkIHRvIHJlYWQgYmxvY2sgMHhkMjkxYzI6
IC01Cj4gPiBTUVVBU0hGUyBlcnJvcjogVW5hYmxlIHRvIHJlYWQgZGF0YSBjYWNoZSBlbnRyeSBb
ZDI5MWMyXQo+ID4gU1FVQVNIRlMgZXJyb3I6IFVuYWJsZSB0byByZWFkIHBhZ2UsIGJsb2NrIGQy
OTFjMiwgc2l6ZSAxNDMwNwo+ID4gU1FVQVNIRlMgZXJyb3I6IFVuYWJsZSB0byByZWFkIGRhdGEg
Y2FjaGUgZW50cnkgW2QyOTFjMl0KPiA+IFNRVUFTSEZTIGVycm9yOiBVbmFibGUgdG8gcmVhZCBw
YWdlLCBibG9jayBkMjkxYzIsIHNpemUgMTQzMDcKPiA+IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5j
aW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0IQo+ID4gZXhpdGNvZGU9MHgwMDAwMDAwNyBDUFU6
IDAgUElEOiAxIENvbW06IGluaXQgTm90IHRhaW50ZWQgNi4zLjArICMxMDUKPiA+IEhhcmR3YXJl
IG5hbWU6IEdlbmVyaWMgQU0zM1hYIChGbGF0dGVuZWQgRGV2aWNlIFRyZWUpCj4gPiAgdW53aW5k
X2JhY2t0cmFjZSBmcm9tIHNob3dfc3RhY2srMHhiLzB4Ywo+ID4gIHNob3dfc3RhY2sgZnJvbSBk
dW1wX3N0YWNrX2x2bCsweDJiLzB4MzQKPiA+ICBkdW1wX3N0YWNrX2x2bCBmcm9tIHBhbmljKzB4
YmQvMHgyMzAKPiA+ICBwYW5pYyBmcm9tIG1ha2VfdGFza19kZWFkKzB4MS8weDEyMAo+ID4gIG1h
a2VfdGFza19kZWFkIGZyb20gMHhjMTAyY2E4MAo+ID4gLS0tWyBlbmQgS2VybmVsIHBhbmljIC0g
bm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIGluaXQhCj4gPiBleGl0Y29kZT0weDAwMDAw
MDA3IF0tLS0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
