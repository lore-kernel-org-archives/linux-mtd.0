Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267B3EDE99C
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAsQtqhj/Dd5VdsE89i/5GTLimcsCWU4GzDrdNd2TF4=; b=bqy2KoRDY1Toef
	iursImtVYMiNNvGpgDgFVTA7c3/ZnBr8cAelx2fUT8NztIfCQ1t/oV2FEKO0mduJnfi0CXUMq2LNR
	/+CSG0Yq/Q1yQvYcySM4URLCugKro+eP0ZH9L0TsWAWweFSmbnteUYbfRqG53Fph+HvGGOtfcLamI
	IQjmIg+ysIdawVq3XkNiCzrq2j1NxsMkmozcGvSuMU2lxH4AgRxDQ0PQN0C2Y1sIyalhxODR5Ckka
	Qq6LZkUBLKdR+oq67Y87xAXb5uXLSgb85hlj3E+P6ieCsJjdczj8qUqsxOx7diSEU9YNxHpl7zaZM
	p86VX3D8gWY7lXfda+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiZo-007pLo-36;
	Thu, 14 Sep 2023 09:23:56 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiZl-007pLG-25
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 09:23:55 +0000
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d8165e3b209so1892961276.1
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 02:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694683431; x=1695288231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06DS2fR61f3yXke4mGJSuRI8ZLdRO6K9dsiHVcoB9lE=;
        b=ROOyCmNz8HqT4VrY16PQh2TbINhlrAxm7ObSOOCJH6KlWxmvAXJVVgI1vZgbyLIAIw
         +0YPyeC/ozsbLUkFMnWgS5/cOzWLfTrv6SQG0gPWkrKK+6ssVWkwNYkJjSiJUMeczF04
         hz80V8jmJFXl5MLiKKgKyQ6EkGETpfuRRRkgqQOnUKvE5554DNmtB/tuW5Cfw0Ip6X2Q
         C+2jFDTKrw5MlRrAVhYeCWJla2cxfxZke3NcIFQACKNiLCrODNkPMztIH9RAZSx7fGm+
         OWD3l28AwMwfMsqfxB5Nt1J7pR7ylB1WDASrhqcaHCe7/Lc9tAsRoSCqVcN5MSB/6pFH
         0jcA==
X-Gm-Message-State: AOJu0Ywz3FatdUM/eW5lQf4FwTUW8vAAi203c2ck2qWW8UM0m9WiHRda
	wB4d5aV6jW7ejYsBjjwtvaFpyzsnxRYQ6Q==
X-Google-Smtp-Source: AGHT+IG724mqVp720DCPasRqFmZ4DTjePjUm8hjx38/Fi7luSltn8+k4HjmEuLaNqK8Ve8QyroS1BQ==
X-Received: by 2002:a25:c747:0:b0:d78:2258:f5b8 with SMTP id w68-20020a25c747000000b00d782258f5b8mr838907ybe.19.1694683431103;
        Thu, 14 Sep 2023 02:23:51 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id s13-20020a25aa0d000000b00d81479172f8sm254911ybi.5.2023.09.14.02.23.49
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 02:23:49 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-58dfe2d5b9aso10820867b3.1
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 02:23:49 -0700 (PDT)
X-Received: by 2002:a81:8450:0:b0:59b:cfc1:8dfc with SMTP id
 u77-20020a818450000000b0059bcfc18dfcmr972705ywf.0.1694683429437; Thu, 14 Sep
 2023 02:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
 <TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org> <CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
 <20230914105937.4af00bf2@xps-13> <CAMuHMdX8Vg2M2K3U_sbAtVk+6VDvL+GNYtbs5FTTRZzRvVGPCQ@mail.gmail.com>
 <20230914111200.6e6832ca@xps-13>
In-Reply-To: <20230914111200.6e6832ca@xps-13>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Sep 2023 11:23:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVryt5bTk8HeFMS3NU-4EpQdU3Tf6LiGmGQQ5bVD-Emsg@mail.gmail.com>
Message-ID: <CAMuHMdVryt5bTk8HeFMS3NU-4EpQdU3Tf6LiGmGQQ5bVD-Emsg@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash type
To: Miquel Raynal <miquel.raynal@bootlin.com>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, 
	MTD Maling List <linux-mtd@lists.infradead.org>, linux-spi <linux-spi@vger.kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Michael Walle <michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_022353_687181_630180E7 
X-CRM114-Status: GOOD (  41.39  )
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

