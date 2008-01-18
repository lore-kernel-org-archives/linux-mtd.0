Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFu4h-0002Iw-8t
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 16:28:17 +0000
Received: by fg-out-1718.google.com with SMTP id 22so1164747fge.26
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Jan 2008 08:28:08 -0800 (PST)
Message-ID: <fe810cf0801180828g7a48b6a1u69e35f832185b5eb@mail.gmail.com>
Date: Fri, 18 Jan 2008 19:28:08 +0300
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "=?UTF-8?Q?J=C3=B6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
In-Reply-To: <20080115133350.GA22338@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Disposition: inline
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<20080114132843.GA15710@lazybastard.org>
	<fe810cf0801150424j25f35131v83692a3193a45a3b@mail.gmail.com>
	<20080115133350.GA22338@lazybastard.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Alexander Belyakov <abelyako@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gMS8xNS8wOCwgSsO2cm4gRW5nZWwgPGpvZXJuQGxvZ2ZzLm9yZz4gd3JvdGU6Cj4KPiBSaWdo
dCBub3cgdGhlIGltcG9ydGFudCB0aGluZyBpcyB0byBkaWcgZGVlcGVyIGFuZCB1bmRlcnN0YW5k
IHRoZSBuYXR1cmUKPiBvZiB0aGlzIGJ1Zy4gIFlvdSBjYW4gcmVwcm9kdWNlIGl0LCB0aGF0IGlz
IGdvb2QuICBXZSBhbHNvIGtub3cgdGhhdCBpdAo+IG1ha2VzIGEgZGlmZmVyZW5jZSB3aGV0aGVy
IHRoZSBibG9jayBpcyBvbiBvbmUgbGlzdCBvciB0aGUgb3RoZXIuICBCdXQKPiB3ZSBkb24ndCBr
bm93IHlldCwgd2hhdCBkaWZmZXJlbmNlIGV4YWN0bHkgaXQgbWFrZXMuCgpRdWVzdGlvbi4gV2hh
dCBpcyBzdWNjZXNzIGNyaXRlcmlhIGZvciBqZmZzMl9nYXJiYWdlX2NvbGxlY3RfcGFzcygpIGV4
ZWN1dGlvbj8KCldoeSBhc2tpbmc/IEluIHRoZSBjYXNlIGRlc2NyaWJlZCBhYm92ZSBqZmZzMl9m
aW5kX2djX2Jsb2NrKCkgZmFpbHMgdG8KZmluZCBlcmFzZSBibG9jayBmb3IgZ2FyYmFnZSBjb2xs
ZWN0aW9uIGJ1dCBmYWxsaW5nIGludG8KamZmczJfZmx1c2hfd2J1Zl9wYWQoYykgd2hpY2ggcHJv
ZHVjZXMgYW1vdW50IG9mIGVyYXNpbmcgYmxvY2tzLiBTbwpqZmZzMl9nYXJiYWdlX2NvbGxlY3Rf
cGFzcygpIHNlZXMgbm8gc2luZ2xlIGJsb2NrIGZvciBnYXJiYWdlCmNvbGxlY3Rpb24sIGJ1dCBm
aWxlc3lzdGVtIHN0aWxsIHJlY2lldmVzIGZyZXNoIGVyYXNpbmcgYmxvY2tzIHVwb24KZXhlY3V0
aW9uLgoKSXMgaXQgc3VjY2VzcyBvciBmYWlsdXJlPyBUaGVvcmV0aWNhbGx5LgoKVGhhbmtzLApB
bGV4YW5kZXIK
