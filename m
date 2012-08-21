Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3tja-0000TW-2Q
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 19:03:27 +0000
Received: by bkcji2 with SMTP id ji2so47160bkc.36
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2012 12:03:23 -0700 (PDT)
Message-ID: <1345575791.1886.1.camel@kyv>
Subject: Re: new 3.5.2 ubifs debug assert
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MichaelHench@gmail.com
Date: Tue, 21 Aug 2012 22:03:11 +0300
In-Reply-To: <CAHyXW63+bY-Dq_miAWMQc=RYqaBwGrZHn95wgJXuK3NHWsnzbg@mail.gmail.com>
References: <CAHyXW63+bY-Dq_miAWMQc=RYqaBwGrZHn95wgJXuK3NHWsnzbg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-q92YS1ZXrHRAOvq2fuWt"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-q92YS1ZXrHRAOvq2fuWt
Content-Type: multipart/mixed; boundary="=-0pegFVZQKxZgKBZw9dLk"


--=-0pegFVZQKxZgKBZw9dLk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, the below (and attached) patch should fix the issue. Thanks for reporti=
ng.
Could you please give it a try?

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Tue, 21 Aug 2012 21:50:58 +0300
Subject: [PATCH] UBIFS: fix complaints about too small debug buffer size

When debugging is enabled, we use a temporary on-stack buffer for formattin=
g
the key strings like "(11368871, direntry, 0xcd0750)". The buffer size is
32 bytes and sometimes it is not enough to fit the key string - e.g., when
inode numbers are high. This is not fatal, but the key strings are incomple=
te
and UBIFS complains like this:

	UBIFS assert failed in dbg_snprintf_key at 137 (pid 1)

This is a regression caused by "515315a UBIFS: fix key printing".

Fix the issue by increasing the buffer to 48 bytes.

