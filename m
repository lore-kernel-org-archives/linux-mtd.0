Received: from h109-210-243-242.aiptek.com.tw ([210.243.242.109] helo=aiptekser1.aiptek.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GDeS-00042e-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 06:22:57 +0000
Received: from andrew (ANDREW.aiptek.com.tw [10.0.3.35])
          by aiptekser1.aiptek.com.tw (Post.Office MTA v3.5.3 release 223
          ID# 619-69644U200L100S0V35) with SMTP id tw
          for <linux-mtd@lists.infradead.org>;
          Tue, 18 Dec 2001 13:27:27 +0800
From: andrewkuo@aiptek.com.tw (AndrewKuo)
To: <linux-mtd@lists.infradead.org>
Subject: Problem about patching MTD/JFFS on uClinux-2.0.38.1pre7 
Date: Tue, 18 Dec 2001 13:25:33 +0800
Message-ID: <INEDIIEAKHENJJGJFHMEMEEBCAAA.andrewkuo@aiptek.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: base64
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

SGkgYWxsLA0KDQoJSSdtIG5ldyBpbiBsaW51eCwgSSdtIHRyeSB0byBwb3J0IEpGRlMgb24gdUNs
aW51eC0yLjAuMzguMXByZTcgZm9yIEFSTSB0YXJnZXQuIEkgZm9sbG93IE1URC1KRkZTLUhPV1RP
IHRvIHVzZSBjdnMgdG8gZ2V0IHRoZSBsYXN0ZWQgY29kZSBvZiBNVEQvSkZGUywgYW5kIHBhdGNo
IHRvIGtlcm5lbC4gQnV0IHRoZXJlIGlzIG9uZSBwYXRjaCBmYWlsIG9uICJhcmNoL2FybW5vbW11
L2NvbmZpZy5pbiIsIGFuZCBsb2cgdGhlIHBhdGNoIGZhaWwgaW5mb3JtYXRpb24gaW4gImNvbmZp
Zy5pbi5yZWoiLiBUaGUgY29udGVudCBpcywNCg0KKioqKioqKioqKioqKioqKioqKioqDQoqKiog
NzIsIDc3KioqKioqKioqDQogIGZpDQogIGVuZG1lbnUNCg0KICBzb3VyY2UgYXJjaC9hcm1ub21t
dS9kcml2ZXJzL2Jsb2NrL0NvbmZpZy5pbg0KDQogIGlmIFsgIiRDT05GSUdfTkVUIiA9ICJ5Il07
ICAgdGhlbg0KLS0tIDcyLCA3OSAtLS0tLS0tLS0tDQogIGZpDQogIGVuZG1lbnUNCg0KKyAgc291
cmNlIGRyaXZlcnMvbXRkL0NvbmZpZy5pbg0KKw0KICAgIHNvdXJjZSBhcmNoL2FybW5vbW11L2Ry
aXZlcnMvYmxvY2svQ29uZmlnLmluDQoNCiAgIGlmIFsgIiRDT05GSUdfTkVUIiA9ICJ5Il07ICAg
dGhlbg0KDQoNCg0KCUJ5IHRoZSB3YXksIEkgZm91bmQgdGhlcmUgaXMgbm90ICJhcmNoL2FybW5v
bW11L2RyaXZlcnMvYmxvY2siIGRpcmVjdG9yeSBpbiB1Q2xpbnV4LTIuMC4zOC4xcHJlNyBrZXJu
ZWwuIERvZXMgSSBtaXNzIHRvIHVwZGF0ZSBhbnkgcGF0Y2hlcyBmb3IgdUNsaW51eCdzIGtlcm5l
bC4gQ291bGQgYW55Ym9keSBoZWxwIG1lPyBUaGFua3MgYSBsb3QuDQoNCkFuZHJldw==
