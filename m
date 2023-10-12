Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993EECDB474
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwLhi5l3HVluJbTSXu5PeEOIL5pJWTzTgZOZamzSFzs=; b=Doai+xzqmycRqa
	qseYpMPjxRYqvqOO65f4CcIejCFSOjjXo9nCVlcjuppmWpCaARYJchFyFC9atM6gbd70UnZ5NvWCX
	Wkdq240l86iyF1zNfpuDERmkAYhaBLdzxGDLCHW0uOPzriq21EotlMR5WlkEZ0+qIJiJ2BIwANBmc
	dVU3UnmqNbgM+wnibRIDaXEjAVJFayHXQdN7HYSFYMnn21RlxCXH2CR5i2Ydzms+bbdQ7+hpJS4Cr
	5HXwxlIfh23MnfoKLe81KoLpr5Ldc75riUYr1BRAt5F+VzibaNi+YQ60U7j3S7lVy3rnvwd508gPn
	U39oBGgE0tfT+992TzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr3F7-001tsm-2Y;
	Thu, 12 Oct 2023 21:29:17 +0000
Received: from mout.gmx.com ([74.208.4.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr3F5-001tsG-0H
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 21:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1697146139; x=1697750939; i=dregan@mail.com;
 bh=Mvuu94i8xtEMjbYMXPQkVcVcctpYOoVTda+pB5qWWlg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HXFnwgzvBvCIOsIiDKIy0qmA0xw8cDm1PbHjsQKVKwIQQDlQekD9tTPjbLn2gQz60Zfmr4PeGDr
 1cyUlFpcR5MbDQvbpwqiC3ZQFwCT9djV5E/6KCfZpv5SiCMeQTb7Jc+vP/ygfHYEaQ5atL9YSERXa
 CuoQYMHsRtgyVzs9MJ4dd+i86W3v4VFv2OCsg31DTdheW5Tb65Misoxp0ZwmNuGrK43stCOE8Gfn8
 e5yngY3eS4KKG9zuHpPRmHFta5+afwPATICM4jHnXXmdYo9kNJk2AKY8xudQngmquGstZVQo4Fzad
 0Z5M2p9XicIr7ee6ItH5LdbMd/J9pu54+WCw==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [192.19.223.252] ([192.19.223.252]) by web-mail.mail.com
 (3c-app-mailcom-lxa06.server.lan [10.76.45.7]) (via HTTP); Thu, 12 Oct 2023
 23:28:59 +0200
MIME-Version: 1.0
Message-ID: <trinity-5a1ca451-0d23-42d3-978e-ccc0036ff827-1697146139044@3c-app-mailcom-lxa06>
From: dregan@mail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v2 4/4] mtd: rawnand: brcmnand: exec_op implementation
Date: Thu, 12 Oct 2023 23:28:59 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20231012091821.278170ed@xps-13>
References: <trinity-826f99ef-9889-499b-b68a-fbfd72e913a0-1697071357070@3c-app-mailcom-lxa05>
 <20231012091821.278170ed@xps-13>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:J+NN3g4M719bV24RhmectePAWqvtpJnpZUwDklqiEV9n1ViKzr4NSXs/+aAR27bSX7ZaL
 7JWequ6nvXoR9dQsSL293vzenOKzZHsaAOSwU0mJBCkILoJX5cRx8tY13MrMdN/h6fMVRrmRpm3+
 wmkJ4F1QAt9wuzwnJwNaMUrJV4EDR/p0Bo7VLfvUYF7kJjWoANTSJqlbWwmTw/ktOqIp6j/FZnJ3
 kKImRnWHxIfmwU8ZMd8z8OoTOZ9+qQltZTpasZRtUXNU5Hzg1Yfm6uyYIE1oFYdzwQWzJ0hCDZtR
 yA=
UI-OutboundReport: notjunk:1;M01:P0:3Tr72pA0IJk=;/RXVzeF4vnQU640Ca/2fkoioVPV
 cHiF5U2RHwHs0u6JnOyqgwBxn+A8Sav/qMcZZfcPIDMFiOs8+sJKLl14W3UutOSMt0BgQv+oa
 W+O9fx43qUuSxjOAM4Aw1ipkawsBPZeR4fr4esUdciUcQMxJHe6+BnV9leU9qJ198YzrR9jzH
 PAwukqGSpH4o5dYrWXPEalII5rjUBO4mYv3x0MVC/TIQraAUSgBu1z47hqdlCX5gpSo753lXm
 HZFz4Rz3nUM/4s/usDT1yYIv2aYqd1FgJqlChWl24UT82ENiswBnlMawzO3wvbz1LJP41C9hn
 hMRECQRelP47kX8rsuvG3gUdnsjpo1Eqqp+momsyJmI1sY+HTkUtpJeeWSP+GYf69Ct/D2oxV
 PYa/0XNmPpANXAXgsXfv4VBDyJDHilJ6aLnlouCyDIhyOnLREPycYlGyCZC9j+vPrGI8GTvay
 l7Ut2nx7L0xXFMwUjKYH/eEceew2ZYYbh8J6GRCRXNdGOJUVcf/kWnefdoV8QEF47fGwDgRBo
 Wp67hdByrCeJ92lOtP8CgJL6M3EfpbNAa7PtkJwJ/DzROqeORSa2c9O4ScSNlSIauP832J8ds
 U56mzxeHTSS09QlrDNrlxdnCPceyJ0MVoE/uSBV72AiDkQ8cuTVy8jvA+utI09gHbsxH2OagR
 e7QzOwpqeO4ogMzWgGG8pyLFLrF9/uh9o1bfTRt57adARZMXzneSOtrmXitSDMLOB0Wk+btOh
 1JDU5gEQhv3o3RAJfV7RhOduey8x4V2Id8Ct5IZVkbX5hzHdJKuH9nvjxPVXnzLd9s2uSs/kI
 1w5G4mdI+zHyUzRc6dw0GVsg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_142915_196098_1ED0BB73 
X-CRM114-Status: GOOD (  19.09  )
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

SGkgTWlxdcOobCwKCj4KPiBIZWxsbywKPiAKPiBkcmVnYW5AbWFpbC5jb20gd3JvdGUgb24gVGh1
LCAxMiBPY3QgMjAyMyAwMjo0MjozNyArMDIwMDoKPiAKCi4uLgoKPiA+ICsKPiA+ICtpbnQgYnJj
bW5hbmRfZXhlY19vcF9pc19zdGF0dXMoY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCkK
PiA+ICt7Cj4gPiArCWlmICgob3AtPmluc3Ryc1swXS50eXBlID09IE5BTkRfT1BfQ01EX0lOU1RS
KSAmJgo+ID4gKwkJKG9wLT5pbnN0cnNbMF0uY3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfU1RB
VFVTKSAmJgo+ID4gKwkJKG9wLT5uaW5zdHJzID4gMSkgJiYKPiA+ICsJCShvcC0+aW5zdHJzWzFd
LnR5cGUgPT0gTkFORF9PUF9EQVRBX0lOX0lOU1RSKSkKPiAKPiBZb3UgbmVlZCB0byBzdGFydCBj
aGVja2luZyBpZiBvcC0+bmluc3RycyA9PSAyLCBubz8KCldpbGwgZml4LgoKPiAKPiA+ICsJCXJl
dHVybiAxOwo+ID4gKwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAraW50IGJyY21u
YW5kX2V4ZWNfb3BfaXNfcmVzZXQoY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCkKPiA+
ICt7Cj4gPiArCWlmICgob3AtPmluc3Ryc1swXS50eXBlID09IE5BTkRfT1BfQ01EX0lOU1RSKSAm
Jgo+ID4gKwkJKG9wLT5pbnN0cnNbMF0uY3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfUkVTRVQp
KQo+IAo+IFBsZWFzZSBjaGVjayBuaW5zdHJzIGFzIHdlbGwgKGZpcnN0KS4KCldpbGwgZG8uCgo+
IAo+ID4gKwkJcmV0dXJuIDE7Cj4gPiArCj4gPiArCXJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+
ICtzdGF0aWMgaW50IGJyY21uYW5kX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiA+
ICsJCQkgICAgY29uc3Qgc3RydWN0IG5hbmRfb3BlcmF0aW9uICpvcCwKPiA+ICsJCQkgICAgYm9v
bCBjaGVja19vbmx5KQo+ID4gK3sKPiA+ICsJc3RydWN0IGJyY21uYW5kX2hvc3QgKmhvc3QgPSBu
YW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gPiArCXN0cnVjdCBtdGRfaW5mbyAqbXRk
ID0gbmFuZF90b19tdGQoY2hpcCk7Cj4gPiArCWNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICpp
bnN0ciA9ICZvcC0+aW5zdHJzWzBdOwo+ID4gKwl1OCAqc3RhdHVzOwo+ID4gKwl1bnNpZ25lZCBp
bnQgaTsKPiA+ICsJaW50IHJldCA9IDA7Cj4gPiArCj4gPiArCWlmIChjaGVja19vbmx5KQo+ID4g
KwkJcmV0dXJuIDA7Cj4gPiArCj4gPiArCWlmIChicmNtbmFuZF9leGVjX29wX2lzX3N0YXR1cyhv
cCkpIHsKPiA+ICsJCXN0YXR1cyA9IG9wLT5pbnN0cnNbMV0uY3R4LmRhdGEuYnVmLmluOwo+ID4g
KwkJKnN0YXR1cyA9IGJyY21uYW5kX3N0YXR1cyhob3N0KTsKPiA+ICsKPiA+ICsJCXJldHVybiAw
Owo+ID4gKwl9Cj4gPiArCj4gPiArCWlmIChvcC0+ZGVhc3NlcnRfd3ApCj4gPiArCQlicmNtbmFu
ZF93cChtdGQsIDApOwo+ID4gKwo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgb3AtPm5pbnN0cnM7IGkr
Kykgewo+ID4gKwkJaW5zdHIgPSAmb3AtPmluc3Ryc1tpXTsKPiA+ICsKPiA+ICsJCWlmIChpbnN0
ci0+dHlwZSA9PSBOQU5EX09QX1dBSVRSRFlfSU5TVFIpIHsKPiA+ICsJCQlyZXQgPSBiY21uYW5k
X2N0cmxfcG9sbF9zdGF0dXMoaG9zdCwgTkFORF9DVFJMX1JEWSwgTkFORF9DVFJMX1JEWSwgMCk7
Cj4gCj4gV2h5IGRvbid0IHlvdSBoYW5kbGUgdGhpcyBpbiBicmNtbmFuZF9leGVjX2luc3RyKCkg
PyBJdCB3b3VsZCBsb29rIG11Y2gKPiBuaWNlci4gRXZlbiBpZiB0aGlzIGRvZXMgbm90IGludm9s
dmUgYW55IGFkZGl0aW9uYWwgImN5Y2xlIiBvbiB0aGUgTkFORAo+IGJ1cywgaXQgc3RpbGwgaXMg
YW4gaW5zdHJ1Y3Rpb24gb2YgdGhlIGN1cnJlbnQgb3BlcmF0aW9uLgoKR29vZCBpZGVhLgoKPiAK
PiA+ICsJCQlpZiAocmV0KQo+ID4gKwkJCQlicmVhazsKPiA+ICsJCX0gZWxzZSB7IC8qIG90aGVy
d2lzZSBwYXNzIHRvIGxvdyBsZXZlbCBpbXBsZW1lbnRhdGlvbiAqLwo+ID4gKwkJCXJldCA9IGJy
Y21uYW5kX2V4ZWNfaW5zdHIoaG9zdCwgaW5zdHIsIGkgPT0gKG9wLT5uaW5zdHJzIC0gMSkpOwo+
IAo+IFdoYXQncyB0aGUgcG9pbnQgb2YgdGhpcyBpID09IG9wLT5uaW5zdHJzIC0gMSBjaGVjaz8K
PiAKCkl0J3MgdG8gbGV0IHRoZSBjb250cm9sbGVyIGtub3cgd2UgYXJlIGlzc3VpbmcgdGhlIGxh
c3QgY29tbWFuZAppbiBhIHNlcmllcyBvZiBjb21tYW5kcy4gSSBtYXkgbmVlZCB0byByZXdvcmsg
dGhpcyBhcyB0byBtb3ZpbmcKd2FpdHJkeSBpbnRvIGJyY21uYW5kX2V4ZWNfaW5zdHIKCgo+ID4g
KwkJCWlmIChyZXQpCj4gPiArCQkJCWJyZWFrOwo+ID4gKwkJfQo+ID4gKwl9Cj4gPiArCj4gPiAr
CWlmIChvcC0+ZGVhc3NlcnRfd3ApCj4gPiArCQlicmNtbmFuZF93cChtdGQsIDEpOwo+ID4gKwo+
ID4gKwlpZiAoYnJjbW5hbmRfZXhlY19vcF9pc19yZXNldChvcCkpIHsKPiA+ICsJCWJyY21uYW5k
X3N0YXR1cyhob3N0KTsKPiA+ICsJCWJyY21uYW5kX3dwKG10ZCwgMSk7Cj4gCj4gVGhpcyBzaG91
bGQgYmUgZG9uZSByaWdodCBhZnRlciB0aGUgc3RhdHVzIGNoZWNrLCBubz8KPiAKPiBBbnl3YXks
IEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgdGhpcy4gV2h5IGRvIHlvdSByZWFkIHRoZSBzdGF0
dXMgYW5kCj4gYXNzZXJ0IFdQPwoKSSByZWFkIHRoZSBzdGF0dXMgdG8gZmlsbCB0aGUgY2FjaGVk
IHN0YXR1cywgYW5kIHJlc2V0IHRoZSBXUCB0bwppdCdzIGRlZmF1bHQgc3RhdGUuCgouLi4KCj4g
VGhhbmtzLAo+IE1pcXXDqGwKPgoKVGhhbmtzIQoKLURhdmUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
