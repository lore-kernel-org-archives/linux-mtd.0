Return-Path: <SRS0=IIRZ=RK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C52AC43381
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 15:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A2020840
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2019 15:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t0ZjEdVV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dd-wrt.com header.i=@dd-wrt.com header.b="onBZTRTw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A2020840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dd-wrt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbirbMZF8TZh5j+3T0speoP71RuaZuk1hgWePxaXFhg=; b=t0ZjEdVVedYEHb
	wrfjrHja9ROLK5hOs3/V6pvDO8eFfx8+EeDV4Br9SCeNm1pHgfiO0gX8SXW4MjoqiK9Qlng/oFZhj
	2NiGnjazlom5usGEHIKXtXSptCPhFEWulYcV8U+7FweNpVtE19JDVM/5g/8t9AykMnZXby0iu9dmh
	Eey/oFNG4IRhAEU/Kw2QJf9aBz51d1UOJOewRJmQw2iEDr8aY9qQsZjsLMLarAneeDZvJ/GmKfjbQ
	zz6unGgt2Sx7FjYI0dDZqmUleFwQGVzetwnMpRxbEk5i9ngfoM71PecijNuLilMOxyJqc5iGiTiVX
	+c6cnqMldFfyXYGun8jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1ugn-0002nn-62; Thu, 07 Mar 2019 15:12:05 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1ugj-0002nF-IH
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2019 15:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com;
 s=mikd; 
 h=Subject:Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To;
 bh=pnpW8XYwsg5igfaD7Rf1977ccw8S7C5XAJ2Q6NFOFhM=; 
 b=onBZTRTwP9RGLIeeJmo9zgmOasScG+biE+2KVItVjnql5d9n8iu5x4TPTryYSYHx7h9yGMnY74aMrgRVJP9se7hoSgvWaDDaeZwmzhdrt+LgPxG3Ksui2JbhkB05PPEMAKZwIAx9HxgZwguZumqWhrccZ+/4KwwW5ePi7ZK4Q8M=;
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20190222123205.20015-1-daniel@dd-wrt.com>
 <20190307142049.3162e9d5@xps13>
From: Daniel Danzberger <daniel@dd-wrt.com>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel@dd-wrt.com; prefer-encrypt=mutual; keydata=
 mQENBFEb+wQBCAD7DgPNNCJeLdnVdMCcneGypnjJ8mtCmpjo/r7HO2Ig6im559z5IQwnGdmj
 FM+6Xws5oGBdhqh7V+uGJ0/pSVJ432OFd/2JYlEs9p9aLbth/QIaoMO4DfDS8EestMLuGYlj
 ffojt+lCwI/OVNvlsHPZczxUuLENDeCKPQKyVkSo8tf5qgOJxZmJ8ebSY2DiTD8Sr3TC7ge3
 aOMuE1YVMv8RbOEVvRcTBerCXteANRuJYA8H1Nwg1WOJjPl5SoysQqPamCkiyVFbteNtRZaV
 tBqfJNRUi4JXdZxsNoaWygJr5pAMyJ9FPMQ6meo/97Cj1E46fTH7QWDhYkwGS3sFLb1jABEB
 AAG0JURhbmllbCBEYW56YmVyZ2VyIDxkYW5pZWxAZGQtd3J0LmNvbT6JAT4EEwECACgFAlEc
 oikCGwMFCVexLAAGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEF2W1+mV7KsoZYwH/1HG
 YtcQuMVXOD1ClaDDoWumBZ089ABCeExcCjuNAqtySAD0Z1i3Dr153CDL5IF8WsLDL+hkhmRJ
 knQg31kwkFglm62HcYuVZiAEjoTgNZRfBezTQevWV6Dys8YdfJGdLifqtMQM5dBLuWtyRWK/
 gkcv0rf2iI9PLveCqb93K9qDLxzgV96kwTUabc6n4FIF324RUPlzCuGoDEUNkh/sVo8jkXl7
 v8vfxwKb1EEMlWLk7bRGqUg7mdHf9zM4Fnb9oMQLJUrFWtME2FlZLwKvMfW8/bPqHI3thIYV
 qgYvagC/1HKmlvHfo8rraKXsQKzNadlv4Vyh6iZYkdQXUTuQtDO5AQ0EURv7BAEIAL1UNRYJ
 q1hv3ggyZv9PSkaWy0t+xMoSwAd2hWdA3iuILrQXjtzJ3nTtePE9TrmLpjwmN8H/ppcNpf1W
 WZ1Zxer9e4cUmm1LjbbgNIArZqzplVh+7QwDJk0ER282k3p5s7IYLkjymwmgeuiSJgaRAmFm
 AJKjiaNZoGdZvaC8TGpgGCRidwDR/cUR1hjpA2vyidNSP5ynILqohEpIe2lvhClODSvEgcMN
 o4xOtmI+Yq2Qg2e7FUaP8pptEysDdDoUnSPxq9v0aQHe3FS90KzXGAaoCuEnnRaotzZcVI31
 vffWHoZ30yGETeTF+W52hIKe7D+MbFfyiRjNtOw6HKli7TEAEQEAAYkBJQQYAQIADwUCURv7
 BAIbDAUJV7EsAAAKCRBdltfpleyrKDikB/0SWPBPhPBpogDLF4bIwORt6Uu8UQus5jYudtMx
 j67v+R+f42sfBj+iKtz2GHlboul8tJXzcO6zVJf2gqQisCNAoS7wZ/k3axPtbgClQmsLtU7B
 KgVRYaWVlLol0hg/Sn1lju/yHhgmbdttfBmCE63wDWr1ITTFepp9aVwaoIhIRBmCBpf3Vk5I
 e6l+1iqDXNXVQVf5qPdVE0Im7IZb9kA7Wk7N6Fa+zYpK+Qz1wFOXYjmK9SPhjdf/5/V2EQGi
 JgaVyfwaMRPUDRFW2wBlScmP+82LqA6TvKKyi3O3zgnFqTGvY2+bvkr9dTfRBlx1NlX0am9t
 YMmhspz7064avRsg
