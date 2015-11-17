Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zybry-0000i0-Pq
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 08:44:07 +0000
From: Marcus Prebble <marcus.prebble@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: Marcus Prebble <prebble@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?UmljYXJkIFdhbmRlcmzDtmY=?= <ricardw@axis.com>,
 Richard Weinberger <richard@nod.at>
Date: Tue, 17 Nov 2015 09:43:40 +0100
Subject: Re: [PATCH] mtd-utils: lib: mtd_read: Take the buffer offset into
 account when reading
Message-ID: <A612847CFE53224C91B23E3A5B48BAC7C6EFB4B670@xmail3.se.axis.com>
References: <A612847CFE53224C91B23E3A5B48BAC7B9E316CFDF@xmail3.se.axis.com>
 <20151112190924.GD8456@google.com>
 <A612847CFE53224C91B23E3A5B48BAC7C6EFB4B65B@xmail3.se.axis.com>
 <20151113191748.GH8456@google.com>
In-Reply-To: <20151113191748.GH8456@google.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgYWdhaW4gYW5kIHNvcnJ5IGZvciB0aGUgZGVsYXkgaW4gcmVwbHlpbmchCgoKT24gRnJpLCAy
MDE1LTExLTEzIGF0IDExOjE3IC0wODAwLCBCcmlhbiBOb3JyaXMgd3JvdGU6Cgo+IEJUVywgSSBu
b3RpY2VkIHRoZXJlIGlzbid0IGEgJ1NpZ25lZC1vZmYtYnknIHRhZyBpbiB0aGUgcGF0Y2guIAo+
ICBDYW4geW91IHBhc3RlIG9uZSBpbiByZXBseSB0byB5b3VyIHBhdGNoLCBhbmQgSSdsbCBDJlAg
aXQ/Cj4gCgpTaWduZWQtb2ZmLWJ5OiBNYXJjdXMgUHJlYmJsZSA8bWFyY3VzLnByZWJibGVAYXhp
cy5jb20+CgoKS2luZCByZWdhcmRzLAotTWFyY3VzCgoKPiBSZWdhcmRzLAo+IEJyaWFuCgo=
