Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CH02v-0003fo-7T
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2004 09:17:02 -0400
Date: Mon, 11 Oct 2004 16:16:57 +0300 (EEST)
From: Kalev Lember <kalev@colleduc.ee>
To: skorinkod@mail.ru
In-Reply-To: <200410111627.58486.skorinkod@mosk.ru>
Message-ID: <Pine.LNX.4.44.0410111609050.19519-200000@kiire.colleduc.ee>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463811840-2012948918-1097500617=:19519"
Cc: linux-mtd@lists.infradead.org
Subject: Re: BNAND Media Header not found
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---1463811840-2012948918-1097500617=:19519
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 11 Oct 2004, Dmitry Skorinko wrote:

> After nftl_format I start modules and have: 
> DiskOnChip BNAND Media Header not found
> and diskonchip don't find my flash :(
> /proc/mtd and /dev/mtd0 is empty....
> How I can return this header?

If you apply the attached patch to drivers/mtd/nand/diskonchip.c, you 
should be able to use the whole-device partition.

Provided that you have another Diskonchip 2000, you can try dumping the 
other one with nanddump and then writing the image using nandwrite to the 
non-working part.
This should restore the BNAND header.

> second question:
> when I had working system (hehe), there was note:
> DiskOnChip 2000 (INFTL model) during modules were loading
>                  ^^^^^^^
> 
> I tried "insmod" inftl.ko but I had kernel panic with it.... and I "insmod" 
> nftl.ko...
> where is problem?

You should post the panic here.

-- 
Best regards,
Kalev Lember

---1463811840-2012948918-1097500617=:19519
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="diskonchip.diff"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.44.0410111616570.19519@kiire.colleduc.ee>
Content-Description: 
Content-Disposition: attachment; filename="diskonchip.diff"

SW5kZXg6IGRpc2tvbmNoaXAuYw0KPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
UkNTIGZpbGU6IC9ob21lL2N2cy9tdGQvZHJpdmVycy9tdGQvbmFuZC9kaXNr
b25jaGlwLmMsdg0KcmV0cmlldmluZyByZXZpc2lvbiAxLjM4DQpkaWZmIC11
IC1yMS4zOCBkaXNrb25jaGlwLmMNCi0tLSBkaXNrb25jaGlwLmMJNSBPY3Qg
MjAwNCAyMjoxMTo0NiAtMDAwMAkxLjM4DQorKysgZGlza29uY2hpcC5jCTEx
IE9jdCAyMDA0IDEyOjU4OjAxIC0wMDAwDQpAQCAtMTQwOSwxMyArMTQwOSw5
IEBADQogCQlyZXR1cm4gcmV0Ow0KIAltZW1zZXQoKGNoYXIgKikgcGFydHMs
IDAsIHNpemVvZihwYXJ0cykpOw0KIAludW1wYXJ0cyA9IGluZnRsX3BhcnRz
Y2FuKG10ZCwgcGFydHMpOw0KLQkvKiBBdCBsZWFzdCBmb3Igbm93LCByZXF1
aXJlIHRoZSBJTkZUTCBNZWRpYSBIZWFkZXIuICBXZSBjb3VsZCBwcm9iYWJs
eQ0KLQkgICBkbyB3aXRob3V0IGl0IGZvciBub24tSU5GVEwgdXNlLCBzaW5j
ZSBhbGwgaXQgZ2l2ZXMgdXMgaXMNCi0JICAgYXV0b3BhcnRpdGlvbmluZywg
YnV0IEkgd2FudCB0byBnaXZlIGl0IG1vcmUgdGhvdWdodC4gKi8NCi0JaWYg
KCFudW1wYXJ0cykgcmV0dXJuIC1FSU87DQogCWFkZF9tdGRfZGV2aWNlKG10
ZCk7DQogI2lmZGVmIENPTkZJR19NVERfUEFSVElUSU9OUw0KLQlpZiAoIW5v
X2F1dG9wYXJ0KQ0KKwlpZiAoIW5vX2F1dG9wYXJ0ICYmIG51bXBhcnRzID4g
MCkNCiAJCWFkZF9tdGRfcGFydGl0aW9ucyhtdGQsIHBhcnRzLCBudW1wYXJ0
cyk7DQogI2VuZGlmDQogCXJldHVybiAwOw0K
---1463811840-2012948918-1097500617=:19519--
