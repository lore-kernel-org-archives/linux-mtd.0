Received: from ee.snu.ac.kr ([147.46.112.25])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ymku-0002gv-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2001 04:13:32 +0000
From: "Kim, Sanghun" <shkim@fdma.snu.ac.kr>
To: "Linux Mtd" <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>,
   <sjhill@cotw.com>
Subject: NAND : check my modification in kernel2.2.13
Date: Wed, 31 Oct 2001 13:26:54 +0900
Message-ID: <AEECKHHDHJAAFPKILIGNAEMFCAAA.shkim@fdma.snu.ac.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
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

SSBzYWlkIG15IGVudmlyb25tZW50IGluIGFib3ZlIG1lc3NhZ2VzLi4uLiggc2VlIGJlbG93Li4p
DQoNCkkgY2FuIG5vdCBoYXZlIDIuMi4xOCBmb3IgbXkgYm9hcmQsIHNvIEkgdXNlIDIuMi4xMy4u
Li4NCg0KaW4gcG9ydGluZyB0byAyLjIuMTguLi4uLg0KDQprZXJuZWwgd2FudHMgImNvbXBhdG1h
Yy5oIiwgc28gSSBjb3BpZWQgIi9saW51eC9pbmNsdWRlL2NvbXBhdG1hYy5oIiBpbiAyLjIuMTgg
dG8gIi9saW51eC9pbmNsdWRlL2NvbXBhdG1hYy5oIiBpbiAyLjIuMTMuLg0KYW5kIGNvbXBpbGUg
dGhlIGtlcm5lbC4gdGhlcmUncyBubyBlcnJvci4uLg0KDQppcyBpdCBwb3NzaWJsZSB0aGF0IGdl
bmVyYXRpbmcgbXkgcHJvYmxlbSAobGxfcndfYmxvY2suLi4pPw0KDQp+fn4gQmVmb3JlIHNheWlu
ZyBwcm9ibGVtLCBpJ2xsIGV4cGxhaW4gbXkgZW52aXJvbm1lbnQuLi4NCn5+fiANCn5+fiBBUk05
MjBUICsgTkFORCBGbGFzaC4uLg0Kfn5+IA0Kfn5+IExpbnV4IGtlcm5lbCAyLjIuMTMNCn5+fiAN
Cn5+fiBTbywgSSB1c2UgTVREIGZvciAyLjIuMTggYW5kIHBhdGNoIG1hbnVhbHkuLi4NCn5+fiAN
Cn5+fiBhbmQgbW9kaWZ5IHNwaWEuYw0Kfn5+IA0Kfn5+IEtlcm5lbCBjb25maWd1cmF0aW9uIGlz
DQp+fn4gDQp+fn4gQ09ORklHX01URD15DQp+fn4gQ09ORklHX01URF9ERUJVRz15DQp+fn4gQ09O
RklHX01URF9ERUJVR19WRVJCT1NFPTANCn5+fiBDT05GSUdfTVREX05BTkQ9eQ0Kfn5+IENPTkZJ
R19NVERfTkFORF9FQ0M9eQ0Kfn5+IENPTkZJR19NVERfTkFORF9TUElBPXkNCn5+fiBDT05GSUdf
TVREX0NIQVI9eQ0Kfn5+IENPTkZJR19NVERfQkxPQ0s9eQ0Kfn5+IA0Kfn5+IGFuZC4uLi4gYm9v
dGluZyBsaW51eA0Kfn5+IA0Kfn5+ID4gcm9vdD4gY2F0IC9wcm9jL210ZA0Kfn5+ID4gbXRkMDog
MHgwMDIwMDAwMCAic3BpYSBOQU5EIGZsYXNoIHBhcnRpdGlvbiAxIg0Kfn5+IC0tLT4gRmluZCBt
eSBuYW5kIGZsYXNoLi4uKG9rPykNCn5+fiANCn5+fiBXaGVuIEkgY29tbWFuZCByZWFkL3dyaXRl
L2VyYXNlIHVzaW5nIC9kZXYvbXRkMCAsIGFsbCBvcGVyYXRpb25zIHdvcmsNCn5+fiB3ZWxsLg0K
fn5+IA0Kfn5+IFBST0JMRU0uLi4uLi4uLi4uUFJPQkxFTS4uLi4uLi4uLg0Kfn5+IA0Kfn5+IGJ1
dC4gDQp+fn4gVG8gdXNlIEpGRlMuDQp+fn4gPiByb290PiBkZCBvZj0vZGV2L210ZGJsb2NrMCBp
Zj1qZmZzLmltZw0Kfn5+ID4gbXRkYmxvY2tfb3Blbg0Kfn5+ID4gb2sNCn5+fiA+IGxsX3J3X2Js
b2NrOiBUcnlpbmcgdG8gcmVhZCBub25leGlzdGVudCBibG9jay1kZXZpY2UgMWY6MDAgKDApDQp+
fn4gPiAvZGV2L210ZGJsb2NrX3JlbGVhc2UNCn5+fiA+IG10ZGJsb2NrMDogSW5wdXQvb3V0cHV0
IGVycm9yDQp+fn4gPiBuYW5kX3N5bmM6Y2FsbGVkDQp+fn4gPiBvaw0Kfn5+IA0Kfn5+IEZhaWx1
cmUgaGFwcGVuIGluICAiY2hlY2tpbmcgZGV2LT5yZXF1ZXN0X2ZuIiAoIGluIGZ1bmN0aW4NCn5+
fiBsbF9yd19ibG9jaykNCn5+fiANCn5+fiBJIGRvbid0IGtub3cgdGhlIHJlYXNvbiB3aHkgdGhp
cyBoYXBwZW4uLi4/
