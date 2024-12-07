Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50030E7717B
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 08:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fCu9gxj+qvk2w9vbiaFh+FvUIP+hjSVW+il73hOgNCE=; b=jQYaPHqf0FsX9k/4Jiuxmu/bLU
	4NLI26YOVe7hkMfVWmXoUhqbCb8WT+27NoHt/HsMcgs5XoMmnpwAWFfCTlWnRGfZAd3d7IN+8rT9/
	B7CfYkHTnTgk/WJi1+rPNwobxhbh58naGBlqi+90vtKZi2EHKl8smZ26mWHMyBgourS8u9U9mygat
	55oXLnmeSBstiAUG66ilFVVbSx+53Jk7DgbPWXQHJCZvLuxRSLlXANShhTMvDrt1/HWxW72+v00US
	bzCKOE2+F7ZIvTENTGdnqu1yFKVxBDDr+P52DLzgSgnL+bBTqQ92bxlzn7ws2Hhc4HowfLV2Oh+7d
	yDjv/ijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJppn-00000003cOM-2Fjw;
	Sat, 07 Dec 2024 08:06:39 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJppj-00000003cNl-40hK
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 08:06:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1272E2E6145;
	Sat,  7 Dec 2024 09:06:31 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id H1p4nZAyrnro; Sat,  7 Dec 2024 09:06:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 221CA2E6150;
	Sat,  7 Dec 2024 09:06:30 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qIbQ8kcJtlGC; Sat,  7 Dec 2024 09:06:30 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id F3E5A2E6145;
	Sat,  7 Dec 2024 09:06:29 +0100 (CET)
Date: Sat, 7 Dec 2024 09:06:29 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>, 
	Rickard X Andersson <rickard.andersson@axis.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>, 
	kernel <kernel@axis.com>
