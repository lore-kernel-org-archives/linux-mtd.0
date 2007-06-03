Received: from moutng.kundenserver.de ([212.227.126.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HuyFO-0007rj-W3
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 18:08:31 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@lazybastard.org>
Subject: Re: [Patch 09/18] fs/logfs/gc.c
Date: Mon, 4 Jun 2007 00:07:36 +0200
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184604.GJ8952@lazybastard.org>
In-Reply-To: <20070603184604.GJ8952@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline
Message-Id: <200706040007.38578.arnd@arndb.de>
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

T24gU3VuZGF5IDAzIEp1bmUgMjAwNywgSsO2cm4gRW5nZWwgd3JvdGU6Cj4gK3N0YXRpYyBsb25n
IGRlY2F5KGxvbmcgdDAsIGxvbmcgdCwgbG9uZyB0aGV0YSkKPiArewo+ICvCoMKgwqDCoMKgwqDC
oGxvbmcgc2hpZnQsIGZhYzsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHQgPj0gMzIqdGhldGEp
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqBzaGlmdCA9IHQvdGhldGE7Cj4gK8KgwqDCoMKgwqDCoMKgZmFjID0gdGhldGEgLSAo
dCV0aGV0YSkvMjsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gKHQwID4+IHNoaWZ0KSAqIGZhYyAv
IHRoZXRhOwo+ICt9CgpJIHRoaW5rIGl0J3MgY29uZnVzaW9uIHRvIHdvcmsgd2l0aCAnbG9uZycg
YXJndW1lbnRzCmhlcmUuIElmIHlvdSBhY3R1YWxseSBhbGxvdyBsYXJnZXIgdGhhbiAzMiBiaXQg
YXJndW1lbnRzLAp0aGF0IG1lYW5zIHRoYXQgdGhlIGdjIGxvZ2ljIGJlaGF2ZXMgZGlmZmVyZW50
bHkgb24KMzIgYW5kIDY0IGJpdCBDUFVzLCB3aGljaCBJIGRvbid0IHRoaW5rIGlzIHdoYXQgeW91
CmludGVuZGVkLgoKQWxzbywgY2FuIGFueSBvZiB0aGUgYXJndW1lbnRzIGJlIG5lZ2F0aXZlPyBI
b3cgYWJvdXQKbWFraW5nIHRoZW0gYWxsIGV4cGxpY2l0IHUzMiBhbmQgdTY0IHZhcmlhYmxlcz8K
CglBcm5kIDw+PAo=
