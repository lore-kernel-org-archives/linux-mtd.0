Received: from onz.com ([67.121.61.113] helo=dual166.onz.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19UeiU-0006Eh-7a
	for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2003 04:43:34 +0100
Message-Id: <5.2.1.1.0.20030623202634.00abe1a0@192.168.1.10>
Date: Mon, 23 Jun 2003 20:33:19 -0700
To: Infradead Org <linux-mtd@lists.infradead.org>
From: Allen Curtis <acurtis@onz.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=====================_5314671==_"
Subject: cfi_cmdset_00001.c problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=====================_5314671==_
Content-Type: text/plain; charset="us-ascii"; format=flowed

I am having problems with Intel Strata CFI support. The problem is in 
cfi_cmdset_00001.c. It appears that this has been broken since CVS version 
1.115. Attached is a log file that shows the output from the drivers with 
verbose output. Basically, it looks like there is a problem when you erase 
a block and then call put_chip(). The erase function leaves the status in 
FL_STATUS but put_chip() does not have a case for this state and gets very 
unhappy.

My original solution was to add FL_STATUS to the FL_READY state. I am quite 
sure this is wrong. Should the FL_STATUS state from get_chip() be 
duplicated in put_chip()?

TIA
--=====================_5314671==_
Content-Type: text/plain; name="errorlog.txt";
 x-mac-type="42494E41"; x-mac-creator="74747874"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="errorlog.txt"

Rml4ZWQgYnkgYWRkaW5nIEZMX1NUQVRVUyB0byBGTF9SRUFEWSBzdGF0ZSBpbiBwdXRfY2hpcCgp
PwoKQ29uc29sZSBvdXRwdXQKPT09PT09PT09PT09PT0Kcm9vdEAxOTEuMS4xLjMwOn4jIGVyYXNl
IC9kZXYvbXRkMiAwIDU4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
TVREX29wZW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKRXJhc2UgVG90YWwgNTggVW5pdHMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKTVREX2lvY3Rs
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKTVREX2lvY3RsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKUGVyZm9ybWluZyBGbGFzaCBF
cmFzZSBvZiBsZW5ndGggNTI0Mjg4IGF0IG9mZnNldCAweDBNVERfaW9jdGwgICAgICAgICAgICAg
ICAgICAKUGVyZm9ybWluZyBGbGFzaCBFcmFzZSBvZiBsZW5ndGggNTI0Mjg4IGF0IG9mZnNldCAw
eDgwMDAwTVREX2lvY3RsICAgICAgICAgICAgICAKUGVyZm9ybWluZyBGbGFzaCBFcmFzZSBvZiBs
ZW5ndGggNTI0Mjg4IGF0IG9mZnNldCAweDEwMDAwME1URF9pb2N0bCAgICAgICAgICAgICAKLgou
Ci4KUGVyZm9ybWluZyBGbGFzaCBFcmFzZSBvZiBsZW5ndGggNTI0Mjg4IGF0IG9mZnNldCAweDFj
MDAwMDBNVERfaW9jdGwgICAgICAgICAgICAKUGVyZm9ybWluZyBGbGFzaCBFcmFzZSBvZiBsZW5n
dGggNTI0Mjg4IGF0IG9mZnNldCAweDFjODAwMDBNVERfaW9jdGwgICAgICAgICAgICAKIGRvbmUg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAKTVREX2Nsb3NlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKcm9vdEAxOTEuMS4xLjMw
On4jIGVjaG8gOT4vcHJvYy9zeXMva2VybmVsL3ByaW50ayAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKcm9vdEAxOTEuMS4xLjMwOn4jIG1vdW50
IC10IGpmZnMyIC9kZXYvbXRkYmxvY2syIC9tbnQvdGhhbGVzICAgICAgICAgICAgICAgICAgICAK
SkZGUzIgdmVyc2lvbiAyLjEuIChDKSAyMDAxLCAyMDAyIFJlZCBIYXQsIEluYy4sIGRlc2lnbmVk
IGJ5IEF4aXMgQ29tbXVuaWNhdGlvbnMKIEFCLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKbXRkYmxvY2tf
b3BlbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKb2sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKcHV0X2NoaXAoKSBjYWxsZWQg
d2l0aCBvbGRzdGF0ZSAxISEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAKcm9vdEAxOTEuMS4xLjMwOn4jIHB1dF9jaGlwKCkgY2FsbGVkIHdpdGggb2xkc3RhdGUg
MSEhICAgICAgICAgICAgICAgICAgICAgICAgICAKcHV0X2NoaXAoKSBjYWxsZWQgd2l0aCBvbGRz
dGF0ZSAxISEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKcHV0
X2NoaXAoKSBjYWxsZWQgd2l0aCBvbGRzdGF0ZSAxISEgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKcHV0X2NoaXAoKSBjYWxsZWQgd2l0aCBvbGRzdGF0ZSAxISEg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKCgovdmFyL2xvZy9t
ZXNzYWdlcwo9PT09PT09PT09PT09PT09PQpKYW4gIDEgMDA6MDA6MzMgMTkxIGtlcm5lbDogTVRE
X29wZW4KSmFuICAxIDAwOjAwOjMzIDE5MSBrZXJuZWw6IE1URF9pb2N0bApKYW4gIDEgMDA6MDE6
MDQgMTkxIGxhc3QgbWVzc2FnZSByZXBlYXRlZCAzNSB0aW1lcwpKYW4gIDEgMDA6MDE6MjYgMTkx
IGxhc3QgbWVzc2FnZSByZXBlYXRlZCAyNCB0aW1lcwpKYW4gIDEgMDA6MDE6MjcgMTkxIGtlcm5l
bDogTVREX2Nsb3NlCkphbiAgMSAwMDowNToxMSAxOTEga2VybmVsOiBKRkZTMiB2ZXJzaW9uIDIu
MS4gKEMpIDIwMDEsIDIwMDIgUmVkIEhhdCwgSW5jLiwgZGVzaWduZWQgYnkgQXhpcyBDb21tdW5p
Y2F0aW9ucyBBQi4KSmFuICAxIDAwOjA1OjExIDE5MSBrZXJuZWw6IDAwMCwgdW5jaGVja2VkIDAw
MDAwMDAwLCBmcmVlIDAwMDgwMDAwKQoKQWZ0ZXIgZml4IG1lc3NhZ2VzCj09PT09PT09PT09PT09
PT09PQpqZmZzMjogTm8gY2xlYW4sIGRpcnR5IF9vcl8gZXJhc2FibGUgYmxvY2tzIHRvIEdDIGZy
b20hIFdoZXJlIGFyZSB0aGV5IGFsbD8gICAgIApqZmZzMjogQ291bGRuJ3QgZmluZCBlcmFzZSBi
bG9jayB0byBnYXJiYWdlIGNvbGxlY3QhICAgICAgICAgICAgICAgICAgICAgICAgICAgIApTZW5k
aW5nIGFsbCBwcm9jZXNzZXMgdGhlIEtJTEwgc2lnbmFsLi4uIGRvbmUuICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIApVbm1vdW50aW5nIHJlbW90ZSBmaWxlc3lzdGVtcy4uLiBkb25l
LgpEZWFjdGl2YXRpbmcgc3dhcC4uLiBkb25lLgpVbm1vdW50aW5nIGxvY2FsIGZpbGVzeXN0ZW1z
Li4uIG10ZGJsb2NrX3JlbGVhc2UKb2sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCg==
--=====================_5314671==_
Content-Type: text/plain; charset="us-ascii"; format=flowed


--=====================_5314671==_--
