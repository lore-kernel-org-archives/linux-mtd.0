Received: from rv-out-0708.google.com ([209.85.198.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LBrV1-0004yl-ED
	for linux-mtd@lists.infradead.org; Sun, 14 Dec 2008 13:59:15 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2257608rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 14 Dec 2008 05:59:09 -0800 (PST)
Message-ID: <76d9e2a30812140559y6ade25c0jf55fd8a7b299e83a@mail.gmail.com>
Date: Sun, 14 Dec 2008 15:59:09 +0200
From: "Hai Zaar" <haizaar@codefidence.com>
Sender: haizaar@haizaar.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nandwrite - handle situation when read returns less bytes the
	expected
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_10270_14342493.1229263149434"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_10270_14342493.1229263149434
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Good day!
I've found a bug: nandwrite does not handle the situation when read
syscall returns less bytes when expected. Instead of requesting more
input, nandwrite just aborts with error.
The bug is especially triggered when input comes from stdin[1] which
is filled from remote host.

[1] http://lists.infradead.org/pipermail/linux-mtd/2008-September/022913.html.
BTW - is it going to be applied?

P.S. I'm not on the list, so please CC me.
-- 
Zaar

------=_Part_10270_14342493.1229263149434
Content-Type: text/x-diff; name=mtd-utils-1.2.0-all-read-fix.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fopr1ft90
Content-Disposition: attachment;
 filename=mtd-utils-1.2.0-all-read-fix.patch

cmVhZCBzeXNjYWxsIGNhbiByZXR1cm4gbGVzcyBieXRlcyB0aGVuIHJlcXVlc3RlZCAtIGhhbmRs
ZSB0aGlzLgpUaGlzIGJ1ZyBpcyB0cmlnZ2VyZWQgd2hlbiByZWFkaW5nIGZyb20gc3RkaW4gdGhh
dCBjb21lcyBmcm9tIHJlbW90ZSBob3N0CgpBdXRob3I6IEhhaSBaYWFyIDxoYWl6YWFyQGhhaXph
YXIuY29tPgoKLS0tIG10ZC11dGlscy0xLjIuMC9uYW5kd3JpdGUuYy5vcmlnCTIwMDgtMTItMTQg
MTQ6NTY6MTEuMDAwMDAwMDAwICswMjAwCisrKyBtdGQtdXRpbHMtMS4yLjAvbmFuZHdyaXRlLmMJ
MjAwOC0xMi0xNCAxNToxMTo1Ni4wMDAwMDAwMDAgKzAyMDAKQEAgLTIxOCw2ICsyMTgsNyBAQAog
CWludCByZXQsIHJlYWRsZW47CiAJaW50IG9vYmluZm9jaGFuZ2VkID0gMDsKIAlzdHJ1Y3QgbmFu
ZF9vb2JpbmZvIG9sZF9vb2JpbmZvOworCWludCByZWFkY250ID0gMDsKIAogCXByb2Nlc3Nfb3B0
aW9ucyhhcmdjLCBhcmd2KTsKIApAQCAtNDA1LDEyICs0MDYsMjIgQEAKIAkJfQogCiAJCS8qIFJl
YWQgUGFnZSBEYXRhIGZyb20gaW5wdXQgZmlsZSAqLwotCQlpZiAoKGNudCA9IHJlYWQoaWZkLCB3
cml0ZWJ1ZiwgcmVhZGxlbikpICE9IHJlYWRsZW4pIHsKLQkJCWlmIChjbnQgPT0gMCkJLy8gRU9G
Ci0JCQkJYnJlYWs7Ci0JCQlwZXJyb3IgKCJGaWxlIEkvTyBlcnJvciBvbiBpbnB1dCBmaWxlIik7
Ci0JCQlnb3RvIGNsb3NlYWxsOworCQlyZWFkY250ID0gMDsKKwkJd2hpbGUgKHJlYWRjbnQgPCBy
ZWFkbGVuKSB7CisJCQlpZiAoKGNudCA9IHJlYWQoaWZkLCB3cml0ZWJ1ZiArIHJlYWRjbnQsIHJl
YWRsZW4gLSByZWFkY250KSkgPCAwKSB7CisJCQkJcGVycm9yICgiRmlsZSBJL08gZXJyb3Igb24g
aW5wdXQgZmlsZSIpOworCQkJCWdvdG8gY2xvc2VhbGw7CisJCQl9IGVsc2UgeworCQkJCWlmICgo
Y250ID09IDApICYmIChyZWFkY250ID09IDApKSB7CS8vIEVPRgorCQkJCQlicmVhazsKKwkJCQl9
IGVsc2UgeworCQkJCQlyZWFkY250ICs9IGNudDsKKwkJCQl9CisJCQl9CisKIAkJfQorCQlpZiAo
KGNudCA9PSAwKSAmJiAocmVhZGNudCA9PSAwKSkJLy8gRU9GCisJCQlicmVhazsKIAogCQlpZiAo
d3JpdGVvb2IpIHsKIAkJCS8qIFJlYWQgT09CIGRhdGEgZnJvbSBpbnB1dCBmaWxlLCBleGl0IG9u
IGZhaWx1cmUgKi8K
------=_Part_10270_14342493.1229263149434--
