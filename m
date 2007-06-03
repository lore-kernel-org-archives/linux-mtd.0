Received: from moutng.kundenserver.de ([212.227.126.171])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HuxzW-0006so-9o
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 17:52:23 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@lazybastard.org>
Subject: Re: [Patch 05/18] fs/logfs/logfs.h
Date: Sun, 3 Jun 2007 23:50:55 +0200
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184303.GF8952@lazybastard.org>
In-Reply-To: <20070603184303.GF8952@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline
Message-Id: <200706032350.57556.arnd@arndb.de>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Roland Dreier <rdreier@cisco.com>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

T24gU3VuZGF5IDAzIEp1bmUgMjAwNywgSsO2cm4gRW5nZWwgd3JvdGU6Cj4gKy8qKgo+ICsgKiBz
dHJ1Y3QgbG9nZnNfZGV2aWNlX29wcyAtIGRldmljZSBhY2Nlc3Mgb3BlcmF0aW9ucwo+ICsgKgo+
ICsgKiBAcmVhZDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
YWQgZnJvbSB0aGUgZGV2aWNlCj4gKyAqIEB3cml0ZTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB3cml0ZSB0byB0aGUgZGV2aWNlCj4gKyAqIEBlcmFzZTrCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcmFzZSBwYXJ0IG9mIHRoZSBkZXZp
Y2UKPiArICovCj4gK3N0cnVjdCBsb2dmc19kZXZpY2Vfb3BzIHsKPiArwqDCoMKgwqDCoMKgwqBp
bnQgKCpyZWFkKShzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBsb2ZmX3Qgb2ZzLCBzaXplX3QgbGVu
LCB2b2lkICpidWYpOwo+ICvCoMKgwqDCoMKgwqDCoGludCAoKndyaXRlKShzdHJ1Y3Qgc3VwZXJf
YmxvY2sgKnNiLCBsb2ZmX3Qgb2ZzLCBzaXplX3QgbGVuLCB2b2lkICpidWYpOwo+ICvCoMKgwqDC
oMKgwqDCoGludCAoKmVyYXNlKShzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBsb2ZmX3Qgb2ZzLCBz
aXplX3QgbGVuKTsKPiArfTsKCkkgd29uZGVyIGlmIHRoZXJlIGlzIGEgd2F5IHRvIGRvY3VtZW50
IHRoZSBwcm90b3R5cGVzIG9mIHRoZXNlIGZ1bmN0aW9uCnBvaW50ZXJzIHdpdGgga2VybmVsZG9j
LCBvdGhlciB0aGFuIGhhdmluZyBhIHR5cGVkZWYgZm9yIGVhY2guCgpXaGF0IGJyb3VnaHQgbWUg
dG8gdGhpcyBwb2ludCBpcyB0aGF0IEkgZmlyc3QgYXNzdW1lZCB0aGV5IHdvdWxkIHJldHVybgp0
aGUgbnVtYmVyIG9mIGJ5dGVzIHRyYW5zZmVycmVkLCBsaWtlIHJlYWQvd3JpdGUgZmlsZSBvcGVy
YXRpb25zLCB3aGVyZQp5b3VyIGZ1bmN0aW9ucyByZXR1cm4gemVybyBvbiBzdWNjZXNzLgoKCUFy
bmQgPD48Cg==