Message-ID: <745357310.45555475.1733558789826.JavaMail.zimbra@nod.at>
In-Reply-To: <adeb2ad0-f922-9bb6-db68-deaf7983704b@huawei.com>
References: <20241206115127.2304701-1-rickard.andersson@axis.com> <20241206115127.2304701-2-rickard.andersson@axis.com> <adeb2ad0-f922-9bb6-db68-deaf7983704b@huawei.com>
Subject: Re: [PATCH v3 2/2] ubi: Implement ioctl for detailed erase counters
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Topic: Implement ioctl for detailed erase counters
Thread-Index: jDrOewbLkvwa5W6DvQuEx49P3cfiVw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_000636_279425_8A1B49D8 
X-CRM114-Status: GOOD (  14.89  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAiUmlja2FyZCBYIEFuZGVyc3NvbiIgPHJpY2th
cmQuYW5kZXJzc29uQGF4aXMuY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJsaW51
eC1tdGQiCj4g5ZyoIDIwMjQvMTIvNiAxOTo1MSwgUmlja2FyZCBBbmRlcnNzb24g5YaZ6YGTOgo+
PiBDdXJyZW50bHksICJtYXhfZWMiIGNhbiBiZSByZWFkIGZyb20gc3lzZnMsIHdoaWNoIHByb3Zp
ZGVzIGEgbGltaXRlZAo+PiB2aWV3IG9mIHRoZSBmbGFzaCBkZXZpY2XigJlzIHdlYXIuIEluIGNl
cnRhaW4gY2FzZXMsIHN1Y2ggYXMgYnVncyBpbgo+PiB0aGUgd2Vhci1sZXZlbGluZyBhbGdvcml0
aG0sIHNwZWNpZmljIGJsb2NrcyBjYW4gYmUgd29ybiBkb3duIG1vcmUKPj4gdGhhbiBvdGhlcnMs
IHJlc3VsdGluZyBpbiB1bmV2ZW4gd2VhciBkaXN0cmlidXRpb24uIEFsc28gc29tZSB1c2UgY2Fz
ZXMKPj4gY2FuIHdlYXIgdGhlIGVyYXNlIGJsb2NrcyBvZiB0aGUgZmFzdG1hcCBhcmVhIG1vcmUg
aGVhdmlseSB0aGFuIG90aGVyCj4+IHBhcnRzIG9mIGZsYXNoLgo+PiBQcm92aWRpbmcgZGV0YWls
ZWQgZXJhc2UgY291bnRlciB2YWx1ZXMgZ2l2ZSBhIGJldHRlciB1bmRlcnN0YW5kaW5nIG9mCj4+
IHRoZSBvdmVyYWxsIGZsYXNoIHdlYXIgYW5kIGlzIG5lZWRlZCB0byBiZSBhYmxlIHRvIGNhbGN1
bGF0ZSBmb3IgZXhhbXBsZQo+PiBleHBlY3RlZCBsaWZlIHRpbWUuCj4+IFRoZXJlIGV4aXN0cyBt
b3JlIGRldGFpbGVkIGluZm8gaW4gZGVidWdmcywgYnV0IHRoaXMgaW5mb3JtYXRpb24gaXMKPj4g
b25seSBhdmFpbGFibGUgZm9yIGRlYnVnIGJ1aWxkcy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFJp
Y2thcmQgQW5kZXJzc29uIDxyaWNrYXJkLmFuZGVyc3NvbkBheGlzLmNvbT4KPj4gLS0tCj4+ICAg
ZHJpdmVycy9tdGQvdWJpL2NkZXYuYyB8IDcyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspCj4gCj4g
SGkgUmlja2FyZC4gU29tZSBzbWFsbCBuaXRzIGJlbG93LgoKUGxlYXNlIGFsc28gcnVuIGNoZWNr
cGF0Y2gucGwsIHRoZXJlIGFyZSBzb21lIGNvZGluZyBzdHlsZSBpc3N1ZXMuCk92ZXJhbGwgdGhl
IGNoYW5nZSBsb29rcyBnb29kIHRvIG1lIGFuZCBjYW4gYmUgbWVyZ2VkIHNvb24hCgo+PiAKPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9jZGV2LmMgYi9kcml2ZXJzL210ZC91YmkvY2Rl
di5jCj4+IGluZGV4IDBkOGYwNGNmMDNjNS4uYmNkYzQ3Mzc0NTc4IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL210ZC91YmkvY2Rldi5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9jZGV2LmMKPj4g
QEAgLTgyOCw2ICs4MjgsNzIgQEAgc3RhdGljIGludCByZW5hbWVfdm9sdW1lcyhzdHJ1Y3QgdWJp
X2RldmljZSAqdWJpLAo+PiAgIAlyZXR1cm4gZXJyOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyBp
bnQgdWJpX2dldF9lY19pbmZvKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIHN0cnVjdCB1YmlfZWNp
bmZvX3JlcSBfX3VzZXIKPj4gKnVyZXEpCj4+ICt7Cj4+ICsJc3RydWN0IHViaV9lY2luZm9fcmVx
IHJlcTsKPj4gKwlzdHJ1Y3QgdWJpX3dsX2VudHJ5ICp3bDsKPj4gKwlpbnQgaTsKPiAKPiBXZSBj
YW4gdXNlIGEgb2J2aW91cyBuYW1lIGxpa2UgJ3JlYWRfY250JyBvciAncmVhZF9sZW5ndGgnLCBp
bnN0ZWFkIG9mICdpJy4KPj4gKwlpbnQgcGViOwo+PiArCWludCBlbmRfcGViOwo+PiArCj4+ICsJ
LyogQ29weSB0aGUgaW5wdXQgYXJndW1lbnRzICovCj4+ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZy
ZXEsIHVyZXEsIHNpemVvZihzdHJ1Y3QgdWJpX2VjaW5mb19yZXEpKSkKPj4gKwkJcmV0dXJuIC1F
RkFVTFQ7Cj4+ICsKPj4gKwkvKiBDaGVjayBpbnB1dCBhcmd1bWVudHMgKi8KPj4gKwlpZiAocmVx
Lmxlbmd0aCA8PSAwIHx8IHJlcS5zdGFydCA8IDApCj4gCj4gSG93IGFib3V0ICdpZiAocmVxLmxl
bmd0aCA8PSAwIHx8IHJlcS5zdGFydCA8IDAgfHwgcmVxLnN0YXJ0ID49Cj4gdWJpLT5wZWJfY291
bnQpJz8gVGhlbiAnaWYgKHJlcS5zdGFydCA+IGVuZF9wZWIpJyBiZWxvdyBjYW4gYmUgZGVsZXRl
ZC4KPj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gKwlpZiAoY2hlY2tfYWRkX292ZXJmbG93
KHJlcS5zdGFydCwgcmVxLmxlbmd0aCwgJmVuZF9wZWIpKQo+IAo+IEhvdyBhYm91dCAnaWYgKHVu
bGlrZWx5KGNoZWNrX2FkZF9vdmVyZmxvdyhyZXEuc3RhcnQsIHJlcS5sZW5ndGgsCj4gJmVuZF9w
ZWIpKSknID8KCldlbGwsIHRoaXMgaXMgbm90IGEgaG90IHBhdGguIFdoYXQgaXMgdGhlIGJlbmVm
aXQgb2YgYW4gdW5saWtlbHkoKSBoZXJlPwoKPj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4g
KwlpZiAoZW5kX3BlYiA+IHViaS0+cGViX2NvdW50KQo+PiArCQllbmRfcGViID0gdWJpLT5wZWJf
Y291bnQ7Cj4+ICsKPj4gKwlpZiAocmVxLnN0YXJ0ID4gZW5kX3BlYikKPiAKPiBUaGlzIGNoZWNr
IGNhbiBiZSByZW1vdmVkLgo+PiArCQlyZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiArCS8qIENoZWNr
IGFjY2VzcyByaWdodHMgYmVmb3JlIGZpbGxpbmcgZXJhc2VfY291bnRlcnMgYXJyYXkgKi8KPj4g
KwlpZiAoIWFjY2Vzc19vayh1cmVxLT5lcmFzZV9jb3VudGVycywgKGVuZF9wZWItcmVxLnN0YXJ0
KSAqIHNpemVvZihpbnQzMl90KSkpCj4+ICsJCXJldHVybiAtRUZBVUxUOwo+IAo+IFdlIGNhbiB1
c2UgJ3B1dF91c2VyJyBiZWxvdyB0byByZXBsYWNlIHRoZSBjaGVjayAnYWNjZXNzX29rJy4KCkRl
cGVuZGluZyBvbiB0aGUgYXJjaGl0ZWN0dXJlLCBhY2Nlc3Nfb2soKSBjYW4gYml0IHJhdGhlciBl
eHBlbnNpdmUuClRoYXQncyB3aHkgdXNpbmcgYWNjZXNzX29rKCkgb25jZSBvbiB0aGUgd2hvbGUg
cmFuZ2UgYW5kIHRoZW4gdXNpbmcKdGhlIGNoZWFwIF9fcHV0X3VzZXIoKSBpbiBsb29wcyBpcyBh
IGNvbW1vbiBwYXR0ZXJuLgoKPiAKPiBmb3IgKHBlYiA9IHJlcS5zdGFydDsgcGViIDwgZW5kX3Bl
YjsgaSsrLCBwZWIrKykgewo+CWludCBlYyA9IFVCSV9VTktOT1dOOwo+IAo+CWlmICghdWJpX2lv
X2lzX2JhZCh1YmksIHBlYikpIHsKPgkJc3Bpbl9sb2NrKCZ1YmktPndsX2xvY2spOwo+CQl3bCA9
IHViaS0+bG9va3VwdGJsW3BlYl07Cj4JCWlmICh3bCkKPgkJCWVjID0gd2wtPmVjOwo+CQllbHNl
Cj4JCQllYyA9IFVCSV9VTktOT1dOOwo+CQlzcGluX3VubG9jaygmdWJpLT53bF9sb2NrKTsKPgl9
Cj4gCj4JaWYgKHVubGlrZWx5KHB1dF91c2VyKGVjLCB1cmVxLT5lcmFzZV9jb3VudGVycytpKSkp
Cj4JCXJldHVybiAtRUZBVUxUOwo+IH0KPiAKPj4gKwo+PiArCS8qIEZpbGwgZXJhc2UgY291bnRl
ciBhcnJheSAqLwo+PiArCWkgPSAwOwo+PiArCWZvciAocGViID0gcmVxLnN0YXJ0OyBwZWIgPCBl
bmRfcGViOyBpKyssIHBlYisrKSB7Cj4+ICsJCWludCBlYzsKPj4gKwo+PiArCQlpZiAodWJpX2lv
X2lzX2JhZCh1YmksIHBlYikpIHsKPj4gKwkJCWlmIChfX3B1dF91c2VyKFVCSV9VTktOT1dOLCB1
cmVxLT5lcmFzZV9jb3VudGVycytpKSkKPj4gKwkJCQlyZXR1cm4gLUVGQVVMVDsKPj4gKwo+PiAr
CQkJY29udGludWU7Cj4+ICsJCX0KPj4gKwo+PiArCQlzcGluX2xvY2soJnViaS0+d2xfbG9jayk7
Cj4+ICsKPj4gKwkJd2wgPSB1YmktPmxvb2t1cHRibFtwZWJdOwo+PiArCQlpZiAod2wpCj4+ICsJ
CQllYyA9IHdsLT5lYzsKPj4gKwkJZWxzZQo+PiArCQkJZWMgPSBVQklfVU5LTk9XTjsKPj4gKwo+
PiArCQlzcGluX3VubG9jaygmdWJpLT53bF9sb2NrKTsKPj4gKwo+PiArCQlpZiAoX19wdXRfdXNl
cihlYywgdXJlcS0+ZXJhc2VfY291bnRlcnMraSkpCj4+ICsJCQlyZXR1cm4gLUVGQVVMVDsKPj4g
Kwo+PiArCX0KPiAKPiAKPj4gKwo+PiArCS8qIFJldHVybiBhY3R1YWwgcmVhZCBsZW5ndGggKi8K
Pj4gKwlyZXEucmVhZF9sZW5ndGggPSBpOwo+PiArCj4+ICsJLyogQ29weSBldmVyeXRoaW5nIGV4
Y2VwdCBlcmFzZSBjb3VudGVyIGFycmF5ICovCj4+ICsJaWYgKGNvcHlfdG9fdXNlcih1cmVxLCAm
cmVxLCBzaXplb2Yoc3RydWN0IHViaV9lY2luZm9fcmVxKSkpCj4+ICsJCXJldHVybiAtRUZBVUxU
Owo+IAo+IGlmICh1bmxpa2VseSguLi4KPj4gKwo+PiArCXJldHVybiAwOwo+PiArfQo+PiArCj4+
ICAgc3RhdGljIGxvbmcgdWJpX2NkZXZfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVk
IGludCBjbWQsCj4+ICAgCQkJICAgdW5zaWduZWQgbG9uZyBhcmcpCj4+ICAgewo+PiBAQCAtOTkx
LDYgKzEwNTcsMTIgQEAgc3RhdGljIGxvbmcgdWJpX2NkZXZfaW9jdGwoc3RydWN0IGZpbGUgKmZp
bGUsIHVuc2lnbmVkIGludAo+PiBjbWQsCj4+ICAgCQlicmVhazsKPj4gICAJfQo+PiAgIAo+PiAr
CWNhc2UgVUJJX0lPQ0VDTkZPOgo+PiArCXsKPj4gKwkJZXJyID0gdWJpX2dldF9lY19pbmZvKHVi
aSwgYXJncCk7Cj4+ICsJCWJyZWFrOwo+PiArCX0KPj4gKwo+PiAgIAlkZWZhdWx0Ogo+PiAgIAkJ
ZXJyID0gLUVOT1RUWTsKPj4gICAJCWJyZWFrOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
