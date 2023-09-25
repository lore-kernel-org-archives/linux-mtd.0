Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196DBCE7A81
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDnsetdghU6s/dR0oCjvsSORTRYMuD9SKTSm4bh1oao=; b=oz5vbU2WqVuI+i
	8xW5ndQx2JzWrof7VX+DR/lny0RNAZBQe0TVGzXvt1tNyu/WGmjHY/eMONVk1jpb4iKxXboht/jGj
	eKa/l/LKL0PPhJixNh44HjINslaPWarYj/9B4C5LW63z74nkO6wDVw6tkeTERSyi+AjEeluzUC0Fd
	SNJ47x+Vr5llBFUiF7B5WbuBtsmWo/wQM+WGUtchIJUjQFcyi1iXkgdYmOWB78ZWnicp5SIty6oYg
	4hzVLB/m3Kd/sPlKqK6hUWuFJp8vvH2Gk7AqemAiZYo1hc5bsXNmzAFAGwKrQUB5M+FDk5Y74POnA
	T2Udqri4jAUAC3HbcG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qknSE-00EXte-2l;
	Mon, 25 Sep 2023 15:24:58 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qknSB-00EXqR-1q
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 15:24:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 663B2E000D;
	Mon, 25 Sep 2023 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695655491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8FBXEqtw7DtSRFjTe9aE3nB/Na/ZFvYNCCbHQx6230o=;
	b=If4ToL4JciFWlhP8QB7i+HGNSQ5PjcAOqXalI0QhDdwFmD9BgkOWXyqN7Hy81uKwoPVKXs
	imuh8ohuDBbA0kcCFlNI0xLlVk5LycsG2WRP3R+2CNd2Gtw0eacRVNIvVDD2ApbaEV7ryo
	Hsl7TpFluI+3ww7z1C37hmr0AYtvWDXPuycrfnkhoIB4RQd1+WLC2egYWWhxTluCHzEgxR
	1lsJcbGFxGq8nWKbFRsHOCWpJMFYp8rU9u4IbPdmzrxWvUpXm1du4Qt5hB0QIp+SZMsAj5
	YzideTKlcCvf34tYWU/LfWdvvmGj1P7UfPY4H916H/cNJEp2t+HosA/1whxyWA==
Date: Mon, 25 Sep 2023 17:24:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Glass <sjg@chromium.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, U-Boot
 Mailing List <u-boot@lists.denx.de>, linux-mtd@lists.infradead.org, Tom
 Rini <trini@konsulko.com>, Conor Dooley <conor+dt@kernel.org>, Dhruva Gole
 <d-gole@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
Message-ID: <20230925172447.43dcef88@xps-13>
In-Reply-To: <CAPnjgZ3YCQHJ-eXuX8rYx2Qb6QEL+XviFmXYTON6M-sGPWSBBg@mail.gmail.com>
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
	<CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
	<CAPnjgZ1pfxaMG1n5yOBhiOhsNrRjck1K92U7Ga=+VTY_jjjrVg@mail.gmail.com>
	<20230922174649.GA3320366-robh@kernel.org>
	<CAPnjgZ3ojfAv=BHqOhM=-NnYqCm81Ny=PsGKiNphKTmw++fk9w@mail.gmail.com>
	<CAL_JsqJqvyP=c93DHDO8A5RXv7Lz_Z7eEHSbJQ=JCo+qPVhSfg@mail.gmail.com>
	<CAPnjgZ3BnD9aX3cNNPiGRKTOj+YeurHCLv6K0TRFhAtY21Qufw@mail.gmail.com>
	<20230925092122.0b615f25@xps-13>
	<CAPnjgZ0Z5J_33HuQF-5XgDFmZim0nHHzvZJOOZobWw_cOJd=9g@mail.gmail.com>
	<20230925164736.5efbf4c0@xps-13>
	<CAPnjgZ3YCQHJ-eXuX8rYx2Qb6QEL+XviFmXYTON6M-sGPWSBBg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_082455_884139_9F62D146 
X-CRM114-Status: GOOD (  44.35  )
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

