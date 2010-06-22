Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OR7Ly-00077D-7L
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2010 17:33:43 +0000
Received: by gxk22 with SMTP id 22so2693744gxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jun 2010 10:33:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1276764159-28726-2-git-send-email-ext-andriy.shevchenko@nokia.com>
References: <1276764159-28726-1-git-send-email-ext-andriy.shevchenko@nokia.com>
	<1276764159-28726-2-git-send-email-ext-andriy.shevchenko@nokia.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 22 Jun 2010 13:33:20 -0400
Message-ID: <AANLkTilBFi58-kjjxM2Q5p0I1l9R5WQpiozBiV5udQYW@mail.gmail.com>
Subject: Re: [PATCH 2/3] flash_eraseall: move constants out of for loop
To: "Shevchenko Andriy (EXT-Teleca/Helsinki)" <ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gVGh1LCBKdW4gMTcsIDIwMTAgYXQgMDQ6NDIsIFNoZXZjaGVua28gQW5kcml5IHdyb3RlOgo+
IC0tLSBhL2ZsYXNoX2VyYXNlYWxsLmMKPiArKysgYi9mbGFzaF9lcmFzZWFsbC5jCj4gQEAgLTE5
NCwyMSArMTk0LDIxIEBAIHZvaWQgcHJvY2Vzc19vcHRpb25zIChpbnQgYXJnYywgY2hhciAqYXJn
dltdKQo+IMKgewo+IMKgIMKgIMKgIMKgaW50IGVycm9yID0gMDsKPgo+ICsgwqAgwqAgwqAgc3Rh
dGljIGNvbnN0IGNoYXIgKnNob3J0X29wdGlvbnMgPSAianEiOwo+ICsgwqAgwqAgwqAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBvcHRpb24gbG9uZ19vcHRpb25zW10gPSB7Cj4gKyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB7ImhlbHAiLCBub19hcmd1bWVudCwgMCwgMH0sCj4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB7InZlcnNpb24iLCBub19hcmd1bWVudCwgMCwgMH0sCj4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB7ImpmZnMyIiwgbm9fYXJndW1lbnQsIDAsICdqJ30sCj4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB7InF1aWV0Iiwgbm9fYXJndW1lbnQsIDAsICdxJ30sCj4gKyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCB7InNpbGVudCIsIG5vX2FyZ3VtZW50LCAwLCAncSd9LAo+ICsKPiArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHswLCAwLCAwLCAwfSwKPiArIMKgIMKgIMKgIH07Cj4gKwo+IMKgIMKgIMKgIMKg
ZXhlX25hbWUgPSBhcmd2WzBdOwo+Cj4gwqAgwqAgwqAgwqBmb3IgKDs7KSB7Cj4gwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpbnQgb3B0aW9uX2luZGV4ID0gMDsKPiAtIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHN0YXRpYyBjb25zdCBjaGFyICpzaG9ydF9vcHRpb25zID0gImpxIjsKPiAtIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3B0aW9uIGxvbmdfb3B0aW9uc1tdID0g
ewo+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgeyJoZWxwIiwgbm9fYXJndW1l
bnQsIDAsIDB9LAo+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgeyJ2ZXJzaW9u
Iiwgbm9fYXJndW1lbnQsIDAsIDB9LAo+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgeyJqZmZzMiIsIG5vX2FyZ3VtZW50LCAwLCAnaid9LAo+IC0gwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgeyJxdWlldCIsIG5vX2FyZ3VtZW50LCAwLCAncSd9LAo+IC0gwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgeyJzaWxlbnQiLCBub19hcmd1bWVudCwgMCwgJ3En
fSwKPiAtCj4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB7MCwgMCwgMCwgMH0s
Cj4gLSDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Owo+IC0KPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGludCBjID0gZ2V0b3B0X2xvbmcoYXJnYywgYXJndiwgc2hvcnRfb3B0aW9ucywKPiDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxvbmdfb3B0aW9ucywgJm9w
dGlvbl9pbmRleCk7Cj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoYyA9PSBFT0YpIHsKCk5B
Szogbm8gZXhwbGFuYXRpb24gd2h5IHlvdSdyZSBkb2luZyB0aGlzLCBhbmQgY3VycmVudCBjb2Rl
IGhhcyB0aGUKdmFyaWFibGVzIHNjb3BlZCB0byB3aGVyZSB0aGV5IGFjdHVhbGx5IGdldCB1c2Vk
LgoKaSB3b25kZXIgdGhvdWdoIHdoeSB0aGlzIGNvZGUgZXZlbiBib3RoZXJzIHdpdGggInN0YXRp
YyIuCi1taWtlCg==
