Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZGU0-0001DM-00
	for mtd-list@infradead.org; Wed, 13 Sep 2000 18:38:04 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13ZGTy-0001DG-00
	for mtd@infradead.org; Wed, 13 Sep 2000 18:38:03 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id SAA17287
	for <mtd@infradead.org>; Wed, 13 Sep 2000 18:37:54 +0100
To: mtd@infradead.org
Subject: Re: sbc-mediagx 
In-reply-to: Your message of "Wed, 13 Sep 2000 18:08:14 BST."
             <E13ZG18-00027x-00@pearl.tao.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_21358678560"
Date: Wed, 13 Sep 2000 18:37:53 +0100
From: David Given <dg@tao-group.com>
Message-Id: <E13ZGTp-0002V9-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multipart MIME message.

--==_Exmh_21358678560
Content-Type: text/plain; charset=us-ascii

>[...]
>>Easy to fix - just that nobody's bothered yet. Patches accepted if you care 
>>enough to produce one.
>
>Sure --- I just don't know how. Ditto with the devfs stuff. I'll have a look 
>at the rest of the kernel and see how easy/difficult it is. Getting this 
>working would be a great bonus for us.

The enclosed patch should fix the MODVERSIONS problem. I think. It compiles but I haven't tested it. Apply to include/linux/mtd/map.h.

I would have thought that something like my MANGLE_FUNCTION() would already exist in the kernel, but apparently not...

David Given
dg@tao-group.com

--==_Exmh_21358678560
Content-Type: application/octet-stream ; name="patch"
Content-Description: patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch"

SW5kZXg6IG1hcC5oCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KUkNTIGZpbGU6IC9ob21lL2N2cy9tdGQvaW5j
bHVkZS9saW51eC9tdGQvbWFwLmgsdgpyZXRyaWV2aW5nIHJldmlzaW9uIDEuNQpkaWZmIC1y
MS41IG1hcC5oCjc5YTgwLDg2Cj4gLyogV2UgbmVlZCB0byBwcm9wZXJseSBtYW5nbGUgdGhl
IG5hbWVzIG9mIGZ1bmN0aW9ucy4gKi8KPiAKPiAjaWYgZGVmaW5lZChNT0RWRVJTSU9OUykg
fHwgIWRlZmluZWQoQ09ORklHX01PRFZFUlNJT05TKQo+ICNkZWZpbmUgTUFOR0xFX0ZVTkNU
SU9OKHMpIF9fTU9EVUxFX1NUUklORyhzKQo+ICNlbHNlCj4gI2RlZmluZSBNQU5HTEVfRlVO
Q1RJT04ocykgX19NT0RVTEVfU1RSSU5HKF9fVkVSU0lPTkVEX1NZTUJPTChzKSkKPiAjZW5k
aWYKODQsODdjOTEsOTQKPCAjZGVmaW5lIGRvX2NmaV9wcm9iZSh4KSBkb19tYXBfcHJvYmUo
eCwgImNmaV9wcm9iZSIsICJjZmlfcHJvYmUiKQo8ICNkZWZpbmUgZG9famVkZWNfcHJvYmUo
eCkgZG9fbWFwX3Byb2JlKHgsICJqZWRlY19wcm9iZSIsICJqZWRlY19wcm9iZSIpCjwgI2Rl
ZmluZSBkb19yYW1fcHJvYmUoeCkgZG9fbWFwX3Byb2JlKHgsICJtYXBfcmFtX3Byb2JlIiwg
Im1hcF9yYW0iKQo8ICNkZWZpbmUgZG9fcm9tX3Byb2JlKHgpIGRvX21hcF9wcm9iZSh4LCAi
bWFwX3JvbV9wcm9iZSIsICJtYXBfcm9tIikKLS0tCj4gI2RlZmluZSBkb19jZmlfcHJvYmUo
eCkgZG9fbWFwX3Byb2JlKHgsIE1BTkdMRV9GVU5DVElPTihjZmlfcHJvYmUpLCAiY2ZpX3By
b2JlIikKPiAjZGVmaW5lIGRvX2plZGVjX3Byb2JlKHgpIGRvX21hcF9wcm9iZSh4LCBNQU5H
TEVfRlVOQ1RJT04oamVkZWNfcHJvYmUpLCAiamVkZWNfcHJvYmUiKQo+ICNkZWZpbmUgZG9f
cmFtX3Byb2JlKHgpIGRvX21hcF9wcm9iZSh4LCBNQU5HTEVfRlVOQ1RJT04obWFwX3JhbV9w
cm9iZSksICJtYXBfcmFtIikKPiAjZGVmaW5lIGRvX3JvbV9wcm9iZSh4KSBkb19tYXBfcHJv
YmUoeCwgTUFOR0xFX0ZVTkNUSU9OKG1hcF9yb21fcHJvYmUpLCAibWFwX3JvbSIpCg==

--==_Exmh_21358678560--




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
