Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fOFL-0003TL-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 16:45:03 +0000
Date: Mon, 25 Feb 2002 17:54:33 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: Adam Wozniak <awozniak@comdev.cc>
cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
   Jonas Holmberg <jonas.holmberg@axis.com>
Subject: Re: Re-entrancy of flash erase/write 
In-Reply-To: <Pine.LNX.4.33.0202250739340.28327-100000@rangers.comdev.cc>
Message-ID: <Pine.LNX.4.21.0202251744570.12881-200000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="380371457-230928565-1014656073=:12881"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--380371457-230928565-1014656073=:12881
Content-Type: TEXT/PLAIN; charset=US-ASCII



On Mon, 25 Feb 2002, Adam Wozniak wrote:

> ENABLE/DISABLE_VPP  call the map_info set_vpp function
> For the physmap_map map_info, there is no set_vpp, it is NULL
> 
> So for people who use physmap_map anyway, they won't see the behavior
> you are describing.  I suspect it is the same for other maps.


Hmm, so you are suggesting that this problem has not been noticed
because so few people have set_vpp() functions these days ?

If that is the case, may I suggest the attached patch. It solved the
problem for me.

[David, OK to apply this ?]

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10

--380371457-230928565-1014656073=:12881
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=patch-mtd-set_vpp
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.21.0202251754330.12881@dagobert.svc.sysgo.de>
Content-Description: 
Content-Disposition: attachment; filename=patch-mtd-set_vpp

SW5kZXg6IG1hcC5oDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQpSQ1MgZmls
ZTogL2hvbWUvY3ZzL210ZC9pbmNsdWRlL2xpbnV4L210ZC9tYXAuaCx2DQpy
ZXRyaWV2aW5nIHJldmlzaW9uIDEuMjcNCmRpZmYgLXUgLXAgLXIxLjI3IG1h
cC5oDQotLS0gbWFwLmgJMjAwMi8wMi8yMSAwODoyNjo1OQkxLjI3DQorKysg
bWFwLmgJMjAwMi8wMi8yNSAxNjo1MTozNg0KQEAgLTQ3LDYgKzQ3LDcgQEAg
c3RydWN0IG1hcF9pbmZvIHsNCiAJdm9pZCAoKmNvcHlfdG8pKHN0cnVjdCBt
YXBfaW5mbyAqLCB1bnNpZ25lZCBsb25nLCBjb25zdCB2b2lkICosIHNzaXpl
X3QpOw0KIA0KIAl2b2lkICgqc2V0X3ZwcCkoc3RydWN0IG1hcF9pbmZvICos
IGludCk7DQorCWludCAgdnBwX2NvdW50ZXI7DQogCS8qIFdlIHB1dCB0aGVz
ZSB0d28gaGVyZSByYXRoZXIgdGhhbiBhIHNpbmdsZSB2b2lkICptYXBfcHJp
diwgDQogCSAgIGJlY2F1c2Ugd2Ugd2FudCBtYXBwZXJzIHRvIGJlIGFibGUg
dG8gaGF2ZSBxdWlja2x5LWFjY2Vzc2libGUNCiAJICAgY2FjaGUgZm9yIHRo
ZSAnY3VycmVudGx5LW1hcHBlZCBwYWdlJyB3aXRob3V0IHRoZSBfZXh0cmFf
DQpAQCAtOTAsNyArOTEsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbWFwX2Rl
c3Ryb3koc3RydWN0IG10DQogCWtmcmVlKG10ZCk7DQogfQ0KIA0KLSNkZWZp
bmUgRU5BQkxFX1ZQUChtYXApIGRvIHsgaWYobWFwLT5zZXRfdnBwKSBtYXAt
PnNldF92cHAobWFwLCAxKTsgfSB3aGlsZSgwKQ0KLSNkZWZpbmUgRElTQUJM
RV9WUFAobWFwKSBkbyB7IGlmKG1hcC0+c2V0X3ZwcCkgbWFwLT5zZXRfdnBw
KG1hcCwgMCk7IH0gd2hpbGUoMCkNCisjZGVmaW5lIEVOQUJMRV9WUFAobWFw
KSBkbyB7IGlmKG1hcC0+c2V0X3ZwcCkgaWYoKyttYXAtPnZwcF9jb3VudGVy
ID09IDEpIG1hcC0+c2V0X3ZwcChtYXAsIDEpOyB9IHdoaWxlKDApDQorI2Rl
ZmluZSBESVNBQkxFX1ZQUChtYXApIGRvIHsgaWYobWFwLT5zZXRfdnBwKSB7
IGlmKC0tbWFwLT52cHBfY291bnRlciA9PSAwKSBtYXAtPnNldF92cHAobWFw
LCAwKTsgZWxzZSBpZihtYXAtPnZwcF9jb3VudGVyIDwgMCkgQlVHKCk7fSB9
IHdoaWxlKDApDQogDQogI2VuZGlmIC8qIF9fTElOVVhfTVREX01BUF9IX18g
Ki8NCg==
--380371457-230928565-1014656073=:12881--
