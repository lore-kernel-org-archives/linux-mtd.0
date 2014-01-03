Received: from mailout.micron.com ([137.201.242.129])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VyuJX-0005Ey-80
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 02:16:44 +0000
From: =?utf-8?B?UWkgV2FuZyDnjovotbcgKHFpd2FuZyk=?= <qiwang@micron.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: [PATCH 1/1]  MTD: UBI:  avoid program operation on  NOR flash
 after erasure interrupted
Date: Fri, 3 Jan 2014 02:16:14 +0000
Message-ID: <71CF8D7F32C5C24C9CD1D0E02D52498A770BA85C@NTXXIAMBX02.xacn.micron.com>
References: <71CF8D7F32C5C24C9CD1D0E02D52498A770B54B1@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770BA389@NTXXIAMBX02.xacn.micron.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A770BA3A9@NTXXIAMBX02.xacn.micron.com>
 <3253694.tov52PJeEo@sandpuppy>
In-Reply-To: <3253694.tov52PJeEo@sandpuppy>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgUmljaGFyZDoNCkFydGVtIGFscmVhZHkgaGFzIHB1c2ggdGhpcyBwYXRjaCB0byAnbGludXgt
dWJpZnMnIGdpdCB0cmVlLiAgDQpUaGFua3MgZm9yIHlvdSByZW1pbmQsIEkgd2lsbCBjaGFuZ2Ug
dG8gZ2l0IHNlbmQtbWFpbCBuZXh0IHRpbWUuIA0KVGhhbmtzIGFnYWluIGZvciAgeW91ciByZXBs
eS4gSSB3aWxsIGJlIHZlcnkgY2FyZWZ1bCB0byBwdXNoIHBhdGNoIHRvIHlvdSBuZXh0IHRpbWUu
IA0KDQpUaGFua3MgYSBsb3QNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJp
Y2hhcmQgV2VpbmJlcmdlciBbbWFpbHRvOnJpY2hhcmRAbm9kLmF0XSANClNlbnQ6IFRodXJzZGF5
LCBKYW51YXJ5IDAyLCAyMDE0IDEwOjU4IFBNDQpUbzogUWkgV2FuZyDnjovotbcgKHFpd2FuZykN
CkNjOiBSaWNoYXJkIFdlaW5iZXJnZXI7IGRlZGVraW5kMUBnbWFpbC5jb207IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyBBZHJpYW4g
SHVudGVyDQpTdWJqZWN0OiBSZTogW1BBVENIIDEvMV0gTVREOiBVQkk6IGF2b2lkIHByb2dyYW0g
b3BlcmF0aW9uIG9uIE5PUiBmbGFzaCBhZnRlciBlcmFzdXJlIGludGVycnVwdGVkDQoNCkFtIE1p
dHR3b2NoLCAxLiBKYW51YXIgMjAxNCwgMTM6MTE6MjEgc2NocmllYiBRaSBXYW5nIOeOi+i1tzoN
Cj4gSWYgaGF2ZSBhbnkgcXVlc3Rpb25zLCBwbGVhc2UgbGV0IG1lIGtub3cuIA0KDQpEaWQgeW91
IHNlbmQgdGhlIHBhdGNoIGFnYWluIHVzaW5nIE91dGxvb2s/DQpPciBhcmUgeW91IGJlaGluZCBh
IE1TIEV4Y2hhbmdlIHNlcnZlcj8NCg0KVGhlIHBhdGNoIGlzIHN0aWxsIG1hbGZvcm1lZC4gOi0o
DQplLmcuIGl0IGlzIGJhc2U2NCBlbmNvZGVkLg0KDQpDYW4geW91IHBsZWFzZSB0cnkgdXNpbmcg
Z2l0IHNlbmQtZW1haWw/DQoNClRoYW5rcywNCi8vcmljaGFyZA0KDQo=
