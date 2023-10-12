Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A29CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 17:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nG5Jub3SH+EQY9MArsPbbwgiek2Oh1gIrlPoj0HOwSU=; b=YpcWZCnAHLAUcG
	XFkLhVjNraCdajJbwssT8U8YRMiZvigSSmyEqcnzIADAE4Pg5BDdhiSG+ad3bhKkNSLkOcXtvybNu
	J5MuhKdFQnQwRlEF3V1lyZJoMuarOg+UyDLDkhfC6D7pA59ip6oUkILmw9vH/jmPnke+EYWyGj4Yw
	5IyFYF8DPj2LGun9oVK8gSLC7w8SPy/P1yTRaaqJ7HEiyzS+qVZQUZLpyhTPpDIfOINwgLHGlJXKZ
	PUfI4jYiNy4BE6gMhuPsaFu5vkemUdQgvUcVi1K8lpRyLdUjX9aJ08vGpJcXxrQ9+ftqJqU46FuvU
	4qb6R+kGIXic24D0l8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqzcA-001XdG-0e;
	Thu, 12 Oct 2023 17:36:50 +0000
Received: from mout.gmx.com ([74.208.4.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqzc5-001Xcp-17
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 17:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1697132171; x=1697736971; i=dregan@mail.com;
 bh=JLzyiMVdQT5je35oeGWrwkIITYkylkAusRWecnGPucA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NTnauJfsDh244HyjrMl6jZRO8sorB3qXkduR2cn9DBX+cFYrFEvOJqRVRuNCGqj/X8ImaPzrWTS
 wQvjx9rBCVm43UeDy56xU34ir/5HXainXoZMJzNPce7Ai1pyNtj3jEFbUeXCwjmH8g6XPTayY6BBT
 YmBENs3/N4bIOasIzwT7mSft7HOMO4JP0EtgH8jRCVyNGjfWmyMjqqEOfX7WGubNkeumLGpgClvZE
 39IaexV5GP7ptJAFkBx5B1VgeTAv58spv5NsYAtr+DxyixJkU8bbTQO9w61y1ZDykl5xiTmkXko1f
 3LZ/+Yu2V09m0X6+iVgwTQKW3oO8B4LereUw==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [192.19.223.252] ([192.19.223.252]) by web-mail.mail.com
 (3c-app-mailcom-lxa13.server.lan [10.76.45.14]) (via HTTP); Thu, 12 Oct
 2023 19:36:11 +0200
MIME-Version: 1.0
Message-ID: <trinity-902f8ae6-26e3-484b-ba2d-00946a63333a-1697132171458@3c-app-mailcom-lxa13>
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
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Add destructive operation
Date: Thu, 12 Oct 2023 19:36:11 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20231012090638.1e093fe6@xps-13>
References: <trinity-d4b16b4a-e223-4daf-8a3e-4aaa7fc6c9cb-1697071235519@3c-app-mailcom-lxa05>
 <20231012090638.1e093fe6@xps-13>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:PyZmommfx2GeMLUGhBoIA+d5s6Sj1r1HRYdOU0YjAwCRySpgqa+3yljr3t8k7x2ZqcsyL
 4nQZ/mT1VcMnU1qwftYJRk+dHOycaS8ELY8bzFJmWlzBZQah385eckdZ6RNoF36sjwE6+apFVdcw
 O7NnFrYe1Rovuxqk2tll4eRf5Jvkj30bjG4873nCxMRe7PGw4vP1IFq4v4KI9DVUYHWHVE/aEOv/
 EfBi7G7z36u8MbPgU13Ty/ZqzRsw+TbvSiCIzeKUYPtfZ5qh7C8DAPPTij4lLuAnHs/9cI7lERHQ
 rA=
UI-OutboundReport: notjunk:1;M01:P0:0tQGgpcWSoc=;Ua2iO164G8CwcM0I1kdmRRJR8bg
 uoDo2uJ5sZHe2AElnuOu1LagOAEBOKA6JOrXVsW4KStiSxnBx+mp5YbfnTOJqxPpNn75JMc9V
 TD5nvaq+bQ2tqdt6MW8i+bVGuYYOQeiJ/UsnsIT0OR1vhwhZQN4/I/jxY/W6PUzJJAKyDvylS
 cpLCjYOv1W/ROMLQO4txS3iO+HjA+EjaaD5qJAAiclVeACendpAw7zuRM2A2zJHiS0lsAjK6t
 uSam8LQNhyAYhbHYHtnawHFFmsDGG1FOYaoDagEs2ZTTTjIv5e1Y+UzDSkiLZ5bNEEC2LqyeF
 GItygDPFN8n8Y4df3Nr1gXxmZhrxa/lg/0eeTNWFDNSSbXCiP6V3BfiZXsp5BnIf0vSv5jnQS
 WoklDtKLS8y+9guraCXwwK3mNC9/xhzrotj/mfiDsxKyqSqpwHYAL7SeAUDUze7VDAdpnxVU7
 XHn+ad+knPrrThYvyFN/kl+N+yoo7dRePaMBmefXCFYIfR18ccaQOyA+2g0MUAlGFnIJslCwq
 ju+m4JQS61eR4SQmZPXIKIzrvWlEvEGOShLfcOx5rrKeeOcI73zI8kT/fBfftLzLfG7nYj0Id
 qv2OWxwPNWH5S2Y1A+B+BEraGum9D4e3EXd0k5O5lSRD72sVsgRw8SxiG4JOLIXC1u4pT32dx
 RtUjYckBTdDPslXyzZJkn597wZzruO3B9AigbKPfuDA75ikoK+PQH86dKr9pvSrU1k6aSQoxb
 rZIS4jSjrV9wrdQRE8Qg3ndUd9GvPSezQLjFoX06aItgn0s42t61WKKYnDcAW/Qx71PDwCgKx
 xlJl6wcpZYo8jzkkK4cdB09Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_103646_389884_C163F5BD 
X-CRM114-Status: GOOD (  15.65  )
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

SGkgTWlxdWVsLAoKPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAxMiwgMjAyMyBhdCAxMjowNiBB
TQo+IEZyb206ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBU
bzogZHJlZ2FuQG1haWwuY29tCj4gQ2M6IGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBicm9hZGNv
bS5jb20sIGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnLCBmLmZhaW5lbGxpQGdtYWlsLmNv
bSwgcmFmYWxAbWlsZWNraS5wbCwgam9lbC5wZXNoa2luQGJyb2FkY29tLmNvbSwgY29tcHV0ZXJz
Zm9ycGVhY2VAZ21haWwuY29tLCBkYW4uYmV5Z2VsbWFuQGJyb2FkY29tLmNvbSwgd2lsbGlhbS56
aGFuZ0Bicm9hZGNvbS5jb20sIGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZSwgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZywgdmlnbmVzaHJAdGkuY29tLCByaWNoYXJkQG5vZC5hdCwgYmJy
ZXppbGxvbkBrZXJuZWwub3JnLCBrZGFzdS5rZGV2QGdtYWlsLmNvbSwgIkphaW1lTGlhbyIgPGph
aW1lbGlhby50d0BnbWFpbC5jb20+LCAiQXJzZW5peSBLcmFzbm92IiA8QVZLcmFzbm92QHNiZXJk
ZXZpY2VzLnJ1PiwgIkFkYW0gQm9yb3dza2kiIDxraWxvYnl0ZUBhbmdiYW5kLnBsPgo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMS80XSBtdGQ6IHJhd25hbmQ6IEFkZCBkZXN0cnVjdGl2ZSBvcGVy
YXRpb24KPgo+IEhlbGxvLAo+IAo+IGRyZWdhbkBtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDEyIE9j
dCAyMDIzIDAyOjQwOjM1ICswMjAwOgo+IAo+IFRoZSBhdXRob3Igc2hvdWxkIGJlIEJvcmlzIGFz
IHdlbGwgKGdpdCBjb21taXQgLS1hbWVuZCAtLWF1dGhvcj0uLi4pCgpJIHdpbGwgYXR0ZW1wdCB0
byBjaGFuZ2UgdGhlIGF1dGhvciBidXQgZ2l0IHNlZW1zIHRvIGJlCnNvbWV3aGF0IGxpbWl0ZWQg
aW4gd2hhdCBJIGNhbiBhY2NvbXBsaXNoIHdoZW4gaXQgY29tZXMgdG8KY2hhbmdpbmcgZW1haWxz
LCBzZW5kaW5nIGluIHRoZSBuYW1lIG9mIHNvbWVvbmUgZWxzZSBldGMuCgo+IAo+ID4gRXJhc2Ug
YW5kIHByb2dyYW0gb3BlcmF0aW9ucyBuZWVkIHRoZSB3cml0ZSBwcm90ZWN0ICh3cCkgcGluIHRv
IGJlCj4gPiBkZS1hc3NlcnRlZCB0byB0YWtlIGVmZmVjdC4gQWRkIHRoZSBjb25jZXB0IG9mIGRl
c3RydWN0aXZlCj4gPiBvcGVyYXRpb24gYW5kIHBhc3MgdGhlIGluZm9ybWF0aW9uIHRvIGV4ZWNf
b3AoKSBzbyBjb250cm9sbGVycyBrbm93Cj4gPiB3aGVuIHRoZXkgc2hvdWxkIGRlLWFzc2VydCB0
aGlzIHBpbiB3aXRob3V0IGhhdmluZyB0byBkZWNvZGUKPiA+IHRoZSBjb21tYW5kIG9wY29kZS4K
PiA+IAo+ID4gQ3JlYXRlZCBieSBCb3JpcyBCcmV6aWxsb24uCj4gCj4gVGhpcyBjYW4gZ28gYXdh
eS4KCldpbGwgcmVtb3ZlLgoKPiAKPiA+IAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2JicmV6aWxs
b24vbGludXgvY29tbWl0L2U2MTJlMWYyYzY5YTMzYWM1ZjJjOTFkMTM2NjlmMGYxNzJkNTg3MTcK
PiAKPiBUaGlzIGFzIHdlbGwuCgpXaWxsIGFsc28gcmVtb3ZlLgoKPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gCj4g
UGxlYXNlIHVzZSBCb3Jpcycga2VybmVsLm9yZyBlLW1haWwgZm9yIHRoZSBhdXRob3JzaGlwIGFu
ZCBTb0IKCkkgZG9uJ3Qga25vdyB3aGF0IEJvcmlzJyBrZXJuZWwub3JnIGVtYWlsIGFkZHJlc3M/
CklzIGl0IEBib290bGluPyBDb2xsYWJvcmEgc3RpbGwgc2hvd3MgdXAgYXMgZW1haWwgd2hlbgpJ
IGRvIHRoZSBsaXN0IG9mIG1haW50YWluZXJzLiBJIGRpZCBzb21lIHNlYXJjaGluZwpidXQgY291
bGRuJ3QgcmVhbGx5IGZpbmQgYW55dGhpbmcgY29uY2x1c2l2ZS4KCj4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQG1haWwuY29tPgoKRG8gSSBzdGlsbCBrZWVwIHRoaXMg
U09CIG9yIHNob3VsZCBJIGNoYW5nZSBpdCB0byBzb21ldGhpbmcgZWxzZT8KCi4uLgoKPiBUaGFu
a3MsCj4gTWlxdcOobAo+IAoKVGhhbmtzIQoKLURhdmUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