SGkgU2ltb24sCgo+ID4gPiA+ID4gPiA+ID4gPiBJIHdhcyBhc3N1bWluZyB0aGF0IEkgc2hvdWxk
IGNyZWF0ZSBhIHRvcC1sZXZlbCBjb21wYXRpYmxlID0gImJpbm1hbiIKPiA+ID4gPiA+ID4gPiA+
ID4gbm9kZSwgd2l0aCBzdWJub2RlcyBsaWtlIGNvbXBhdGlibGUgPSAiYmlubWFuLGJsMzEtYXRm
IiwgZm9yIGV4YW1wbGUuCj4gPiA+ID4gPiA+ID4gPiA+IEkgc2hvdWxkIHVzZSB0aGUgY29tcGF0
aWJsZSBzdHJpbmcgdG8gaW5kaWNhdGUgdGhlIGNvbnRlbnRzLCByaWdodD8gIAo+ID4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiA+IFllcyBmb3Igc3Vibm9kZXMsIGFuZCB3ZSBhbHJlYWR5IGhh
dmUgc29tZSBzb21ld2hhdCBzdGFuZGFyZCBvbmVzIGZvcgo+ID4gPiA+ID4gPiA+ID4gInUtYm9v
dCIgYW5kICJ1LWJvb3QtZW52Ii4gVGhvdWdoIGhpc3RvcmljYWxseSwgImxhYmVsIiB3YXMgdXNl
ZC4gIAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gQmlubWFuIGhhcyBjb21tb24gcHJvcGVy
dGllcyBmb3IgYWxsIGVudHJpZXMsIGluY2x1ZGluZyAiY29tcHJlc3MiCj4gPiA+ID4gPiA+ID4g
d2hpY2ggc2V0cyB0aGUgY29tcHJlc3Npb24gYWxnb3JpdGhtLiAgCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IEkgc2VlIG5vIGlzc3VlIHdpdGggYWRkaW5nIHRoYXQuIEl0IHNlZW1zIHVzZWZ1bCBh
bmQgc29tZXRoaW5nIG1pc3NpbmcKPiA+ID4gPiA+ID4gaW4gdGhlIGV4aXN0aW5nIHBhcnRpdGlv
biBzY2hlbWFzLiAgCj4gPiA+ID4gPgo+ID4gPiA+ID4gT0sgSSBzZW50IGEgcGF0Y2ggd2l0aCB0
aGF0Lgo+ID4gPiA+ID4gIAo+ID4gPiA+ID4gPiAgCj4gPiA+ID4gPiA+ID4gU28gcGVyaGFwcyBJ
IHNob3VsZCBzdGFydCBieSBkZWZpbmluZyBhIG5ldyBiaW5tYW4sYmwzMS1hdGYgd2hpY2ggaGFz
Cj4gPiA+ID4gPiA+ID4gY29tbW9uIHByb3BlcnRpZXMgZnJvbSBhbiAiYmlubWFuLGVudHJ5IiBk
ZWZpbml0aW9uPyAgCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0
aGUgYmlubWFuIHByZWZpeC4gVGhlIGNvbnRlbnRzIGFyZSBBVEYgKG9yIFRGLUEKPiA+ID4gPiA+
ID4gbm93KS4gV2hvIHdyb3RlIGl0IHRvIHRoZSBmbGFzaCBpbWFnZSBpcyBub3QgcmVsZXZhbnQu
ICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBBcmUgeW91IHN1Z2dlc3RpbmcganVzdCAiYXRmLWJsMzEi
LCBvciAiYXJtLGF0Zi1ibDMxIiA/IE9yIHNob3VsZCB3ZQo+ID4gPiA+ID4gY2hhbmdlIGl0IHRv
ICJ0ZmEtYmwzMSI/ICAKPiA+ID4gPgo+ID4gPiA+IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQg
dGhlIHJlbGF0aW9uc2hpcCB3aXRoIFRGLUEgaGVyZS4gQ2FuJ3Qgd2UKPiA+ID4gPiBqdXN0IGhh
dmUgYSBraW5kIG9mIGZpeGVkLXBhcnRpdGlvbnMgd2l0aCBhZGRpdGlvbmFsIHByb3BlcnRpZXMg
bGlrZQo+ID4gPiA+IHRoZSBjb21wcmVzc2lvbj8gIAo+ID4gPgo+ID4gPiBCaW5tYW4gbmVlZHMg
dG8ga25vdyB3aGF0IHRvIHB1dCBpbiB0aGVyZSwgd2hpY2ggaXMgdGhlIHB1cnBvc2Ugb2YgdGhl
Cj4gPiA+IGNvbXBhdGlibGUgc3RyaW5nLiAgCj4gPgo+ID4gQnV0ICJ3aGF0IiBzaG91bGQgYmUg
cHV0IGluc2lkZSB0aGUgcGFydGl0aW9uIGlzIHBhcnQgb2YgdGhlIGlucHV0Cj4gPiBhcmd1bWVu
dCwgbm90IHRoZSBvdXRwdXQuIFlvdSBzYWlkIChtYXliZSBJIGdvdCB0aGlzIHdyb25nKSB0aGF0
IHRoZQo+ID4gc2NoZW1hIHdvdWxkIGFwcGx5IHRvIHRoZSBvdXRwdXQgb2YgYmlubWFuLiBJZiB5
b3Ugd2FudCB0byBsZXQgdXNlcgo+ID4ga25vdyB3aGF0J3MgaW5zaWRlLCBtYXliZSBpdCBpcyB3
b3J0aCBhZGRpbmcgYSBsYWJlbCwgYnV0IG90aGVyd2lzZSBJCj4gPiBkb24ndCBsaWtlIHRoZSBp
ZGVhIG9mIGEgY29tcGF0aWJsZSBmb3IgdGhhdCwgd2hpY2ggZm9yIG1lIHdvdWxkIG1lYW46Cj4g
PiAiaGVyZSBpcyBob3cgdG8gaGFuZGxlIHRoYXQgc3BlY2lmaWMgcG9ydGlvbiBvZiB0aGUgZmxh
c2gvaGVyZSBpcyBob3cKPiA+IHRoZSBmbGFzaCBpcyBvcmdhbml6ZWQiLiAgCj4gCj4gQnV0IEkg
dGhvdWdodCB0aGF0IHRoZSBjb21wYXRpYmxlIHN0cmluZyB3YXMgZm9yIHRoYXQgcHVycG9zZT8g
U2VlIGZvcgo+IGV4YW1wbGUgImJyY20sYmNtNDkwOC1maXJtd2FyZSIgYW5kICJicmNtLGJjbTk2
M3h4LWltYWdldGFnIiBhbmQKPiAibGlua3N5cyxucy1maXJtd2FyZSIuCgpUaGVzZSB0aHJlZSBl
eGFtcGxlcyBhcHBhcmVudGx5IG5lZWQgc3BlY2lmaWMgaGFuZGxpbmcsIHRoZSBwYXJ0aXRpb25z
CmNvbnRhaW4gbWV0YS1kYXRhIHRoYXQgYSBwYXJzZXIgbmVlZHMgdG8gY2hlY2sgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KQW5kIGZpbmFsbHkgaXQgbG9va3MgbGlrZSBwYXJ0aXRpb24gbmFtZXMg
YXJlIHNldCBkZXBlbmRpbmcgb24gdGhlCmNvbnRlbnQgdGhhdCB3YXMgZGlzY292ZXJlZCwgc28g
eWVzLCB0aGUgcGFydGl0aW9uIG5hbWUgaXMgbGlrZWx5IHRoZQpnb29kIGxvY2F0aW9uIHRvIHRl
bGwgdXNlcnMvT1NlcyB3aGF0J3MgaW5zaWRlLgoKPiA+ID4gPiBBbHNvLCBJIHN0aWxsIGRvbid0
IHVuZGVyc3RhbmQgdGhlIHB1cnBvc2Ugb2YgdGhpcyBzY2hlbWEuIFNvIGJpbm1hbgo+ID4gPiA+
IGdlbmVyYXRlcyBhbiBpbWFnZSwgeW91IHdhbnQgdG8gZmxhc2ggdGhpcyBpbWFnZSBhbmQgeW91
IHdvdWxkIGxpa2UgdGhlCj4gPiA+ID4gdG9vbCB0byBnZW5lcmF0ZSB0aGUgY29ycmVzcG9uZGlu
ZyAocGFydGl0aW9uKSBEVCBzbmlwcGV0IGF1dG9tYXRpY2FsbHkuCj4gPiA+ID4gRG8gSSBnZXQg
dGhpcyByaWdodD8gSSBkb24ndCBnZXQgd2h5IHlvdSB3b3VsZCBuZWVkIG5ldyBjb21wYXRpYmxl
cyBmb3IKPiA+ID4gPiB0aGF0LiAgCj4gPiA+Cj4gPiA+IEl0IGlzIGFjdHVhbGx5IHRoZSBvdGhl
ciB3YXkgYXJvdW5kLiBUaGUgc2NoZW1hIHRlbGxzIEJpbm1hbiBob3cgdG8KPiA+ID4gYnVpbGQg
dGhlIGltYWdlICh3aGF0IGdvZXMgaW4gdGhlcmUgYW5kIHdoZXJlKS4gVGhlbiBvdXRwdXRzIGFu
Cj4gPiA+IHVwZGF0ZWQgRFQgd2hpY2ggZGVzY3JpYmVzIHdoZXJlIGV2ZXJ5dGhpbmcgZW5kZWQg
dXAsIGZvciB1c2UgYnkgb3RoZXIKPiA+ID4gdG9vbHMsIGUuZy4gZmlybXdhcmUgdXBkYXRlLiBJ
dCBpcyBhIGNsb3NlZCBsb29wIGluIHRoYXQgc2Vuc2UuIFNlZQo+ID4gPiB0aGUgcmVmZXJlbmNl
cyBmb3IgbW9yZSBpbmZvcm1hdGlvbi4gIAo+ID4KPiA+IE1heWJlIEkgZmFpbCB0byBzZWUgd2h5
IHlvdSB3b3VsZCB3YW50IHRoZXNlIGRlc2NyaXB0aW9uIHRvIGJlCj4gPiBpbnRyb2R1Y2VkIGhl
cmUsIGlmIHRoZXkgYXJlIG5vdCB1c2VmdWwgdG8gdGhlIE9TLiAgCj4gCj4gV2VsbCBJIHdhcyBh
c2tlZCB0byBzZW5kIHRoZW0gdG8gTGludXggc2luY2UgdGhleSBhcHBhcmVudGx5IGRvbid0Cj4g
YmVsb25nIGluIGR0LXNjaGVtYS4gVGhlc2UgYXJlIGZpcm13YXJlIGJpbmRpbmdzLCBhcyBpbmRp
Y2F0ZWQsIGJ1dCBJCj4gdG9vayB0aGVtIG91dCBvZiB0aGUgL2Zpcm13YXJlIG5vZGUgc2luY2Ug
dGhhdCBpcyBmb3IgYSBkaWZmZXJlbnQKPiBwdXJwb3NlLiBSb2Igc3VnZ2VzdGVkIHRoYXQgcGFy
dGl0aW9ucyB3YXMgYSBnb29kIHBsYWNlLiBXZSBoYXZlIGZ3dXBkCj4gdXNpbmcgRFQgdG8gaG9s
ZCB0aGUgZmlybXdhcmUtdXBkYXRlIGluZm9ybWF0aW9uLCBzbyBJIGV4cGVjdCBpdCB3aWxsCj4g
bW92ZSB0byB1c2UgdGhlc2UgYmluZGluZ3MgdG9vLgoKSSB3b3VsZCBkZWZpbml0ZWx5IHVzZSBm
aXhlZCBwYXJ0aXRpb25zIGFzIHRoYXQncyB3aGF0IHlvdSBuZWVkIHRoZW46CnJlZ2lzdGVyaW5n
IHdoZXJlIGV2ZXJ5dGhpbmcgc3RhcnRzIGFuZCBlbmRzLiBJZiB5b3UgaGF2ZSAiaW4tYmFuZCIK
bWV0YSBkYXRhIHlvdSBtaWdodCByZXF1aXJlIGEgY29tcGF0aWJsZSwgYnV0IEkgZG9uJ3QgdGhp
bmsgeW91CmRvLCBpbiB0aGlzIGNhc2UgeW91IHNob3VsZCBwcm9iYWJseSBjYXJyeSB0aGUgY29u
dGVudCB0aHJvdWdoIGEgbGFiZWwKKHdoaWNoIHdpbGwgYmVjb21lIHRoZSBwYXJ0aXRpb24gbmFt
ZSkgYW5kIHdlIGNhbiBkaXNjdXNzIGFkZGl0aW9uYWwKcHJvcGVydGllcyBpZiBuZWVkZWQuCgo+
ID4gPiBbMV0gaHR0cHM6Ly91LWJvb3QucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2RldmVsb3Av
cGFja2FnZS9pbmRleC5odG1sCj4gPiA+IFsyXSBodHRwczovL3ByZXRhbHguY29tL21lZGlhL29z
ZmMyMDE5L3N1Ym1pc3Npb25zL1k3RU45Vi9yZXNvdXJjZXMvQmlubWFuXy1fQV9kYXRhLWNvbnRy
b2xsZWRfZmlybXdhcmVfcGFja2VyX2Zvcl9VLUJfcEZVM24ySy5wZGYKPiA+ID4gWzNdIGh0dHBz
Oi8vd3d3LnlvdXR1YmUuY29tL3dhdGNoP3Y9TDg0dWpnVVhCT1EgIAo+ID4gIAo+IAo+IFJlZ2Fy
ZHMsCj4gU2ltb24KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
