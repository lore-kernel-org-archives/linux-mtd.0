Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E92C46CD2
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OGLChnhoJX2Z1e8BlTERRH3ZR6/s3wd1yQb3boJG28=; b=jJWfYVQUWOPRbF
	6JJSFSw6D1HDxbfANoOj7odraZGWvmgqLoVhBu8XVuCI/QdB3UTFpaM8ew5cEMVtLgNFXJF2/9F4M
	YYW8yuivgSKXn/JnJT8trohNY1MQ3jQNctQd2dZUtbtZquGOPPkom74BWRXS6oHZ6XPEuTEZxQlRr
	gjzjrqhzagfAP0m88fFqLl/f73+rKcKOED6gX3sHlxRsnj++qhJKuyQH3h9Bt5xcoMXPABPHceMMA
	zmBZqAX3r9HIWRpo2OGcnCe9d0yTkGtia7n9L64F14fesT/AG3roFoT1HkrNzb0zY2sjATDbSTzwf
	i5v5+Ou1/gwHg1rp4zOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKiSs-008aqA-0S;
	Tue, 02 Jan 2024 17:22:06 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKiSo-008apC-0Z
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 17:22:04 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2053f5e97b2so1371643fac.3
        for <linux-mtd@lists.infradead.org>; Tue, 02 Jan 2024 09:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704216121; x=1704820921; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jqug7K5oM3HsMtWmU5up7l2Gs5ZYrl8a7xdWt5MjwaI=;
        b=MpxGwTXAitb5LAOCuKo4AmAFr6Eazstgz229e/Ln+C6f1VLxaFlyh29QTH1YcfUVY0
         CrHEwAefFmUkn/BVMU7DidCLlfzCDUaDGPF5ptdmK0j7GTf5TC/JyV6F/Bn53V0o4qRD
         yFiHL39eBC64n7skn93NfCHRg1mMRS0280utF5vj4yIuGNyaN4TZKoP4/TLrVxY4pgzU
         9kG2a/yZtjzprQDoM6CkTolgfEjkrX6f4opf/Ciltz3hE/O1o7d0W7IQOkRTW6MBI7H8
         VSAJaWJ+Ac1sXAXrNVI4I+w6FwDfvCt+/BcCYUt/P45xvGx+jMzNWF4IkVHxihYol3Fu
         wQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704216121; x=1704820921;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jqug7K5oM3HsMtWmU5up7l2Gs5ZYrl8a7xdWt5MjwaI=;
        b=rE9KqNMsFajO5Hs64UqQiWsySxnf7UOh4/LfkZ9vuyrwSZru2M5D4hkzcK3cTQ78jO
         6RFOiFRXhQBtu8E5Su55K6YPp/l4mq3J/+IiVULxcl0d0CMkXTLSx1VJTaPfcJNvL0BY
         WGhHpspllE8qKC7EoniBnLZJLE+l3hq8uSk8NdmsMWqQPnm+rPTaVcJC+hvABUwVU0Yh
         4twGshSMv3GleSG1+txCqb+2FmwPF6b3E9uclfd/WrBCoHCs6YVnLtNPn6iRetu9qK5c
         GuDLZ6chjPW5w3PWMAXzPC4fQAyhO238NcuA3lnfLcEa5LmOcts9wEiJopl8nTtEqO3F
         14TA==
X-Gm-Message-State: AOJu0Yxr12N/XbC5/P8WPjDDaqMkpIf0uT+lDuLuj0no9YTg7Tsyo3ex
	tj5w+nb375NNdkGHmvDrv+Vi6pAYudc=
X-Google-Smtp-Source: AGHT+IHkoEjDEFKvIedhn7zNaeM7WLChKFXE3TglVA37Fah2gkEBejGFygWVwB8LbnF9XDHw4JB9pQ==
X-Received: by 2002:a05:6871:5221:b0:203:caf4:f0d0 with SMTP id ht33-20020a056871522100b00203caf4f0d0mr21830426oac.52.1704216120985;
        Tue, 02 Jan 2024 09:22:00 -0800 (PST)
Received: from smtpclient.apple ([49.37.241.39])
        by smtp.gmail.com with ESMTPSA id l30-20020a63571e000000b005cddfe17c0csm20678467pgb.92.2024.01.02.09.21.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jan 2024 09:22:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: mtd0 device is missing in /sys/class/mtd
