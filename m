Received: from moutng.kundenserver.de ([212.227.126.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HxRBQ-0002LN-Nn
	for linux-mtd@lists.infradead.org; Sun, 10 Jun 2007 13:26:35 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@lazybastard.org>
Subject: Re: [Patch 10/18] fs/logfs/inode.c
Date: Sun, 10 Jun 2007 19:24:28 +0200
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184636.GK8952@lazybastard.org>
In-Reply-To: <20070603184636.GK8952@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline
Message-Id: <200706101924.29927.arnd@arndb.de>
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

T24gU3VuZGF5IDAzIEp1bmUgMjAwNywgSsO2cm4gRW5nZWwgd3JvdGU6Cj4gK3N0cnVjdCBpbm9k
ZSAqbG9nZnNfbmV3X2lub2RlKHN0cnVjdCBpbm9kZSAqZGlyLCBpbnQgbW9kZSkKPiArewo+ICvC
oMKgwqDCoMKgwqDCoHN0cnVjdCBzdXBlcl9ibG9jayAqc2IgPSBkaXItPmlfc2I7Cj4gK8KgwqDC
oMKgwqDCoMKgc3RydWN0IGlub2RlICppbm9kZTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaW5vZGUg
PSBuZXdfaW5vZGUoc2IpOwo+ICvCoMKgwqDCoMKgwqDCoGlmICghaW5vZGUpCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqBsb2dmc19pbml0X2lub2RlKGlub2RlKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKg
aW5vZGUtPmlfbW9kZSA9IG1vZGU7Cj4gK8KgwqDCoMKgwqDCoMKgaW5vZGUtPmlfaW5vID0gbG9n
ZnNfZ2V0X2lubyhzYik7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGluc2VydF9pbm9kZV9oYXNoKGlu
b2RlKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGlub2RlOwo+ICt9CgpJIHRoaW5rIHRo
aXMgaXMgbWlzc2luZyBjb2RlIHRoYXQgc2V0cyB0aGUgaW5pdGlhbCBpX3VpZC9pX2dpZCwKYnV0
IHRoZXJlIG1heSBiZSBtb3JlIG1pc3NpbmcuIENoYW5naW5nIHRoZSB1aWQgdmFsdWUgd29ya3Ms
CmJ1dCBjcmVhdGluZyBmaWxlcyBhcyBub24tcm9vdCB1c2VyIGRvZXNuJ3QuCgoJQXJuZCA8PjwK
