Received: from onz.com ([67.121.61.113] helo=dual166.onz.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19UKaW-0003Sc-8X
	for <linux-mtd@lists.infradead.org>; Mon, 23 Jun 2003 07:14:00 +0100
Message-Id: <5.2.1.1.0.20030622225831.00a462f0@192.168.1.10>
Date: Sun, 22 Jun 2003 23:03:50 -0700
To: Infradead Org <linux-mtd@lists.infradead.org>
From: Allen Curtis <acurtis@onz.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=====================_25751453==_"
Subject: cfs_cmdset_0001 patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=====================_25751453==_
Content-Type: text/plain; charset="us-ascii"; format=flowed

Patch that fixes:
1. Fixed some printk() warnings
2. Changed map->writexx() to map_writexx() macros
3. Added patch to asm-ppc/io.h for __raw_readll() and __raw_writell()

Note: I tried to modify the order of the includes to fix problem #3. cfi.h 
contains a macro for the missing __raw...() functions. However changing the 
order of the includes to get cfi.h before maps.h is a problem.
--=====================_25751453==_
Content-Type: application/octet-stream; name="cfi_cmdset_00001.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="cfi_cmdset_00001.patch"

ZGlmZiAtcnUgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAxLmMgLi4vdGhhbGVzL2xp
bnV4cHBjL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMS5jCi0tLSBkcml2ZXJzL210
ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYwlTdW4gSnVuIDE1IDEwOjA4OjUxIDIwMDMKKysrIC4u
L3RoYWxlcy9saW51eHBwYy9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYwlTdW4g
SnVuIDIyIDIyOjMwOjU5IDIwMDMKQEAgLTM3OCw3ICszNzgsNyBAQAogCQkJCWNoaXAtPnN0YXRl
ID0gRkxfRVJBU0lORzsKIAkJCQljaGlwLT5vbGRzdGF0ZSA9IEZMX1JFQURZOwogCQkJCXByaW50
ayhLRVJOX0VSUiAiQ2hpcCBub3QgcmVhZHkgYWZ0ZXIgZXJhc2UgIgotCQkJCSAgICAgICAic3Vz
cGVuZGVkOiBzdGF0dXMgPSAweCV4XG4iLCBzdGF0dXMpOworCQkJCSAgICAgICAic3VzcGVuZGVk
OiBzdGF0dXMgPSAweCV4XG4iLCAodWludClzdGF0dXMpOwogCQkJCXJldHVybiAtRUlPOwogCQkJ
fQogCkBAIC05NjIsNyArOTYyLDcgQEAKIAkgICBTbyB3ZSBtdXN0IGNoZWNrIGhlcmUgYW5kIHJl
c2V0IHRob3NlIGJpdHMgaWYgdGhleSdyZSBzZXQuIE90aGVyd2lzZQogCSAgIHdlJ3JlIGp1c3Qg
cGlzc2luZyBpbiB0aGUgd2luZCAqLwogCWlmIChzdGF0dXMgJiBDTUQoMHgzMCkpIHsKLQkJcHJp
bnRrKEtFUk5fV0FSTklORyAiU1IuNCBvciBTUi41IGJpdHMgc2V0IGluIGJ1ZmZlciB3cml0ZSAo
c3RhdHVzICV4KS4gQ2xlYXJpbmcuXG4iLCBzdGF0dXMpOworCQlwcmludGsoS0VSTl9XQVJOSU5H
ICJTUi40IG9yIFNSLjUgYml0cyBzZXQgaW4gYnVmZmVyIHdyaXRlIChzdGF0dXMgJXgpLiBDbGVh
cmluZy5cbiIsICh1aW50KXN0YXR1cyk7CiAJCWNmaV93cml0ZShtYXAsIENNRCgweDUwKSwgY21k
X2Fkcik7CiAJCWNmaV93cml0ZShtYXAsIENNRCgweDcwKSwgY21kX2Fkcik7CiAJfQpAQCAtMTAy
NSwxMSArMTAyNSwxMSBAQAogCQl3aGlsZSAoaSA8IENGSURFVl9CVVNXSURUSCkKIAkJCXRtcF9i
dWZbaSsrXSA9IDB4ZmY7CiAJCWlmIChjZmlfYnVzd2lkdGhfaXNfMigpKSB7Ci0JCQltYXAtPndy
aXRlMTYgKG1hcCwgKigoX191MTYqKXRtcF9wKSsrLCBhZHIreik7CisJCQltYXBfd3JpdGUxNiAo
bWFwLCAqKChfX3UxNiopdG1wX3ApKyssIGFkcit6KTsKIAkJfSBlbHNlIGlmIChjZmlfYnVzd2lk
dGhfaXNfNCgpKSB7Ci0JCQltYXAtPndyaXRlMzIgKG1hcCwgKigoX191MzIqKXRtcF9wKSsrLCBh
ZHIreik7CisJCQltYXBfd3JpdGUzMiAobWFwLCAqKChfX3UzMiopdG1wX3ApKyssIGFkcit6KTsK
IAkJfSBlbHNlIGlmIChjZmlfYnVzd2lkdGhfaXNfOCgpKSB7Ci0JCQltYXAtPndyaXRlNjQgKG1h
cCwgKigoX191NjQqKXRtcF9wKSsrLCBhZHIreik7CisJCQltYXBfd3JpdGU2NCAobWFwLCAqKChf
X3U2NCopdG1wX3ApKyssIGFkcit6KTsKIAkJfSBlbHNlIHsKIAkJCXJldCA9IC1FSU5WQUw7CiAJ
CQlnb3RvIG91dDsKPT09PT0gaW8uaCAxLjM1IHZzIDEuMzYgPT09PT0KLS0tIDEuMzUvaW5jbHVk
ZS9hc20tcHBjL2lvLmgJU2F0IEp1bCAyMCAxMDoyMjo1NCAyMDAyCisrKyAxLjM2L2luY2x1ZGUv
YXNtLXBwYy9pby5oCVN1biBKdW4gMjIgMjI6Mjc6MTcgMjAwMwpAQCAtODQsOSArODQsMTEgQEAK
ICNkZWZpbmUgX19yYXdfcmVhZGIoYWRkcikJKCoodm9sYXRpbGUgdW5zaWduZWQgY2hhciAqKShh
ZGRyKSkKICNkZWZpbmUgX19yYXdfcmVhZHcoYWRkcikJKCoodm9sYXRpbGUgdW5zaWduZWQgc2hv
cnQgKikoYWRkcikpCiAjZGVmaW5lIF9fcmF3X3JlYWRsKGFkZHIpCSgqKHZvbGF0aWxlIHVuc2ln
bmVkIGludCAqKShhZGRyKSkKKyNkZWZpbmUgX19yYXdfcmVhZGxsKGFkZHIpCSgqKHZvbGF0aWxl
IHU2NCAqKShhZGRyKSkKICNkZWZpbmUgX19yYXdfd3JpdGViKHYsIGFkZHIpCSgqKHZvbGF0aWxl
IHVuc2lnbmVkIGNoYXIgKikoYWRkcikgPSAodikpCiAjZGVmaW5lIF9fcmF3X3dyaXRldyh2LCBh
ZGRyKQkoKih2b2xhdGlsZSB1bnNpZ25lZCBzaG9ydCAqKShhZGRyKSA9ICh2KSkKICNkZWZpbmUg
X19yYXdfd3JpdGVsKHYsIGFkZHIpCSgqKHZvbGF0aWxlIHVuc2lnbmVkIGludCAqKShhZGRyKSA9
ICh2KSkKKyNkZWZpbmUgX19yYXdfd3JpdGVsbCh2LCBhZGRyKQkoKih2b2xhdGlsZSB1NjQgKiko
YWRkcikgPSAodikpCiAKIC8qCiAgKiBUaGUgaW5zdy9vdXRzdy9pbnNsL291dHNsIG1hY3JvcyBk
b24ndCBkbyBieXRlLXN3YXBwaW5nLgo=
--=====================_25751453==_
Content-Type: text/plain; charset="us-ascii"; format=flowed


--=====================_25751453==_--