From: Manojkiran Eda <manojkiran.eda@gmail.com>
In-Reply-To: <F86A353E-FFA9-4C8A-88D4-C726029CB27B@gmail.com>
Date: Tue, 2 Jan 2024 22:51:55 +0530
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-Id: <60B71E47-4245-4B7A-B600-5056D68DFBE5@gmail.com>
References: <5AF66848-442A-460B-BAD8-31818FDC9DAC@gmail.com>
 <PH0PR10MB4615E28208969294E93F10F2F463A@PH0PR10MB4615.namprd10.prod.outlook.com>
 <F86A353E-FFA9-4C8A-88D4-C726029CB27B@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_092202_267642_96B95F1B 
X-CRM114-Status: GOOD (  30.53  )
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

SSB3YXMgcmVhZGluZyBzb21ld2hlcmUgdGhhdCAsIG1vZHVsZXMgdGhhdCBhcmUgZGVjbGFyZWQg
d2l0aCBzdWJzeXNfaW5pdGNhbGwoKSBhcmUgZ3VhcmFudGVlZCB0byBiZSBleGVjdXRlZCBiZWZv
cmUgdGhlIG1vZHVsZXMgdGhhdCBhcmUgZGVjbGFyZWQgd2l0aCBtb2R1bGVfaW5pdCgpICwgc28g
ZGVjbGFyaW5nIHRoZSBtdGRjb3JlIHdpdGggc3Vic3lzX2luaXRjYWxsKCkgcmF0aGVyIHRoYW4g
bW9kdWxlX2luaXQoKSBzb2x2ZWQgdGhlIGlzc3VlLgoKQnV0IHdvbmRlcmluZyBpZiB0aGlzIGlz
IHRoZSByaWdodCB3YXkgdG8gc29sdmUgdGhlIHByb2JsZW0gPyAKCldoYXQgaXMgdGhlIHJpZ2h0
IHdheSBFUFJPQkVfREVGRVIgPyBPciBDaGFuZ2luZyB0aGUgc3Vic3lzdGVt4oCZcyBwcm9jZWR1
cmUgdG8gc3Vic3lzX2luaXRjYWxsKCkgPyAKClRoYW5rcywKTWFub2oKCj4gT24gMDItSmFuLTIw
MjQsIGF0IDU6MjDigK9QTSwgTWFub2praXJhbiBFZGEgPG1hbm9qa2lyYW4uZWRhQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gCj4gSSB0cmllZCBhZGRpbmcgTVREX1BBUlRJVElPTkVEX01BU1RFUiB0byBt
eSBrZXJuZWwgY29uZmlnLCBhbmQgc3RpbGwgZmFjaW5nIHRoZSBzYW1lIGlzc3VlLiBEZWJ1Z2dp
bmcgYSBsaXR0bGUgbW9yZSAsIEkgZmlndXJlZCBvdXQgdGhhdCBteSBkcml2ZXIgaXMgYmVpbmcg
cHJvYmVkIGEgbG90IGVhcmx5IHRoYW4gdGhlIG10ZCBjbGFzcyBiZWluZyByZWdpc3RlcmVkLiBT
byB0aGUgY29kZSBpcyBiYWlsaW5nIG91dCBsb3QgZWFybHkgc2luY2UgdGhlIGNsYXNzX3RvX3N1
YnN5cygpIHJldHVybnMgbnVsbCAoaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0
ZXN0L3NvdXJjZS9kcml2ZXJzL2Jhc2UvY29yZS5jI0wzMTgwKQo+IAo+IGNvbnNvbGUgdHJhY2Vz
Ogo+IAo+IFsgICAgOS4xMjg4NjZdIEVudGVyZWQgdGhlIGFzcGVlZF9lc3BpX2N0cmxfcHJvYmUg
ZnVuY3Rpb24KPiDigKYuCj4gWyAgIDExLjU4MTA4MV0gbXRkIGNsYXNzIGlzIHJlZ2lzdGVyaW5n
IG5vdwo+IAo+IAo+IExvb2tpbmcgbW9yZSwgSSBzZWUgYSBjbGFzc19pc19yZWdpc3RlcmVkKCkg
bWV0aG9kIGF2YWlsYWJsZSBhdCBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2RyaXZlcnMvYmFzZS9jbGFzcy5jI0w2NDQgLiBJcyB0aGF0IHNvbWV0aGluZyB0
aGF0IEkgY291bGQgY2hlY2sgaW4gbXkgZHJpdmVyIGFuZCByZXR1cm4gYW4gRVBST0JFX0RFRkVS
ID8gT3Igc2hvdWxkIHRoaXMgbG9naWMgYmUgaW5jb3Jwb3JhdGVkIGluIHRoZSBtdGRjb3JlLmMg
PyBCZWNhdXNlIHRoZSBtdGRfY2xhc3MgZGVmaW5pdGlvbiBpcyBiZWVuIGRlY2xhcmVkIGluIHRo
ZSBtdGRjb3JlIGFuZCBpcyBub3QgcGFzc2VkIGRvd24gZnJvbSBteSBkcml2ZXIgY29kZS4gQWxs
IEkgd2FzIGRvaW5nIGlzIGNhbGxpbmcgbXRkX2RldmljZV9yZWdpc3RlcigpIGFuZCBleHBlY3Rp
bmcgaXQgdG8gcmV0dXJuIEVQUk9CRV9ERUZFUiBpZiB0aGUgbXRkIGNvcmUgc3Vic3lzdGVtL2Ns
YXNzIGlzIG5vdCByZWdpc3RlcmVkL3Byb2JlZCBpbiB0aGUga2VybmVsLgo+IAo+IEJ1dCBJIGFt
IG5vdCBzdXJlIHdoYXTigJlzIHRoZSByaWdodCBkaXJlY3Rpb24uIENhbiBhbnkgb25lIGhlbHAg
bWUgb3V0IG9uIHRoaXMgPwo+IAo+IFRoYW5rcywKPiBNYW5vago+IAo+PiBPbiAzMS1EZWMtMjAy
MywgYXQgNjo0NuKAr1BNLCBKb2FraW0gVGplcm5sdW5kIDxKb2FraW0uVGplcm5sdW5kQGluZmlu
ZXJhLmNvbT4gd3JvdGU6Cj4+IAo+PiBUcnkgYWRkaW5nIE1URF9QQVJUSVRJT05FRF9NQVNURVIg
dG8geW91ciBrZXJuZWwgY29uZmlnCj4+IAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4+IEZyb206IGxpbnV4LW10ZCA8bGludXgtbXRkLWJvdW5jZXNAbGlzdHMu
aW5mcmFkZWFkLm9yZz4gb24gYmVoYWxmIG9mIE1hbm9qa2lyYW4gRWRhIDxtYW5vamtpcmFuLmVk
YUBnbWFpbC5jb20+Cj4+IFNlbnQ6IDI4IERlY2VtYmVyIDIwMjMgMTc6MzgKPj4gVG86IGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IFN1YmplY3Q6IG10ZDAgZGV2aWNlIGlzIG1pc3Np
bmcgaW4gL3N5cy9jbGFzcy9tdGQKPj4gCj4+IEhpIEFsbCwKPj4gCj4+IEkgd2FzIGFzIGJlZ2lu
bmVyIGluIGxpbnV4IGRldmljZSBkcml2ZXIgZGV2ZWxvcG1lbnQsIGFuZCByZWNlbnRseSBJIHdh
cyB3b3JraW5nIG9uIGEgZGV2aWNlIGRyaXZlciBmb3IgZXNwaSBwcm90b2NvbCBhbmQgd2FzIHN0
dWNrIHdpdGggYSBwcm9ibGVtLgo+PiAKPj4gSSBoYXZlIGFuIG10ZCBkZXZpY2UgZHJpdmVyIHRo
cm91Z2ggd2hpY2ggb25lIGNvdWxkIGFjY2VzcyB0aGUgTk9SIGZsYXNoIGNvbm5lY3RlZCB0byB0
aGUgb3RoZXIgZW5kIG9mICBlc3BpIGJ1cy4gVGhlIGRyaXZlciBzZWVtcyB0byBoYXZlIHByb2Jl
ZCBzdWNjZXNzZnVsbHkgLCBJIHNlZSBhbiBlbnRyeSBmb3IgbXkgbXRkIGRldmljZSBpbiAvcHJv
Yy9tdGQgYnV0ICwgSSBkb250IHNlZSBhbiBlbnRyeSBmb3IgbXkgbXRkIGRldmljZSBpbiB0aGUg
L3N5cy9jbGFzcy9tdGQuCj4+IAo+PiBIZXJlIGFyZSBmZXcgbG9ncyBvZiBpbnRlcmVzdCA6Cj4+
IAo+PiByb290QG15Ym94On4jIGNhdCAvcHJvYy9tdGQKPj4gZGV2OiAgICBzaXplICAgZXJhc2Vz
aXplICBuYW1lCj4+IG10ZDA6IDA0MDAwMDAwIDAwMDAxMDAwICJhc3BlZWQtZXNwaS1mbGFzaOKA
nSA8PDw8POKAlOKAlCBUaGlzIGlzIG15IG10ZCBkZXZpY2UKPj4gbXRkMTogMDQwMDAwMDAgMDAw
MTAwMDAgImJtYyIKPj4gbXRkMjogMDAwZTAwMDAgMDAwMTAwMDAgInUtYm9vdCIKPj4gbXRkMzog
MDAwMjAwMDAgMDAwMTAwMDAgInUtYm9vdC1lbnYiCj4+IG10ZDQ6IDAwOTAwMDAwIDAwMDEwMDAw
ICJrZXJuZWwiCj4+IG10ZDU6IDAyMDAwMDAwIDAwMDEwMDAwICJyb2ZzIgo+PiBtdGQ2OiAwMTYw
MDAwMCAwMDAxMDAwMCAicndmcyIKPj4gbXRkNzogMDQwMDAwMDAgMDAwMTAwMDAgImFsdC1ibWMi
Cj4+IG10ZDg6IDAwMGUwMDAwIDAwMDEwMDAwICJhbHQtdS1ib290Igo+PiBtdGQ5OiAwMDAyMDAw
MCAwMDAxMDAwMCAiYWx0LXUtYm9vdC1lbnYiCj4+IG10ZDEwOiAwMDkwMDAwMCAwMDAxMDAwMCAi
YWx0LWtlcm5lbCIKPj4gbXRkMTE6IDAyMDAwMDAwIDAwMDEwMDAwICJhbHQtcm9mcyIKPj4gbXRk
MTI6IDAxNjAwMDAwIDAwMDEwMDAwICJhbHQtcndmc+KAnQo+PiAKPj4gCj4+IHJvb3RAbXlib3g6
L3N5cy9jbGFzcy9tdGQjIGxzCj4+IG10ZDEgICAgIG10ZDEwcm8gIG10ZDExcm8gIG10ZDEycm8g
IG10ZDIgICAgIG10ZDMgICAgIG10ZDQgICAgIG10ZDUgICAgIG10ZDYgICAgIG10ZDcgICAgIG10
ZDggICAgIG10ZDkKPj4gbXRkMTAgICAgbXRkMTEgICAgbXRkMTIgICAgbXRkMXJvICAgbXRkMnJv
ICAgbXRkM3JvICAgbXRkNHJvICAgbXRkNXJvICAgbXRkNnJvICAgbXRkN3JvICAgbXRkOHJvICAg
bXRkOXJvCj4+IAo+PiBJIHdhcyBleHBlY3RpbmcgbXRkMCB0byBiZSBwcmVzZW50IGluIHRoZSAv
c3lzL2NsYXNzL210ZCwgYnV0IGl0cyBub3QgdGhlcmUuCj4+IAo+PiBMb29raW5nIGF0IGRtZXNn
Ogo+PiAKPj4gcm9vdEBteWJveDovc3lzL2NsYXNzL210ZCMgZG1lc2cgfCBncmVwIC1pZSBtdGQg
LUE1IC1pZSBlc3BpCj4+IFsgICAgMC42ODUwMDZdIEVudGVyZWQgdGhlIGFzcGVlZF9lc3BpX2N0
cmxfcHJvYmUgZnVuY3Rpb24KPj4gWyAgICAwLjY5MDk5MF0gZGV2aWNlIG1hdGNoZWQgOiAgMQo+
PiBbICAgIDAuNjk5MjI1XSBlc3BpIGFsbG9jIHN0YXJ0ZWQKPj4gWyAgICAwLjcwNDcyNl0gZXNw
aSByZWFkIGZyb20gZGV2aWNlIHRyZWUsIGZsYXNoIHNpemUgOiAgNjcxMDg4NjQKPj4gWyAgICAw
LjcxMjQxNl0gZXNwaSBmbGFzaCBlbmFibGVkCj4+IFsgICAgMC43MTY1NzJdIGVzcGkgZmxhc2gg
Y2hhbm5lbCBpcyByZWFkeQo+PiBbICAgIDAuNzIwOTQwXSBlc3BpIGZsYXNoIGFsbG9jYXRpb24g
Y29tcGxldGVkCj4+IFsgICAgMC43MjUyNTldIGFzcGVlZC1lc3BpLWN0cmwgMWU2ZWUwMDAuZXNw
aS1jdHJsOiBtb2R1bGUgbG9hZGVkCj4+IC0tCj4+IFsgICAgMC45NjI3NjRdIDUgZml4ZWQtcGFy
dGl0aW9ucyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2UgYm1jCj4+IFsgICAgMC45Njk2
NzVdIENyZWF0aW5nIDUgTVREIHBhcnRpdGlvbnMgb24gImJtYyI6Cj4+IFsgICAgMC45NzQ3NzZd
IDB4MDAwMDAwMDAwMDAwLTB4MDAwMDAwMGUwMDAwIDogInUtYm9vdCIKPj4gWyAgICAwLjk4MTk4
Ml0gMHgwMDAwMDAwZTAwMDAtMHgwMDAwMDAxMDAwMDAgOiAidS1ib290LWVudiIKPj4gWyAgICAw
Ljk4OTU1N10gMHgwMDAwMDAxMDAwMDAtMHgwMDAwMDBhMDAwMDAgOiAia2VybmVsIgo+PiBbICAg
IDAuOTk2NzcyXSAweDAwMDAwMGEwMDAwMC0weDAwMDAwMmEwMDAwMCA6ICJyb2ZzIgo+PiBbICAg
IDEuMDAzNzU5XSAweDAwMDAwMmEwMDAwMC0weDAwMDAwNDAwMDAwMCA6ICJyd2ZzIgo+PiAtLQo+
PiBbICAgIDEuMDQ4MzA0XSA1IGZpeGVkLXBhcnRpdGlvbnMgcGFydGl0aW9ucyBmb3VuZCBvbiBN
VEQgZGV2aWNlIGFsdC1ibWMKPj4gWyAgICAxLjA1NTU2M10gQ3JlYXRpbmcgNSBNVEQgcGFydGl0
aW9ucyBvbiAiYWx0LWJtYyI6Cj4+IFsgICAgMS4wNjEwOTZdIDB4MDAwMDAwMDAwMDAwLTB4MDAw
MDAwMGUwMDAwIDogImFsdC11LWJvb3QiCj4+IFsgICAgMS4wNjg2NzJdIDB4MDAwMDAwMGUwMDAw
LTB4MDAwMDAwMTAwMDAwIDogImFsdC11LWJvb3QtZW52Igo+PiBbICAgIDEuMDc2NjA3XSAweDAw
MDAwMDEwMDAwMC0weDAwMDAwMGEwMDAwMCA6ICJhbHQta2VybmVsIgo+PiBbICAgIDEuMDg0MjEx
XSAweDAwMDAwMGEwMDAwMC0weDAwMDAwMmEwMDAwMCA6ICJhbHQtcm9mcyIKPj4gWyAgICAxLjA5
MTU5NF0gMHgwMDAwMDJhMDAwMDAtMHgwMDAwMDQwMDAwMDAgOiAiYWx0LXJ3ZnPigJ0KPj4gCj4+
IGFuZCB0aGUgbXRkIGRldmljZXMgbGlzdGVkIGluIC9zeXMvY2xhc3MvbXRkIGZyb20gbXRkMSB0
aHJvdWdoIG10ZDEyIGFyZSBiYXNpY2FsbHkgZnJvbSB0aGUgcGFydGl0aW9ucyBsaXN0IGFib3Zl
Lgo+PiAKPj4gcm9vdEBteWJveDovc3lzL2NsYXNzL210ZCMgZm9yIGRpciBpbiAqOyBkbyBjYXQg
JGRpci9uYW1lOyBkb25lCj4+IGJtYwo+PiBhbHQta2VybmVsCj4+IGFsdC1yb2ZzCj4+IGFsdC1y
d2ZzCj4+IHUtYm9vdAo+PiB1LWJvb3QtZW52Cj4+IGtlcm5lbAo+PiByb2ZzCj4+IHJ3ZnMKPj4g
YWx0LWJtYwo+PiBhbHQtdS1ib290Cj4+IGFsdC11LWJvb3QtZW52Cj4+IAo+PiBEb2VzIGFueW9u
ZSBrbm93IHdoYXQgY291bGQgYmUgdGhlIHBvc3NpYmxlIHJlYXNvbiBmb3IgdGhlIHByb2JsZW0g
PyBBbnkgaGludHMvaGVscCB3b3VsZCBiZSBhcHByZWNpYXRlZC4KPj4gCj4+IFRoYW5rcywKPj4g
TWFub2oKPj4gCj4+IAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
