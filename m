Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12s7HY-0005Ll-00
	for mtd-list@infradead.org; Wed, 17 May 2000 18:06:52 +0100
Received: from mail.transzap.net ([207.239.241.226] helo=tzi.transzap.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12s7HW-0005Lf-00
	for mtd@infradead.org; Wed, 17 May 2000 18:06:50 +0100
Received: from localhost (phiggins@localhost)
	by phiggins.transzap.com (8.9.3/8.8.7) with ESMTP id LAA14393
	for <mtd@infradead.org>; Wed, 17 May 2000 11:10:27 -0600
Date: Wed, 17 May 2000 11:10:26 -0600 (MDT)
From: Patrick Higgins <phiggins@transzap.com>
To: mtd@infradead.org
Subject: Kernel oops
Message-ID: <Pine.LNX.4.21.0005171107490.14389-200000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463810046-422006334-958525079=:13317"
Content-ID: <Pine.LNX.4.21.0005171107491.14389@phiggins.transzap.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---1463810046-422006334-958525079=:13317
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <Pine.LNX.4.21.0005171107492.14389@phiggins.transzap.com>


I've been working on getting the DoC driver to work when compiled
statically, and have managed to get past all the gotchas with respect to
compiling, but now I get a kernel oops on boot.  I've looked into it a
bit, but since I'm not the greatest decoder of oops messages the world has
ever seen, I haven't found the problem.  I've attached the ksymoops-ified
oops message in case anyone is a wizard with these things. :-)

I'll start tracking it down with printk (my read of the oops is that it's
happening somewhere near the beginning of DoC2k_init).

Patrick

---1463810046-422006334-958525079=:13317
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; NAME=oops
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.21.0005161857590.13317@phiggins.transzap.com>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=oops

