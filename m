Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OfrO0-0002uB-FZ
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2010 09:32:44 +0000
Message-ID: <4C5690B1.6030407@parrot.com>
Date: Mon, 2 Aug 2010 11:32:33 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: ubifs : corruption after power cut test
References: <4C346D5B.2000609@parrot.com>	<4C3C1572.8080501@parrot.com>		<4C3C2740.2040105@parrot.com>	<4C3C30D1.9030005@parrot.com>	<1279031064.31639.90.camel@localhost>	<4C3C81E3.3030407@parrot.com>
	<4C4FDEF5.2040405@parrot.com>
In-Reply-To: <4C4FDEF5.2040405@parrot.com>
Content-Type: multipart/mixed; boundary="------------020206030502060505000104"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------020206030502060505000104
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Matthieu CASTET a écrit :
> Hi,
> 
> Matthieu CASTET a écrit :
>> Artem Bityutskiy a écrit :
>> Ok thanks, I will run it
>>
>> When checking the code, I saw that switch_gc_head can set c->gc_lnum to -1.
>>
>> In ubifs_put_super, we set c->mst_node->gc_lnum to c->gc_lnum and write 
>> master node.
>> Can't ubifs_put_super run while switch_gc_head set gc_lnum to -1 ?
>>
> I manage to reproduce it with the backtrace [1].
> 
Waiting for a proper fix, I force recovery if gc_lnum to -1.


Matthieu

--------------020206030502060505000104
Content-Type: text/plain; name="ubifs"
Content-Transfer-Encoding: base64
Content-Disposition: inline; filename="ubifs"

ZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL21hc3Rlci5jIGIvZnMvdWJpZnMvbWFzdGVyLmMKaW5k
ZXggMjhiZWFlZS4uMmI2NjhjYyAxMDA2NDQKLS0tIGEvZnMvdWJpZnMvbWFzdGVyLmMKKysr
IGIvZnMvdWJpZnMvbWFzdGVyLmMKQEAgLTEzNSw3ICsxMzUsNyBAQCBzdGF0aWMgaW50IHZh
bGlkYXRlX21hc3Rlcihjb25zdCBzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKIAkJZ290byBvdXQ7
CiAJfQogCi0JaWYgKGMtPmdjX2xudW0gPj0gYy0+bGViX2NudCB8fCBjLT5nY19sbnVtIDwg
Yy0+bWFpbl9maXJzdCkgeworCWlmIChjLT5nY19sbnVtICE9IC0xICYmIChjLT5nY19sbnVt
ID49IGMtPmxlYl9jbnQgfHwgYy0+Z2NfbG51bSA8IGMtPm1haW5fZmlyc3QpKSB7CiAJCWVy
ciA9IDc7CiAJCWdvdG8gb3V0OwogCX0KZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3N1cGVyLmMg
Yi9mcy91Ymlmcy9zdXBlci5jCmluZGV4IDhjZGNkYzUuLjAyMDc2MjAgMTAwNjQ0Ci0tLSBh
L2ZzL3ViaWZzL3N1cGVyLmMKKysrIGIvZnMvdWJpZnMvc3VwZXIuYwpAQCAtMTI2MCw3ICsx
MjYwLDcgQEAgc3RhdGljIGludCBtb3VudF91YmlmcyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYykK
IAogCWluaXRfY29uc3RhbnRzX21hc3RlcihjKTsKIAotCWlmICgoYy0+bXN0X25vZGUtPmZs
YWdzICYgY3B1X3RvX2xlMzIoVUJJRlNfTVNUX0RJUlRZKSkgIT0gMCkgeworCWlmICgoYy0+
bXN0X25vZGUtPmZsYWdzICYgY3B1X3RvX2xlMzIoVUJJRlNfTVNUX0RJUlRZKSkgIT0gMCB8
fCBjLT5nY19sbnVtID09IC0xKSB7CiAJCXViaWZzX21zZygicmVjb3ZlcnkgbmVlZGVkIik7
CiAJCWMtPm5lZWRfcmVjb3ZlcnkgPSAxOwogCQlpZiAoIW1vdW50ZWRfcmVhZF9vbmx5KSB7
Cg==
--------------020206030502060505000104--
