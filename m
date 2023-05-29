Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87DDC77B7A
	for <linux-mtd@archiver.kernel.org>; Mon, 29 May 2023 10:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cpw9CO2cGhBM9TNEmR641SOlEDg3GMH1DWYUl/CwxLs=; b=dMDARert5YYf2m
	04s4YhY9TJOxDBGBMVPBBHloaxlOJc7MG6QDNOZlF4c8sI5raXnaXpxyx5QTFYKZrfk41s2fE19OR
	djQfRdsiRyeeF2i6hcQFu1Xq0y8I3Mj/Wz/xc6+anO23b9ZeMXqaiGC4ydLoOQIz63GLWGf7TQEew
	N9lazhr8yEnhL5cEb4ntiUXUj6XIRWKnNKwio1eAKfjGeRDGi9wLreegwxHA+nyvxvxJqRoE+CC8F
	MZt7vySlek0+ZBK6B1JNF4759oWhygonLbrtjgwjtUkK1rMZPlgZ1vi/TU1FcVle7VU1Bf+xgn99e
	7YyiSpzgFtf/wcw3Rizg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aBk-00A7wj-2a;
	Mon, 29 May 2023 10:33:20 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3aBh-00A7vn-2M
	for linux-mtd@lists.infradead.org;
	Mon, 29 May 2023 10:33:19 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-25669acf1b0so1178009a91.0
        for <linux-mtd@lists.infradead.org>; Mon, 29 May 2023 03:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685356396; x=1687948396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyGVJxlazH/p9vYGPiZPiPljRdwr4cdfAmfhGdlR8cg=;
        b=pRLFcj3K1TdYtOVQ1jpYPqFV7ACPYTD0pW0vj+Ex3hFaoXfvCVRThzAUiM7+lQ0WCB
         SDs5qTJUtDd3rQz8PMXfJapr+MfO9csPcu+1YecO+hS320Dwd53PQXCsHx7hPDx19Tju
         QovMsmRxKmEMuXR4rE0O6AIoqn0IEkljKcF8I8HwPhBc5HLceMcsimodxaVW6h/z5FZj
         aBCK/FnW/xyLuxf5NsOcmVv2LQCAE0CrG/9g/VVFTvZ43Z/5MmB1upGBUrxwVoY3F4D2
         xmlzoitIjBAgHcIHEODAVebgKgPksB9N56A7TBLYuuw49rzVvHOL8gvQ5P+5ipN7gKRj
         nXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685356396; x=1687948396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyGVJxlazH/p9vYGPiZPiPljRdwr4cdfAmfhGdlR8cg=;
        b=g8Bo4HQtjnmH4pflr3c19RawjTDghJbmzZKd5av92nR7VVHHJv0/9x/UR4v9f1q3Uw
         kg8Grycbhfd8F3GeiGL7tfAVC+GwgP6cw3XHmNLg0k4xJP1vilyNm0xWE9Nnjy0PPcce
         thnCZIYSdSHigUS9PWlj+Uzim0yQx5+nsEDpiMLbHi8i0u+UmYP3UCL5ODHqLDY6VEOw
         YF3zr1ipLUY+KIiXXWkGq7/jzFdIwYjkIPIJTyWHVePC4DyeQ/cubEnvF6BzU84tEatl
         NXSkjPLhKwFp1w468mtR8AgQJ+TGG6G/eJ971+Uq/cmnjNWVwQuwGT9J02xb+OooTk9m
         HA5A==
X-Gm-Message-State: AC+VfDzh2tK0GBOwh4QLKqID3z2Sv5lrT9lnBkopTkhi+yVwFjAmpxMo
	P51+J/wGVKhxxFvnDcJpAzgU4k3RjOaZDHtWkMM=
X-Google-Smtp-Source: ACHHUZ6pkDgNDIPY3JNnr12L/N9MqYpoc65i6OTaVscLEhB9XlFnQwZpjlicXjqWesk8ieMh7TlR4G+gRkrrd1JasIs=
X-Received: by 2002:a17:90a:8a86:b0:24d:ebfe:be93 with SMTP id
 x6-20020a17090a8a8600b0024debfebe93mr9938800pjn.37.1685356395580; Mon, 29 May
 2023 03:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
 <20230526201420.231092a0@xps-13> <CAP1tNvQsmYKMHZ662f1yiLv2JmZZrnQsJr2Lf5xiafxJSkZfBQ@mail.gmail.com>
 <20230529101240.53065e04@xps-13>
In-Reply-To: <20230529101240.53065e04@xps-13>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Mon, 29 May 2023 13:33:04 +0300
Message-ID: <CAP1tNvRTRkXMztGL=nxrd-Cv5xO58-R=A_M2r65d6cyidoVz0g@mail.gmail.com>
Subject: Re: Boot failed after patch "mtd: rawnand: Support for sequential
 cache reads"
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: JaimeLiao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_033317_766024_FBBB0311 
X-CRM114-Status: GOOD (  21.24  )
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