a3N5bW9vcHMgMC43YyBvbiBpNjg2IDIuMi4xNC0xMi4gIE9wdGlvbnMgdXNl
ZA0KICAgICAtdiBsaW51eC92bWxpbnV4IChzcGVjaWZpZWQpDQogICAgIC1L
IChzcGVjaWZpZWQpDQogICAgIC1MIChzcGVjaWZpZWQpDQogICAgIC1PIChz
cGVjaWZpZWQpDQogICAgIC1tIGxpbnV4L1N5c3RlbS5tYXAgKHNwZWNpZmll
ZCkNCiAgICAgLXgNCg0KVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDA2
Yw0KY3VycmVudC0+dHNzLmNyMyA9IDAwMTAxMDAwLCAlY3IzID0gMDAxMDEw
MDANCipwZGUgPSAwMDAwMDAwMA0KT29wczogMDAwMA0KQ1BVOiAgICAwDQpF
SVA6ICAgIDAwMTA6WzxjMDE3YTEzMT5dDQpVc2luZyBkZWZhdWx0cyBmcm9t
IGtzeW1vb3BzIC10IGVsZjMyLWkzODYgLWEgaTM4Ng0KRUZMQUdTOiAwMDAx
MDI4Nw0KZWF4OiAwMDAwMDAwMCAgIGVieDogYzAwOGU0ZjAgICBlY3g6IDAw
MGRhMDAwICAgZWR4OiBjMDA4ZTNkMA0KZXNpOiAwMDBkODAwMCAgIGVkaTog
YzAxN2ExMDQgICBlYnA6IGMwMDhlNDgwICAgZXNwOiBjM2Q3YmY3OA0KZHM6
IDAwMTggICBlczogMDAxOCAgIHNzOiAwMDE4DQpQcm9jZXNzIHN3YXBwZXIg
KHBpZDogMSwgcHJvY2VzcyBucjogMSwgc3RhY2twYWdlPWMzZDdiMDAwKQ0K
U3RhY2s6IGMwMTdhMTA0IGMwMGRhMDAwIGMwMTdiNDQyIGMwMDhlNDgwIDAw
MDAwMDA5IGMwMWQzYmE4IGMwMjliYzI4IDAwMDAwNzc0DQogICAgICAgYzAw
OGU0ZjAgYzAwZGIwMDIgZmYyOWJjMjggYzAxN2ExMDQgYzAxYWM5MjkgNjg3
NDY5NzcgNjk2ODQzMjAgMjA0NDQ5NzANCiAgICAgICAwMDAwMzAzMiBjMDFk
MGJiNSAwMDBkYTAwMCAwMDAwMGYwMCAwMDAwMDAwMSBjMDFkMGI4MyBjMDFj
YWNlZSBjMDE5ODhjMA0KQ2FsbCBUcmFjZTogWzxjMDE3YTEwND5dIFs8YzAx
N2I0NDI+XSBbPGMwMTdhMTA0Pl0gWzxjMDFhYzkyOT5dIFs8YzAxOTg4YzA+
XSBbPA0KQ29kZTogOGIgNTAgNmMgODUgZDIgNzUgZWMgYmUgM2IgYzcgMWEg
YzAgODkgZWYgZmMgYWMgYWEgODQgYzAgNzUNCg0KPj5FSVA7IGMwMTdhMTMx
IDxEb0Mya19pbml0KzQ1LzMyOD4gICA8PT09PT0NClRyYWNlOyBjMDE3YTEw
NCA8RG9DMmtfaW5pdCswLzMyOD4NClRyYWNlOyBjMDE3YjQ0MiA8RG9DX1By
b2JlKzQ4Mi81MjQ+DQpUcmFjZTsgYzAxN2ExMDQgPERvQzJrX2luaXQrMC8z
Mjg+DQpUcmFjZTsgYzAxYWM5MjkgPHRpbWVyX2J1Z19tc2crMjUzMjEvMjc4
NDA+DQpUcmFjZTsgYzAxOTg4YzAgPHN0ZXh0X2xvY2srMzYxNi8xMjM1Mj4N
CkNvZGU7ICBjMDE3YTEzMSA8RG9DMmtfaW5pdCs0NS8zMjg+DQowMDAwMDAw
MCA8X0VJUD46DQpDb2RlOyAgYzAxN2ExMzEgPERvQzJrX2luaXQrNDUvMzI4
PiAgIDw9PT09PQ0KICAgMDogICA4YiA1MCA2YyAgICAgICAgICAgICAgICAg
IG1vdiAgICAweDZjKCVlYXgpLCVlZHggICA8PT09PT0NCkNvZGU7ICBjMDE3
YTEzNCA8RG9DMmtfaW5pdCs0OC8zMjg+DQogICAzOiAgIDg1IGQyICAgICAg
ICAgICAgICAgICAgICAgdGVzdCAgICVlZHgsJWVkeA0KQ29kZTsgIGMwMTdh
MTM2IDxEb0Mya19pbml0KzUwLzMyOD4NCiAgIDU6ICAgNzUgZWMgICAgICAg
ICAgICAgICAgICAgICBqbmUgICAgZmZmZmZmZjMgPF9FSVArMHhmZmZmZmZm
Mz4gYzAxN2ExMjQgPERvQzJrX2luaXQrMzIvMzI4Pg0KQ29kZTsgIGMwMTdh
MTM4IDxEb0Mya19pbml0KzUyLzMyOD4NCiAgIDc6ICAgYmUgM2IgYzcgMWEg
YzAgICAgICAgICAgICBtb3YgICAgJDB4YzAxYWM3M2IsJWVzaQ0KQ29kZTsg
IGMwMTdhMTNkIDxEb0Mya19pbml0KzU3LzMyOD4NCiAgIGM6ICAgODkgZWYg
ICAgICAgICAgICAgICAgICAgICBtb3YgICAgJWVicCwlZWRpDQpDb2RlOyAg
YzAxN2ExM2YgPERvQzJrX2luaXQrNTkvMzI4Pg0KICAgZTogICBmYyAgICAg
ICAgICAgICAgICAgICAgICAgIGNsZCAgICANCkNvZGU7ICBjMDE3YTE0MCA8
RG9DMmtfaW5pdCs2MC8zMjg+DQogICBmOiAgIGFjICAgICAgICAgICAgICAg
ICAgICAgICAgbG9kcyAgICVkczooJWVzaSksJWFsDQpDb2RlOyAgYzAxN2Ex
NDEgPERvQzJrX2luaXQrNjEvMzI4Pg0KICAxMDogICBhYSAgICAgICAgICAg
ICAgICAgICAgICAgIHN0b3MgICAlYWwsJWVzOiglZWRpKQ0KQ29kZTsgIGMw
MTdhMTQyIDxEb0Mya19pbml0KzYyLzMyOD4NCiAgMTE6ICAgODQgYzAgICAg
ICAgICAgICAgICAgICAgICB0ZXN0ICAgJWFsLCVhbA0KQ29kZTsgIGMwMTdh
MTQ0IDxEb0Mya19pbml0KzY0LzMyOD4NCiAgMTM6ICAgNzUgMDAgICAgICAg
ICAgICAgICAgICAgICBqbmUgICAgMTUgPF9FSVArMHgxNT4gYzAxN2ExNDYg
PERvQzJrX2luaXQrNjYvMzI4Pg0KDQo=
---1463810046-422006334-958525079=:13317--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