Message-ID: <d204c01c-344b-258a-5a30-1ee970dd1e22@dd-wrt.com>
Date: Thu, 7 Mar 2019 16:11:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190307142049.3162e9d5@xps13>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2a02:908:2614:35c:4410:cec8:f72c:1482
X-SA-Exim-Mail-From: daniel@dd-wrt.com
Subject: Re: [PATCH] mtdram: Add module parameter name.
X-SA-Exim-Version: 4.2.1 (built Thu, 26 May 2011 15:22:33 +0200)
X-SA-Exim-Scanned: Yes (on webmail.newmedia-net.de)
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1h1ugj-0001Bs-4l
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-SpamScore: s
X-NMN-MailScanner-From: daniel@dd-wrt.com
X-Received: from [2a02:908:2614:35c:4410:cec8:f72c:1482]
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <daniel@dd-wrt.com>)
 id 1h1ugj-0001Bs-4l; Thu, 07 Mar 2019 16:12:01 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071202_035188_73CBA701 
X-CRM114-Status: GOOD (  18.68  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy83LzE5IDI6MjEgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+
IFBsZWFzZSBDYzogdGhlIE1URCBtYWludGFpbmVycyBhcyBhZHZpc2VkIGJ5IGdldF9tYWludGFp
bmVycy5wbC4KPiAKPiBEYW5pZWwgRGFuemJlcmdlciA8ZGFuaWVsQGRkLXdydC5jb20+IHdyb3Rl
IG9uIEZyaSwgMjIgRmViIDIwMTkKPiAxMzozMjowNSArMDEwMDoKPiAKPj4gVGhpcyBwYXJhbWV0
ZXIgd2lsbCBvdmVyd3JpdGUgdGhlIGRlZmF1bHQgbmFtZSAibXRkcmFtIHRlc3QgZGV2aWNlIiwg
d2hlbiBzZXQuCj4gCj4gRG8geW91IGhhdmUgYSB1c2UgY2FzZSA/Ckkgd2FzIHRlc3Rpbmcgc29t
ZSB1c2Vyc3BhY2UgbXRkIGNvZGUgdGhhdCBzZWFyY2hlcyBmb3IgYSBzcGVjaWZpYyBtdGQgcGFy
dGl0aW9uCmJ5IG5hbWUuIEkgZGlkbid0IHdhbnQgdG8gcmVuYW1lIHRoZSBwYXJ0aXRpb24gbmFt
ZSBpbiB0aGUgY29kZSBldmVyeSB0aW1lIEkKdGVzdCB3aXRoIG10ZHJhbS4KSSB3YXMgdGhpbmtp
bmcgc29tZW9uZSBlbHNlIG1pZ2h0IHJ1biBpbnRvIGEgc2ltaWxhciBzaXR1YXRpb24sIHNvIEkg
cHVzaGVkIGl0CnVwc3RyZWFtLgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgRGFuemJl
cmdlciA8ZGFuaWVsQGRkLXdydC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvZGV2aWNlcy9t
dGRyYW0uYyB8IDUgKysrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvbXRkcmFt
LmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL210ZHJhbS5jCj4+IGluZGV4IDQ2MjM4Nzk2MTQ1Zi4u
MWE4ZWMzNzU2YTFkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL210ZHJhbS5j
Cj4+ICsrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvbXRkcmFtLmMKPj4gQEAgLTE4LDYgKzE4LDcg
QEAKPj4gICNpbmNsdWRlIDxsaW51eC9tdGQvbXRkLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvbXRk
L210ZHJhbS5oPgo+PiAgCj4+ICtzdGF0aWMgY2hhciBuYW1lWzMyXSA9ICJtdGRyYW0gdGVzdCBk
ZXZpY2UiOwo+PiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgdG90YWxfc2l6ZSA9IENPTkZJR19NVERS
QU1fVE9UQUxfU0laRTsKPj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIGVyYXNlX3NpemUgPSBDT05G
SUdfTVREUkFNX0VSQVNFX1NJWkU7Cj4+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyB3cml0ZWJ1Zl9z
aXplID0gNjQ7Cj4+IEBAIC0zMSw2ICszMiw4IEBAIG1vZHVsZV9wYXJhbShlcmFzZV9zaXplLCB1
bG9uZywgMCk7Cj4+ICBNT0RVTEVfUEFSTV9ERVNDKGVyYXNlX3NpemUsICJEZXZpY2UgZXJhc2Ug
YmxvY2sgc2l6ZSBpbiBLaUIiKTsKPj4gIG1vZHVsZV9wYXJhbSh3cml0ZWJ1Zl9zaXplLCB1bG9u
ZywgMCk7Cj4+ICBNT0RVTEVfUEFSTV9ERVNDKHdyaXRlYnVmX3NpemUsICJEZXZpY2Ugd3JpdGUg
YnVmIHNpemUgaW4gQnl0ZXMgKERlZmF1bHQ6IDY0KSIpOwo+PiArbW9kdWxlX3BhcmFtX3N0cmlu
ZyhuYW1lLCBuYW1lLCBzaXplb2YobmFtZSkgLSAxLCAwKTsKPiAKPiBUaGUgbW9kdWxlX3BhcmFt
X3N0cmluZyBrZXJuZWwgZG9jIHNheXMKPiAKPiAgICAgICAgICJAbGVuOiB0aGUgbWF4aW11bSBs
ZW5ndGggb2YgdGhlIHN0cmluZywgaW5jbC4gdGVybWluYXRvciIKPiAKPiBhbmQgbGF0ZXIKPiAK
PiAgICAgICAgICJAbGVuIGlzIHVzdWFsbHkganVzdCBzaXplb2Yoc3RyaW5nKS4iCj4gCj4gU28g
SSBzdXBwb3NlIHNpemVvZihuYW1lKSB3aWxsIGJlIGVub3VnaC5BZ3JlZS4KCj4gCj4+ICtNT0RV
TEVfUEFSTV9ERVNDKG5hbWUsICJEZXZpY2UgbmFtZSIpOwo+PiAgI2VuZGlmCj4+ICAKPj4gIC8v
IFdlIGNvdWxkIHN0b3JlIHRoZXNlIGluIHRoZSBtdGQgc3RydWN0dXJlLCBidXQgd2Ugb25seSBz
dXBwb3J0IDEgZGV2aWNlLi4KPj4gQEAgLTE3MCw3ICsxNzMsNyBAQCBzdGF0aWMgaW50IF9faW5p
dCBpbml0X210ZHJhbSh2b2lkKQo+PiAgCQltdGRfaW5mbyA9IE5VTEw7Cj4+ICAJCXJldHVybiAt
RU5PTUVNOwo+PiAgCX0KPj4gLQllcnIgPSBtdGRyYW1faW5pdF9kZXZpY2UobXRkX2luZm8sIGFk
ZHIsIE1URFJBTV9UT1RBTF9TSVpFLCAibXRkcmFtIHRlc3QgZGV2aWNlIik7Cj4+ICsJZXJyID0g
bXRkcmFtX2luaXRfZGV2aWNlKG10ZF9pbmZvLCBhZGRyLCBNVERSQU1fVE9UQUxfU0laRSwgbmFt
ZSk7Cj4+ICAJaWYgKGVycikgewo+PiAgCQl2ZnJlZShhZGRyKTsKPj4gIAkJa2ZyZWUobXRkX2lu
Zm8pOwo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgotLSAKUmVnYXJkcwoKRGFuaWVsIERh
bnpiZXJnZXIKZW1iZUREIEdtYkgsIEFsdGVyIFBvc3RwbGF0eiAyLCBDSC02MzcwIFN0YW5zCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
