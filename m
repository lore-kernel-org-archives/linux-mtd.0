Received: from mail-qk0-f181.google.com ([209.85.220.181])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHRgI-0001fA-Vx
 for linux-mtd@lists.infradead.org; Wed, 22 Nov 2017 09:51:01 +0000
Received: by mail-qk0-f181.google.com with SMTP id a194so15920808qkc.9
 for <linux-mtd@lists.infradead.org>; Wed, 22 Nov 2017 01:50:37 -0800 (PST)
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com.
 [209.85.216.181])
 by smtp.gmail.com with ESMTPSA id n145sm10213296qke.38.2017.11.22.01.50.36
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Nov 2017 01:50:36 -0800 (PST)
Received: by mail-qt0-f181.google.com with SMTP id i40so11727566qti.8
 for <linux-mtd@lists.infradead.org>; Wed, 22 Nov 2017 01:50:36 -0800 (PST)
MIME-Version: 1.0
From: "Paul HENRYS d'AUBIGNY" <paul.henrys@embconsulting.eu>
Date: Wed, 22 Nov 2017 10:50:35 +0100
Message-ID: <CAOTsJ7r0UHfduu4YauvqOGggdX-f7qQY6Nm-EKi7n8NBryw1oQ@mail.gmail.com>
Subject: mtd: test: Fix check on ebcnt in nandpagetest
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="001a1139d9ce4c2adb055e8f4086"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--001a1139d9ce4c2adb055e8f4086
Content-Type: text/plain; charset="UTF-8"

Dear all,

Commit 4458ad6481f60d9884925d5bc62a7954880d181b introduced a check on
ebcnt to make sure nandpagetest is run on more than 2 erase blocks
(EB). This commit omits that by default, when the number of EB to use
is not specified, the full mtd partition should be used leading
nandpagetest to exit with failure in that case.
The attached patch intends to fix this.

Best regards,

Paul HENRYS

Software Engineer - Freelance
http://be.linkedin.com/in/phenrysd
PGP fingerprint: 1C45 321A 7830 4DCD 8453 2CE4 DF32 6222 6747 82F7
PGP key: https://pgp.mit.edu/pks/lookup?op=get&search=0xDF326222674782F7

--001a1139d9ce4c2adb055e8f4086
Content-Type: text/x-patch; charset="US-ASCII"; name="nandpagetest.patch"
Content-Disposition: attachment; filename="nandpagetest.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jaav9nt30

RnJvbSBmNDllZGNmM2ExZWM2MGVjY2ZkZjgwNjIxNTRkZWE0OTY4ZjY1ZmUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQYXVsIEhFTlJZUyA8cGF1bC5oZW5yeXNAZW1iY29uc3VsdGlu
Zy5ldT4KRGF0ZTogV2VkLCAyMiBOb3YgMjAxNyAwOToxMTo0MyArMDEwMApTdWJqZWN0OiBbUEFU
Q0hdIG10ZDogdGVzdHM6IEZpeCBjaGVjayBvbiBlYmNudCBpbiBuYW5kcGFnZXRlc3QKCklmIHRo
ZSBudW1iZXIgb2YgZXJhc2UgYmxvY2tzIHRvIHVzZSBpcyBub3Qgc3BlY2lmaWVkLCBlYmNudCBv
cmlnaW5hbGx5CnNldCB0byAtMSBsZWFkcyB0aGUgcHJvZ3JhbSB0byBleGl0IHdpdGg6CiAgIkNh
bm5vdCBydW4gd2l0aCBsZXNzIHRoYW4gdHdvIGJsb2Nrcy4iCgpJZiB0aGUgbnVtYmVyIG9mIGVy
YXNlIGJsb2NrcyB0byB1c2UgaXMgbm90IHNwZWNpZmllZCBhbmQgdGh1cyBlYmNudCBpcwplcXVh
bCB0byAtMSwgdGhlIGV4cGVjdGVkIGJlaGF2aW91ciBpcyB0byBwZXJmb3JtIHRoZSB0ZXN0IG9u
IGFsbCB0aGUKZXJhc2UgYmxvY2tzIG9mIHRoZSBtdGQgcGFydGl0aW9uLgoKVGhpcyBmaXhlcyB0
aGUgY2hhbmdlIGludHJvZHVjZWQgaW4KNDQ1OGFkNjQ4MWY2MGQ5ODg0OTI1ZDViYzYyYTc5NTQ4
ODBkMTgxYi4KLS0tCiB0ZXN0cy9tdGQtdGVzdHMvbmFuZHBhZ2V0ZXN0LmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90
ZXN0cy9tdGQtdGVzdHMvbmFuZHBhZ2V0ZXN0LmMgYi90ZXN0cy9tdGQtdGVzdHMvbmFuZHBhZ2V0
ZXN0LmMKaW5kZXggMmIxNmNjOS4uYzY4MTJkZiAxMDA2NDQKLS0tIGEvdGVzdHMvbXRkLXRlc3Rz
L25hbmRwYWdldGVzdC5jCisrKyBiL3Rlc3RzL210ZC10ZXN0cy9uYW5kcGFnZXRlc3QuYwpAQCAt
MTQzLDcgKzE0Myw3IEBAIHN0YXRpYyB2b2lkIHByb2Nlc3Nfb3B0aW9ucyhpbnQgYXJnYywgY2hh
ciAqKmFyZ3YpCiAKIAlpZiAob3B0aW5kIDwgYXJnYykKIAkJdXNhZ2UoRVhJVF9GQUlMVVJFKTsK
LQlpZiAoZWJjbnQgPCAyKQorCWlmIChlYmNudCA+PSAwICYmIGViY250IDwgMikKIAkJZXJybXNn
X2RpZSgiQ2Fubm90IHJ1biB3aXRoIGxlc3MgdGhhbiB0d28gYmxvY2tzLiIpOwogCWlmIChwZWIg
PCAwKQogCQlwZWIgPSAwOwotLSAKMi43LjQKCg==
--001a1139d9ce4c2adb055e8f4086--