SGkgTWlxdWVsLAoKT24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTE6MTLigK9BTSBNaXF1ZWwgUmF5
bmFsCjxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiBnZWVydEBsaW51eC1tNjhr
Lm9yZyB3cm90ZSBvbiBUaHUsIDE0IFNlcCAyMDIzIDExOjA0OjAxICswMjAwOgo+ID4gT24gVGh1
LCBTZXAgMTQsIDIwMjMgYXQgMTA6NTnigK9BTSBNaXF1ZWwgUmF5bmFsCj4gPiA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPiA+IGdlZXJ0QGxpbnV4LW02OGsub3JnIHdyb3Rl
IG9uIFRodSwgMTQgU2VwIDIwMjMgMTA6MzQ6NTAgKzAyMDA6Cj4gPiA+ID4gT24gVGh1LCBTZXAg
MTQsIDIwMjMgYXQgMTA6MDjigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCj4gPiA+ID4gPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiBPbiAzMC8wOC8yMDIz
IDE3OjE4LCBCaWp1IERhcyB3cm90ZToKPiA+ID4gPiA+ID4+PiAgICAgICAgICAgICAgICAgcmVn
bWFwX3VwZGF0ZV9iaXRzKHJwYy0+cmVnbWFwLCBSUENJRl9DTU5DUiwgQEAgLTc3NCw2Cj4gPiA+
ID4gPiA+Pj4gKzc3NiwxMiBAQCBzdGF0aWMgaW50IHJwY2lmX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gPiA+ID4gPiA+Pj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7
Cj4gPiA+ID4gPiA+Pj4gICAgICAgICB9Cj4gPiA+ID4gPiA+Pj4KPiA+ID4gPiA+ID4+PiArICAg
ICAgIGlmIChycGMtPmluZm8tPnR5cGUgPT0gUlBDSUZfUlpfRzJMICYmCj4gPiA+ID4gPiA+Pgo+
ID4gPiA+ID4gPj4gV291bGRuJ3QgdGhpcyBhcHBseSB0byBub24tUlovRzJMIHN5c3RlbXMsIHRv
bz8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSXQgYXBwbGllcywgaWYgdGhlIGRldmljZSB1c2Vz
IHRoZSBmbGFzaFsxXSBvciBbMl0gYW5kIGl0IG5lZWRzCj4gPiA+ID4gPiA+IDQtYml0IHR4IHN1
cHBvcnQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFsxXSBGaWd1cmUgMjA6IFFVQUQgSU5QVVQv
T1VUUFVUIEZBU1QgUkVBRCDigJMgRUJoL0VDaAo+ID4gPiA+ID4gPiBodHRwczovL21lZGlhLXd3
dy5taWNyb24uY29tLy0vbWVkaWEvY2xpZW50L2dsb2JhbC9kb2N1bWVudHMvcHJvZHVjdHMvZGF0
YS1zaGVldC9ub3ItZmxhc2gvc2VyaWFsLW5vci9tdDI1cS9kaWUtcmV2LWEvbXQyNXFfcWxrc191
XzUxMl9hYmFfMC5wZGY/cmV2PTNlNWIyYTU3NGY3YjQ3OTBiNmU1OGRhY2Y0Yzg4OWIyCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IFsyXSBzZWN0aW9uIDguMTQKPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gaHR0cHM6Ly93d3cucmVuZXNhcy5jb20vZXUvZW4vZG9jdW1lbnQvZHN0L2F0MjVxbDEyOGEt
ZGF0YXNoZWV0P3I9MTYwODU4Ngo+ID4gPiA+ID4KPiA+ID4gPiA+IEdlZXJ0LAo+ID4gPiA+ID4K
PiA+ID4gPiA+IERvZXMgaXQgYW5zd2VyIHlvdXIgY29tbWVudCBvciBkbyB5b3UgZXhwZWN0IGhl
cmUgc29tZSBjaGFuZ2VzPwo+ID4gPiA+Cj4gPiA+ID4gV2VsbCwgbm93IGl0IGhhcyBiZWVuIGNv
bmZpcm1lZCB0aGlzIGFwcGxpZXMgdG8gbm9uLVJaL0cyTCBzeXN0ZW1zLCB0b28sCj4gPiA+ID4g
dGhlIGNoZWNrIGZvciBSUENJRl9SWl9HMkwgc2hvdWxkIHByb2JhYmx5IGJlIHJlbW92ZWQuICBJ
biB1cHN0cmVhbSwKPiA+ID4gPiBvbmx5IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcy
bHssY30tc21hcmMtc29tLmR0c2kgaGF2ZSBkZXZpY2VzCj4gPiA+ID4gdGhhdCBhcmUgY29tcGF0
aWJsZSB3aXRoICJtaWNyb24sbXQyNXF1NTEyYSIsIGJ1dCBvYnZpb3VzbHkgdGhleSBjYW4KPiA+
ID4gPiBhcHBlYXIgZWxzZXdoZXJlLCB0b28uCj4gPiA+ID4KPiA+ID4gPiBOb3csIHRoZSBwcmVz
ZW5jZSBvZiB0aGF0IGNvbXBhdGlibGUgdmFsdWUgaW4gcnpnMmx7LGN9LXNtYXJjLXNvbS5kdHNp
Cj4gPiA+ID4gY3VycmVudGx5IGNhdXNlcyBhIGR0YnNfY2hlY2sgd2FybmluZywgYXMgaXQgaXMg
bm90IGRvY3VtZW50ZWQuCj4gPiA+ID4gSG93ZXZlciwgdGhlcmUgaGFzIGJlZW4gc29tZSBwdXNo
YmFjayBhZ2FpbnN0IGFkZGluZyBtb3JlIGNvbXBhdGlibGUKPiA+ID4gPiB2YWx1ZXMsIGNmci4g
bXkgcGF0Y2ggdG8gYWRkIG10MjVxdTUxMmFbMV0sIGFuZCBNaXF1ZWwncyBjb21taXQgWzJdLgo+
ID4gPgo+ID4gPiBKdXN0IEZZSSwgSSBzZW50IFsyXSBhZnRlciBhbiB1bnN1Y2Nlc3NmdWwgYXR0
ZW1wdCB0byB1cGRhdGUgdGhhdCBsaXN0Cj4gPiA+IHRvbywgc2VlIFszXS4gVGhlIGlkZWEgaXM6
IGlmIHlvdSBkb24ndCBoYXZlIGFueXRoaW5nIHVzZWZ1bCB0byBhZGQsCj4gPgo+ID4gT2gsIEkg
ZGlkbid0IGtub3cgdGhhdC4KPiA+Cj4gPiA+IGp1c3QgdXNlIHRoZSBnZW5lcmljIGNvbXBhdGli
bGUuIElmIHlvdSBuZWVkIHNwZWNpZmljIGNoYW5nZXMsIHlvdSBjYW4KPiA+ID4gYWRkIGFuIGVu
dHJ5Lgo+ID4KPiA+IFRoZSBwcm9ibGVtIGlzIHRoYXQgdXN1YWxseSB0aGVzZSB0aGluZ3MgYXJl
IGRpc2NvdmVyZWQgdG9vIGxhdGUsCj4gPiBzbyB0aGUgb25seSBwcnVkZW50IHdheSBpcyB0byBi
ZSBwcm9hY3RpdmUsIGFuZCBhbHdheXMgYWRkIHRoZW0uCj4gPiBJbml0aWFsbHkgSSB0aG91Z2h0
IHRoYXQgdGhlIGRpZmZlcmVudCBoYW5kbGluZyBvbiBSWi9HMkwgd2FzIGR1ZQo+ID4gdG8gYSBk
aWZmZXJlbmNlIGluIHRoZSBSUEMtSUYgYmxvY2suICBCdXQgbm93IHdlIGtub3cgaXQncyBkdWUg
dG8gdGhlCj4gPiB0eXBlIG9mIEZMQVNIIGF0dGFjaGVkLgo+Cj4gQWN0dWFsbHkgd2hhdCBJIHNh
eSBpcyB3cm9uZywgd2UgYXJlIG5vdCBzdXBwb3NlZCB0byB0b3VjaCB0aGF0IGxpc3QKPiBhbnlt
b3JlIGFuZCBwcmVmZXIgdG8gaGFuZGxlIHRoZSBpc3N1ZXMgaW4gdGhlIGRyaXZlcnMgYnkKPiBh
dXRvLWRpc2NvdmVyeS4gQ2FuJ3Qgd2UgZG8gdGhhdCBpbiB5b3VyIGNhc2U/CgpJJ20gbm90IHN1
cmUgd2UgY2FuIGRvIHRoYXQsIGFzIHRoaXMgY29kZSBpcyBwYXJ0IG9mIHRoZSBoYXJkd2FyZQpp
bml0aWFsaXphdGlvbiBkdXJpbmcgcHJvYmluZy4KQmlqdTogaXMgdGhpcyBuZWVkZWQgdGhhdCBl
YXJseSwgb3IgY2FuIGl0IGJlIGRvbmUgbGF0ZXIsIGFmdGVyIHRoZSBjb25uZWN0ZWQKZGV2aWNl
IGhhcyBiZWVuIGlkZW50aWZpZWQ/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
