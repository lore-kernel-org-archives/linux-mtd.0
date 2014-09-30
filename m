Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYrCE-0003Jf-RA
 for linux-mtd@lists.infradead.org; Tue, 30 Sep 2014 06:46:03 +0000
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH 4/4] UBI: Fastmap: Ensure that only one fastmap work is
 scheduled
Date: Tue, 30 Sep 2014 06:45:24 +0000
Message-ID: <1412059523.3904.11.camel@sauron.fi.intel.com>
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-5-git-send-email-richard@nod.at>
In-Reply-To: <1412029248-22454-5-git-send-email-richard@nod.at>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <15448B3936E38841B49BE9986495A167@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

T24gVHVlLCAyMDE0LTA5LTMwIGF0IDAwOjIwICswMjAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3Jv
dGU6DQo+ICsgICAgICAgc3Bpbl9sb2NrKCZ1YmktPndsX2xvY2spOw0KPiArICAgICAgIHViaS0+
Zm1fd29ya19zY2hlZHVsZWQgPSAwOw0KPiArICAgICAgIHNwaW5fdW5sb2NrKCZ1YmktPndsX2xv
Y2spOw0KDQpBbmRyZXcgTW9ydG9uIG9uY2Ugc2FpZCBtZSB0aGF0IGlmIEkgYW0gcHJvdGVjdGlu
ZyBhbiBpbnRlZ2VyIGNoYW5nZQ0KbGlrZSB0aGlzIHdpdGggYSBzcGlubG9jaywgSSBoYXZlIGEg
cHJvYmxlbSBpbiBteSBsb2NraW5nIGRlc2lnbi4gSGUgd2FzDQpyaWdodCBmb3IgbXkgcGFydGlj
dWxhciBjYXNlLg0KDQpJbnRlZ2VyIGlzIGNoYW5nZXMgYXRvbWljLiBUaGUgb25seSBvdGhlciB0
aGluZyBzcGlubG9jayBhZGRzIGFyZSB0aGUNCmJhcnJpZXJzLg0KDQotLSANCkJlc3QgUmVnYXJk
cywNCkFydGVtIEJpdHl1dHNraXkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lz
dGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkg
Q29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFu
ZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0
aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBk
aXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUg
bm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5k
IGRlbGV0ZSBhbGwgY29waWVzLgo=
