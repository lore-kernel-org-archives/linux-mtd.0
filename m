Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zvvp8-0004mm-SI
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 23:26:07 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Tetsuo Handa
 <penguin-kernel@i-love.sakura.ne.jp>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Russell King
 <linux@arm.linux.org.uk>, "linux-acpi@vger.kernel.org"
 <linux-acpi@vger.kernel.org>, "drbd-user@lists.linbit.com"
 <drbd-user@lists.linbit.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Drokin, Oleg" <oleg.drokin@intel.com>,
 "Dilger, Andreas" <andreas.dilger@intel.com>, "codalist@coda.cs.cmu.edu"
 <codalist@coda.cs.cmu.edu>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Jan Kara <jack@suse.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Boris Petkov <bp@suse.de>
Subject: RE: [PATCH] tree wide: Use kvfree() than conditional kfree()/vfree()
Date: Mon, 9 Nov 2015 23:25:44 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F32B83DE2@ORSMSX114.amr.corp.intel.com>
References: <1447070170-8512-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
 <5253459.IxnqkcU2vL@vostro.rjw.lan>
In-Reply-To: <5253459.IxnqkcU2vL@vostro.rjw.lan>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PiBBQ0sgZm9yIHRoZSBBQ1BJIGNoYW5nZXMgKGFuZCBDQ2luZyBUb255IGFuZCBCb3JpcyBmb3Ig
dGhlIGhlYWRzLXVwIGFzIHRoZXkNCj4gYXJlIHdheSBtb3JlIGZhbWFpbGlhciB3aXRoIHRoZSBB
UEVJIGNvZGUgdGhhbiBJIGFtKS4NCg0KU3VyZS4gSWYga3ZmcmVlKCkgcmVhbGx5IGlzIHNtYXJ0
IGVub3VnaCB0byBmaWd1cmUgaXQgb3V0IHRoZW4gdGhlcmUNCml0IG5vIHBvaW50IGluIHRoZSBp
ZiAoYmxhaCkga2ZyZWUoKSBlbHNlIHZmcmVlKCkuDQoNClRoZSBkcml2ZXJzL2FjcGkvYXBlaS9l
cnN0LmMgY29kZSBpc24ndCBkb2luZyBhbnl0aGluZyBzdWJ0bGUgb3IgbWFnaWMgaGVyZS4NCg0K
LVRvbnkNCg==