Reported-by: Michael Hench <michaelhench@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@vger.kernel.org [v3.3+]
---
 fs/ubifs/debug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 8b8cc4e..760de72 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -167,7 +167,7 @@ struct ubifs_global_debug_info {
 #define ubifs_dbg_msg(type, fmt, ...) \
 	pr_debug("UBIFS DBG " type ": " fmt "\n", ##__VA_ARGS__)
=20
-#define DBG_KEY_BUF_LEN 32
+#define DBG_KEY_BUF_LEN 48
 #define ubifs_dbg_msg_key(type, key, fmt, ...) do {                       =
     \
 	char __tmp_key_buf[DBG_KEY_BUF_LEN];                                   \
 	pr_debug("UBIFS DBG " type ": " fmt "%s\n", ##__VA_ARGS__,             \
--=20
1.7.11.2



--=-0pegFVZQKxZgKBZw9dLk
Content-Disposition: attachment;
	filename*0=0001-UBIFS-fix-complaints-about-too-small-debug-buffer-si.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-UBIFS-fix-complaints-about-too-small-debug-buffer-si.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSA1Y2Q2YTE0M2M2MTI4OTlhNTkzNzY0ZjEwNmE2MWVlZTVhNjI3N2MwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQXJ0ZW0gQml0eXV0c2tpeSA8YXJ0ZW0uYml0eXV0c2tpeUBs
aW51eC5pbnRlbC5jb20+DQpEYXRlOiBUdWUsIDIxIEF1ZyAyMDEyIDIxOjUwOjU4ICswMzAwDQpT
dWJqZWN0OiBbUEFUQ0hdIFVCSUZTOiBmaXggY29tcGxhaW50cyBhYm91dCB0b28gc21hbGwgZGVi
dWcgYnVmZmVyIHNpemUNCg0KV2hlbiBkZWJ1Z2dpbmcgaXMgZW5hYmxlZCwgd2UgdXNlIGEgdGVt
cG9yYXJ5IG9uLXN0YWNrIGJ1ZmZlciBmb3IgZm9ybWF0dGluZw0KdGhlIGtleSBzdHJpbmdzIGxp
a2UgIigxMTM2ODg3MSwgZGlyZW50cnksIDB4Y2QwNzUwKSIuIFRoZSBidWZmZXIgc2l6ZSBpcw0K
MzIgYnl0ZXMgYW5kIHNvbWV0aW1lcyBpdCBpcyBub3QgZW5vdWdoIHRvIGZpdCB0aGUga2V5IHN0
cmluZyAtIGUuZy4sIHdoZW4NCmlub2RlIG51bWJlcnMgYXJlIGhpZ2guIFRoaXMgaXMgbm90IGZh
dGFsLCBidXQgdGhlIGtleSBzdHJpbmdzIGFyZSBpbmNvbXBsZXRlDQphbmQgVUJJRlMgY29tcGxh
aW5zIGxpa2UgdGhpczoNCg0KCVVCSUZTIGFzc2VydCBmYWlsZWQgaW4gZGJnX3NucHJpbnRmX2tl
eSBhdCAxMzcgKHBpZCAxKQ0KDQpUaGlzIGlzIGEgcmVncmVzc2lvbiBjYXVzZWQgYnkgIjUxNTMx
NWEgVUJJRlM6IGZpeCBrZXkgcHJpbnRpbmciLg0KDQpGaXggdGhlIGlzc3VlIGJ5IGluY3JlYXNp
bmcgdGhlIGJ1ZmZlciB0byA0OCBieXRlcy4NCg0KUmVwb3J0ZWQtYnk6IE1pY2hhZWwgSGVuY2gg
PG1pY2hhZWxoZW5jaEBnbWFpbC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBBcnRlbSBCaXR5dXRza2l5
IDxhcnRlbS5iaXR5dXRza2l5QGxpbnV4LmludGVsLmNvbT4NCkNjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnIFt2My4zK10NCi0tLQ0KIGZzL3ViaWZzL2RlYnVnLmggfCAyICstDQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9mcy91
Ymlmcy9kZWJ1Zy5oIGIvZnMvdWJpZnMvZGVidWcuaA0KaW5kZXggOGI4Y2M0ZS4uNzYwZGU3MiAx
MDA2NDQNCi0tLSBhL2ZzL3ViaWZzL2RlYnVnLmgNCisrKyBiL2ZzL3ViaWZzL2RlYnVnLmgNCkBA
IC0xNjcsNyArMTY3LDcgQEAgc3RydWN0IHViaWZzX2dsb2JhbF9kZWJ1Z19pbmZvIHsNCiAjZGVm
aW5lIHViaWZzX2RiZ19tc2codHlwZSwgZm10LCAuLi4pIFwNCiAJcHJfZGVidWcoIlVCSUZTIERC
RyAiIHR5cGUgIjogIiBmbXQgIlxuIiwgIyNfX1ZBX0FSR1NfXykNCiANCi0jZGVmaW5lIERCR19L
RVlfQlVGX0xFTiAzMg0KKyNkZWZpbmUgREJHX0tFWV9CVUZfTEVOIDQ4DQogI2RlZmluZSB1Ymlm
c19kYmdfbXNnX2tleSh0eXBlLCBrZXksIGZtdCwgLi4uKSBkbyB7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwNCiAJY2hhciBfX3RtcF9rZXlfYnVmW0RCR19LRVlfQlVGX0xFTl07ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQogCXByX2RlYnVnKCJVQklGUyBEQkcgIiB0
eXBlICI6ICIgZm10ICIlc1xuIiwgIyNfX1ZBX0FSR1NfXywgICAgICAgICAgICAgXA0KLS0gDQox
LjcuMTEuMg0KDQo=


--=-0pegFVZQKxZgKBZw9dLk--

--=-q92YS1ZXrHRAOvq2fuWt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQM9tvAAoJECmIfjd9wqK0AEEP/A+4H30xrQ22ZEzPp/2Csltn
CdtNLPWDJ1xymJKesIJs3ucOtZOggko4k/RD261KZ3Ch8zYaE4z28BqZAxuxSCXV
hq0NejgBqyyK0Y3U+MjBaDoiBNjZk4f6RKYjZwZuGMy8izyEndW6ReMCzAq02Zlv
m3p6xsIFFN3jpAmSv6jQMGzBGHk+q84J426HDRzHG7FCnz4WmETYFEF4jwcRpszt
VOMAU1kdUF3ceFmdirCYKN9Qkn469p3FQishdNQdvzRLWQXu2WS3K/P2SsiYLHdC
NcntBvhxQzDpll9I7LKlEMNqkAxnw+3/tbWJawnBSN3/H5/rCn60pt7+NzYHfqIN
v9DrtTePXMDpB9GwWZ5EdJontU8UtaYrEjFmh2AptlczNHo6RrBOG/iAAjON2Yrm
EtCYJbvCf4QTD7Q8jUH/7kTSa/5nm+UVmIdXNMsg2zD2xXpAfo6sCW2+TuwlK/hk
f6IZ2F4jC/VPB6cNiIQZmel7vU4kxkvWzVNcn0byqUhdNSu9lqChqse2Y55jweRO
Za0s4SrhebPVkW/Td0C//M70vgSMzhVnJvkztK5kBJ9Y6Wy/8NcBUgjUYxq4gmVL
UxigOhSDGzz5F+qOavZDptZG+qF2WPaDt3eUXOLaO22ni43g2RO4m3cAkdUPOESf
FMokY5wFY5Nqy83170NG
=yD3s
-----END PGP SIGNATURE-----

--=-q92YS1ZXrHRAOvq2fuWt--