0L/QvSwgMjkg0LzQsNGPIDIwMjPigK/Qsy4g0LIgMTE6MTIsIE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+OgouLi4KQWNjb3JkaW5nIHRvIHRoZSBNVDI5RjJHMDhBQkFF
QVdQIGRhdGFzaGVldCwgdGhlIGNoaXAgc3VwcG9ydHMKPiA+IHRoZSBSRUFEIFBBR0UgQ0FDSEUg
U0VRVUVOVElBTCBvcGNvZGUsIGJ1dCB3aXRoIHR3byBjYXZlYXRzOgo+ID4gIDQuIFRoZXNlIGNv
bW1hbmRzIHN1cHBvcnRlZCBvbmx5IHdpdGggRUNDIGRpc2FibGVkLgo+ID4gIDUuIElzc3Vpbmcg
YSBSRUFEIFBBR0UgQ0FDSEUgc2VyaWVzICgzMWgsIDAwaC0zMWgsIDNGaCkgY29tbWFuZAo+ID4g
ICB3aGVuIHRoZSBhcnJheSBpcyBidXN5IChSRFkgPSAxLCBBUkRZID0gMCkgaXMgc3VwcG9ydGVk
IGlmIHRoZSBwcmV2aW91cwo+ID4gICBjb21tYW5kIHdhcyBhIFJFQUQgUEFHRSAoMDBoLTMwaCkg
b3IgUkVBRCBQQUdFIENBQ0hFIHNlcmllcwo+ID4gICBjb21tYW5kOyBvdGhlcndpc2UsIGl0IGlz
IHByb2hpYml0ZWQuCj4gPgo+ID4gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCwgdGhlIHNlY29uZCBy
ZW1hcmsgc3VpdHMgdXMsIHNpbmNlIHdlIGNyZWF0ZQo+ID4gdGhlIGNvcnJlY3Qgc2VxdWVuY2Uu
Cj4KPiBFeGFjdGx5LCB3ZSBkbzoKPgo+ICAgICAgICAgUkVBRDAgKDApLCBSRUFEU1RBUlQgKDMw
KSwKPiAgICAgICAgIFJFQURDQUNIRVNFUSAoMzEpLCBkYXRhLAo+ICAgICAgICAgUkVBRENBQ0hF
U0VRICgzMSksIGRhdGEsCj4gICAgICAgICAuLi4KPiAgICAgICAgIFJFQURDQUNIRUVORCAoM2Yp
LCBkYXRhLgo+Cj4gd2hpY2ggaXMgd2hhdCB0aGUgZGF0YXNoZWV0IHRlbGxzIHVzIEkgYmVsaWV2
ZS4KPgo+ID4gQnV0IHRoZSBmaXJzdCByZW1hcmsgY2FuIGJlIGEgcHJvYmxlbSBpbiB0aGlzIGNh
c2UuCj4KPiBJIHdhcyBub3QgYXdhcmUgb2YgdGhpcyBsaW1pdGF0aW9uLCBpdCdzIG9ubHkgd3Jp
dHRlbiBpbiB0aGUgc3VtbWFyeSwKPiBub3QgaW4gdGhlIGRldGFpbHMgYWJvdXQgdGhlIGNvbW1h
bmRzLCBuaWNlIGZpbmRpbmcuIFdlIG5lZWQgdG8gcHJldmVudAo+IG9uLWRpZSBFQ0MgdXNlcnMg
ZnJvbSBlbmFibGluZyB0aGlzIGZlYXR1cmUuCj4KPiBCdXQgZ2l2ZW4gdGhlIGJlbG93IHRyYWNl
LCB5b3UncmUgbm90IHVzaW5nIHRoZSBvbi1kaWUgRUNDIGVuZ2luZSwKPiByaWdodD8gSXQgbG9v
a3MgbGlrZSB5b3UncmUgdXNpbmcgdGhlIGNvbnRyb2xsZXIncyBFTE0gZW5naW5lIHRvCj4gcGVy
Zm9ybSBFQ0MgY29ycmVjdGlvbiwgc28gSSBkb24ndCBzZWUgd2h5IHRoaXMgc3BlY2lmaWMgbGlt
aXRhdGlvbgo+IHdvdWxkIGhpdCB1cy4gQ2FuIHlvdSBjb25maXJtIHRoZSBFQ0MgZW5naW5lIG9m
IHRoZSBjaGlwIGlzIGRpc2FibGVkPwoKWWVzLCBvbi1kaWUgRUNDIGlzIGRpc2FibGVkLgpQbGVh
c2UgYWR2aXNlIHdoZXJlIEkgY2FuIGluc2VydCBzb21lIGRlYnVnIG1lc3NhZ2VzIHRvIGNsZWFy
IHRoaW5ncyB1cC4KCj4gPiA+ID4gb21hcC1ncG1jIDUwMDAwMDAwLmdwbWM6IEdQTUMgcmV2aXNp
b24gNi4wCj4gPiA+ID4gLi4uCj4gPiA+ID4gbmFuZDogZGV2aWNlIGZvdW5kLCBNYW51ZmFjdHVy
ZXIgSUQ6IDB4MmMsIENoaXAgSUQ6IDB4ZGEKPiA+ID4gPiBuYW5kOiBNaWNyb24gTVQyOUYyRzA4
QUJBRUFXUAo+ID4gPiA+IG5hbmQ6IDI1NiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwg
cGFnZSBzaXplOiAyMDQ4LCBPT0Igc2l6ZTogNjQKPiA+ID4gPiBuYW5kOiB1c2luZyBPTUFQX0VD
Q19CQ0g4X0NPREVfSFcgRUNDIHNjaGVtZQo+ID4gPiA+IC4uLgo+ID4gPiA+IFZGUzogTW91bnRl
ZCByb290IChzcXVhc2hmcyBmaWxlc3lzdGVtKSByZWFkb25seSBvbiBkZXZpY2UgMjU0OjAuCj4g
PiA+ID4gZGV2dG1wZnM6IG1vdW50ZWQKPiA+ID4gPiBGcmVlaW5nIHVudXNlZCBrZXJuZWwgaW1h
Z2UgKGluaXRtZW0pIG1lbW9yeTogMTAyNEsKPiA+ID4gPiBSdW4gL3NiaW4vaW5pdCBhcyBpbml0
IHByb2Nlc3MKPiA+ID4gPiBTUVVBU0hGUyBlcnJvcjogbHpvIGRlY29tcHJlc3Npb24gZmFpbGVk
LCBkYXRhIHByb2JhYmx5IGNvcnJ1cHQKPiA+ID4gPiBTUVVBU0hGUyBlcnJvcjogRmFpbGVkIHRv
IHJlYWQgYmxvY2sgMHhkMjkxYzI6IC01Cj4gPiA+ID4gU1FVQVNIRlMgZXJyb3I6IGx6byBkZWNv
bXByZXNzaW9uIGZhaWxlZCwgZGF0YSBwcm9iYWJseSBjb3JydXB0Cj4gPiA+ID4gU1FVQVNIRlMg
ZXJyb3I6IEZhaWxlZCB0byByZWFkIGJsb2NrIDB4ZDI5MWMyOiAtNQo+ID4gPiA+IFNRVUFTSEZT
IGVycm9yOiBVbmFibGUgdG8gcmVhZCBkYXRhIGNhY2hlIGVudHJ5IFtkMjkxYzJdCj4gPiA+ID4g
U1FVQVNIRlMgZXJyb3I6IFVuYWJsZSB0byByZWFkIHBhZ2UsIGJsb2NrIGQyOTFjMiwgc2l6ZSAx
NDMwNwo+ID4gPiA+IFNRVUFTSEZTIGVycm9yOiBVbmFibGUgdG8gcmVhZCBkYXRhIGNhY2hlIGVu
dHJ5IFtkMjkxYzJdCj4gPiA+ID4gU1FVQVNIRlMgZXJyb3I6IFVuYWJsZSB0byByZWFkIHBhZ2Us
IGJsb2NrIGQyOTFjMiwgc2l6ZSAxNDMwNwo+ID4gPiA+IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5j
aW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0IQo+ID4gPiA+IGV4aXRjb2RlPTB4MDAwMDAwMDcg
Q1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0YWludGVkIDYuMy4wKyAjMTA1Cj4gPiA+ID4g
SGFyZHdhcmUgbmFtZTogR2VuZXJpYyBBTTMzWFggKEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSkKPiA+
ID4gPiAgdW53aW5kX2JhY2t0cmFjZSBmcm9tIHNob3dfc3RhY2srMHhiLzB4Ywo+ID4gPiA+ICBz
aG93X3N0YWNrIGZyb20gZHVtcF9zdGFja19sdmwrMHgyYi8weDM0Cj4gPiA+ID4gIGR1bXBfc3Rh
Y2tfbHZsIGZyb20gcGFuaWMrMHhiZC8weDIzMAo+ID4gPiA+ICBwYW5pYyBmcm9tIG1ha2VfdGFz
a19kZWFkKzB4MS8weDEyMAo+ID4gPiA+ICBtYWtlX3Rhc2tfZGVhZCBmcm9tIDB4YzEwMmNhODAK
PiA+ID4gPiAtLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRv
IGtpbGwgaW5pdCEKPiA+ID4gPiBleGl0Y29kZT0weDAwMDAwMDA3IF0tLS0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
