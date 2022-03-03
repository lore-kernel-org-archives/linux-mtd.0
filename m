Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3559FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 08:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnG+vhXGyUyZtAqgw3ZYJr2e1sJevT6qyeorxwvBCV0=; b=EtB/SQhBpTtyIn
	XP6aZTENkDzztnPYxVcLR4m5skzL+Doj7MeSYH2Ld4h2eYThutkfj2H5OhNmUb97XpzZLU0ej2dp1
	vqrt9JnBxJ/DAfUPO3QDkkAzmsvE0gXHrJ3gqZoN4JARRSKMePVBq7ZHJn9WsNBPIOZHqLesS3s9o
	z5WlFHc/IVQpC9q88eC9SctQREapWKpP2lpiAQkKqOYGSFrq9UNqBfo6BpwMhtOep0hH5xpCxqCnW
	6PChMoBsPyt32+aDaKQXonV+TLcYaU7jC3D/B1Xo/Bk/4cD0JhAhaZZXkQgOPmacuuRjdGOEcIO2T
	PZv18Pp5yuLfFzAgR6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPgtF-005m35-6Z; Thu, 03 Mar 2022 08:32:49 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPgtC-005m1v-5i
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2022 08:32:48 +0000
Received: by mail-lj1-x231.google.com with SMTP id o6so5770754ljp.3
 for <linux-mtd@lists.infradead.org>; Thu, 03 Mar 2022 00:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=DBFYMKAkX/+X4ffNw6h4ygU2WXIfLsougJ0b6s/z1mE=;
 b=KOqgA6AAztWzmSbNCZkD/x3REvvm47jEcpi9jyZM0WjbKW2i30ZuSlf1mEVyp8lSKz
 uQYoClbXREjv1XpMOBXcijZ1/1CbNG3FYG20o1l9VO/RDfClRs8K1B71GEp3pU/tHbcS
 KwZf+hBLO6Oia/I1W7I+wtGm8drUmgkWLwv8K5giTXC0JqRxJL0WWHo/4/Wd4j7VRS45
 +1EBbTrtlSn+zQo4a5eIgS2/KG78dCedkA2ZtCFnbrRoh/+slt/zB3h+XML9y7hLkPeH
 ad1OkqRnAtnW18AjWUPre2fFSeivjXB6t03OW9DA8MUI3nksERPKIVVY1a6sMokYxrvc
 O6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DBFYMKAkX/+X4ffNw6h4ygU2WXIfLsougJ0b6s/z1mE=;
 b=uE26s/qUKPKofuxu/ubHM5r6DmIkipsgHGIcub4FdZWcv+HJvsIJu3n/iTti9/kLrD
 Tzp8xTnfS56xvO5xForm4/SCmSgPAxcNfgsy/U/5hXRRAdNEGK661/EwPtCfpw3o7eWC
 GStU1JmfrHM8IZtyT7p4threljq5SKXPhfnO0n8TY9Ut9J8e/E2n+6n4KjEHp/SPekmD
 lvhfmV4wDh+uaLvDTuBIoeaXzOnZkbpKDgWMfAhR+aiafX0D+4q3DF1VCJcrmx51l3xK
 0J7mNDGDIa4PTcMp9xMCrhpJG9qrbQdw3VHTSewNftBl11PQXal6/KDOmzSYn06K3tHf
 b5Wg==
X-Gm-Message-State: AOAM5318TuYvzvSkJRmPlvU44ZbSkt4mJFUL9/x9wIiqsQ6xF62YM2Gm
 s6dkhEtwl9PzJ+UrgziiU90=
X-Google-Smtp-Source: ABdhPJwxQD23hLO7eHUX3JyISNNuANHEqy+kAaWJrtsZxN6MGxGebaLJwTJhApHPECnaXU3+Kv3+mA==
X-Received: by 2002:a2e:b5cb:0:b0:246:4e4e:45f4 with SMTP id
 g11-20020a2eb5cb000000b002464e4e45f4mr22877087ljn.407.1646296363738; 
 Thu, 03 Mar 2022 00:32:43 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id
 n8-20020a2e7208000000b00233697d2d9bsm331541ljc.12.2022.03.03.00.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 00:32:43 -0800 (PST)
Message-ID: <fb18b5e2-d273-adf6-3e14-77628abc4560@gmail.com>
Date: Thu, 3 Mar 2022 09:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] dt-bindings: mtd: partitions: add UBI binding
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tom Rini <trini@konsulko.com>,
 Ricardo Salveti <ricardo@foundries.io>,
 Michal Simek <michal.simek@xilinx.com>,
 Jorge Ramirez-Ortiz <jorge@foundries.io>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220217102448.27586-1-zajec5@gmail.com>
 <Yh/ovYMV104jc+CE@robh.at.kernel.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <Yh/ovYMV104jc+CE@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_003246_243347_E0D00C17 
X-CRM114-Status: GOOD (  23.94  )
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

T24gMi4wMy4yMDIyIDIyOjU5LCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBUaHUsIEZlYiAxNywg
MjAyMiBhdCAxMToyNDo0OEFNICswMTAwLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4+IEZyb206
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4KPj4gVUJJIGlzIG9mdGVuIHVz
ZWQgb24gZW1iZWRkZWQgZGV2aWNlcyB0byBzdG9yZSBVQkkgdm9sdW1lcyB3aXRoIGRldmljZQo+
PiBjb25maWd1cmF0aW9uIC8gY2FsaWJyYXRpb24gZGF0YS4gU3VjaCB2b2x1bWVzIG1heSBuZWVk
IHRvIGJlIGRvY3VtZW50ZWQKPj4gYW5kIHJlZmVyZW5jZWQgZm9yIHByb3BlciBib290ICYgc2V0
dXAuCj4+Cj4+IFNvbWUgZXhhbXBsZXM6Cj4+IDEuIFUtQm9vdCBlbnZpcm9ubWVudCB2YXJpYWJs
ZXMKPj4gMi4gRGV2aWNlIGNhbGlicmF0aW9uIGRhdGEKPj4gMy4gRGVmYXVsdCBzZXR1cCAoZS5n
LiBpbml0aWFsIHBhc3N3b3JkKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kg
PHJhZmFsQG1pbGVja2kucGw+Cj4+IC0tLQo+PiAgIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9u
cy91YmkueWFtbCAgICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLnlhbWwKPj4KPj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0
aW9ucy91YmkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFy
dGl0aW9ucy91YmkueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLmNkMDgxZjA2ZDRjYgo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91YmkueWFtbAo+PiBAQCAtMCww
ICsxLDY3IEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlCj4+ICslWUFNTCAxLjIKPj4gKy0tLQo+PiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9tdGQvcGFydGl0aW9ucy91YmkueWFtbCMKPj4gKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRs
ZTogVUJJIChVbnNvcnRlZCBCbG9jayBJbWFnZXMpIGRldmljZQo+PiArCj4+ICtkZXNjcmlwdGlv
bjogfAo+PiArICBVQkkgaXMgYSBsYXllciBwcm92aWRpbmcgbG9naWNhbCB2b2x1bWVzIChjb25z
aXN0aW5nIG9mIGxvZ2ljYWwgYmxvY2tzKSBvbiB0b3AKPj4gKyAgb2YgcmF3IGZsYXNoIGRldmlj
ZXMuIEl0IGRlYWxzIHdpdGggbG93LWxldmVsIGZsYXNoIGlzc3VlcyAoYml0LWZsaXBzLCBiYWQK
Pj4gKyAgcGh5c2ljYWwgZXJhc2VibG9ja3MsIHdlYXJpbmcpIHByb3ZpZGluZyBhIHJlbGlhYmxl
IGRhdGEgc3RvcmFnZS4KPj4gKwo+PiArICBVQkkgZGV2aWNlIGlzIGJ1aWx0IGFuZCBzdG9yZWQg
aW4gYSBzaW5nbGUgZmxhc2ggcGFydGl0aW9uLgo+PiArCj4+ICsgIFNvbWUgKHVzdWFsbHkgZW1i
ZWRkZWQpIGRldmljZXMgdXNlIFVCSSB2b2x1bWVzIG9mIHNwZWNpZmljIG5hbWVzIG9yIGluZGV4
ZXMKPj4gKyAgdG8gc3RvcmUgc2V0dXAgLyBjb25maWd1cmF0aW9uIGRhdGEuIFRoaXMgYmluZGlu
ZyBhbGxvd3MgZGVzY3JpYmluZyBzdWNoCj4+ICsgIHZvbHVtZXMgc28gdGhleSBjYW4gYmUgaWRl
bnRpZmllZCBhbmQgcmVmZXJlbmNlZCBieSBjb25zdW1lcnMuCj4+ICsKPj4gK21haW50YWluZXJz
Ogo+PiArICAtIFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gKwo+PiArYWxs
T2Y6Cj4+ICsgIC0gJHJlZjogcGFydGl0aW9uLnlhbWwjCj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+
ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IHViaQo+PiArCj4+ICtwYXR0ZXJuUHJvcGVy
dGllczoKPj4gKyAgIl52b2x1bWUtWzAtOWEtZl0rJCI6Cj4+ICsgICAgdHlwZTogb2JqZWN0Cj4+
ICsgICAgZGVzY3JpcHRpb246IFVCSSB2b2x1bWUKPj4gKyAgICBwcm9wZXJ0aWVzOgo+PiArICAg
ICAgdm9sdW1lLW5hbWU6Cj4+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3N0cmluZwo+PiArICAgICAgdm9sdW1lLWlkOgo+PiArICAgICAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPj4gKyAgICBhbnlPZjoKPj4g
KyAgICAgIC0gcmVxdWlyZWQ6Cj4+ICsgICAgICAgICAgLSB2b2x1bWUtbmFtZQo+PiArICAgICAg
LSByZXF1aXJlZDoKPj4gKyAgICAgICAgICAtIHZvbHVtZS1pZAo+PiArCj4+ICt1bmV2YWx1YXRl
ZFByb3BlcnRpZXM6IGZhbHNlCj4+ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICBw
YXJ0aXRpb25zIHsKPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsK
Pj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+ICsgICAgICAgICNzaXplLWNlbGxz
ID0gPDE+Owo+PiArCj4+ICsgICAgICAgIHBhcnRpdGlvbkAwIHsKPj4gKyAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAidWJpIjsKPj4gKyAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAgMHgxMDAw
MDAwPjsKPj4gKyAgICAgICAgICAgIGxhYmVsID0gImZpbGVzeXN0ZW0iOwo+PiArCj4+ICsgICAg
ICAgICAgICBlbnY6IHZvbHVtZS0wIHsKPj4gKyAgICAgICAgICAgICAgICB2b2x1bWUtbmFtZSA9
ICJ1LWJvb3QtZW52IjsKPiAKPiBXaHkgbm90IGRvICdjb21wYXRpYmxlID0gInUtYm9vdCxlbnYi
OycgdG8gYWxpZ24gd2l0aCBub3JtYWwgcGFydGl0aW9ucz8KCkkgbWVhbiB0byByZXNlcnZlICJj
b21wYXRpYmxlIiBmb3IgZGVzY3JpYmluZyBVQkkgdm9sdW1lIGNvbnRlbnQuCgpJZiBJIG1hbmFn
ZSB0byBnZXQKW1BBVENIIFYzXSBkdC1iaW5kaW5nczogbnZtZW06IGFkZCBVLUJvb3QgZW52aXJv
bm1lbnQgdmFyaWFibGVzIGJpbmRpbmcKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2RldmljZXRyZWUtYmluZGluZ3MvcGF0Y2gvMjAyMjAyMjgxMzEyNTAuMTY5NDMtMS16YWpl
YzVAZ21haWwuY29tLwphY2NlcHRlZCwgaXQnbGwgYWxsb3cgbWUgdG8gbGF0ZXIgd29yayBvbiBz
b21ldGhpbmcgbGlrZToKCmVudjogdm9sdW1lLTAgewogICAgIGNvbXBhdGlibGUgPSAidS1ib290
LGVudiI7CiAgICAgdm9sdW1lLW5hbWUgPSAidS1ib290LWVudiI7Cn07CgooSSBiZWxpZXZlKSBJ
J2xsIG5lZWQgKGluIHRoZSBmaW5hbCBzaGFwZSkgdHdvIHByb3BlcnRpZXM6CjEuIE9uZSBmb3Ig
ZGVzY3JpYmluZyBVQkkgdm9sdW1lICgiY29tcGF0aWJsZSIpCjIuIE9uZSBmb3IgaWRlbnRpZnlp
bmcgVUJJIHZvbHVtZSAoInZvbHVtZS1uYW1lIiAvICJ2b2x1bWUtaWQiKQoKSXQncyBzaW1pbGFy
IGRlc2lnbiB0byB0aGUgImNvbXBhdGlibGUiIHZzLiAicmVnIiBpbiBJTyBodyBibG9ja3MuCgoK
PiBPciAnbGFiZWwnPwoKSSBjb3VsZCByZXBsYWNlICJ2b2x1bWUtbmFtZSIgd2l0aCAibGFiZWwi
IGJ1dCBzb21lb25lIG9uY2UgdG9sZCBtZSB0aGF0OgogPiAnbGFiZWwnIGlzIHN1cHBvc2VkIHRv
IGNvcnJlc3BvbmQgdG8gYSBzdGlja2VyIG9uIGEgcG9ydCBvciBzb21ldGhpbmcKID4gaHVtYW4g
aWRlbnRpZmlhYmxlCgo7KSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL2NvbW1lbnQvMjgx
MjIxNC8KClNvIEkgZG9uJ3Qgd2FudCB0byBhYnVzZSAibGFiZWwiIGhlcmUuCgoKPiBXZSBoYXZl
IGVub3VnaCB3YXlzIHRvIGlkZW50aWZ5IHRoaW5ncywgSSBkb24ndCB0aGluayB3ZSBuZWVkIGFu
b3RoZXIuCj4gCj4+ICsgICAgICAgICAgICB9Owo+PiArCj4+ICsgICAgICAgICAgICBjYWxpYnJh
dGlvbjogdm9sdW1lLTEgewo+IAo+IEFyZSAwIGFuZCAxIG1lYW5pbmdmdWwgb3IganVzdCBtYWRl
IHVwIGluZGV4aW5nPwoKTWFkZSB1cCBpbmRleGluZy4gSSBuZWVkIHVuaXF1ZSBub2RlbmFtZXMg
YnV0IEBbMC05YS1mXSBkb2Vzbid0IGFwcHBseSBoZXJlLgoKCj4+ICsgICAgICAgICAgICAgICAg
dm9sdW1lLWlkID0gPDk5PjsKPj4gKyAgICAgICAgICAgIH07Cj4+ICsgICAgICAgIH07Cj4+ICsg
ICAgfTsKPj4gLS0gCj4+IDIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
