Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qiCL-0007ys-00
	for mtd-list@infradead.org; Fri, 20 Apr 2001 22:12:13 +0100
Received: from wwcst270.netaddress.usa.net ([204.68.23.15])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14qiCE-0007yl-00
	for mtd@infradead.org; Fri, 20 Apr 2001 22:12:10 +0100
Message-ID: <20010420211159.23219.qmail@wwcst270.netaddress.usa.net>
Date: 20 Apr 2001 14:11:59 PDT
From: Eric <ebrower@usa.net>
To: "Kári" "Davíðsson" <kd@flaga.is>
Subject: Re: [RE: [Q] MEMGETREGIONxxx ioctls]
CC: <mtd@infradead.org>, dwmw2@infradead.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----NetAddressPart-00--=_TVL87312S705e6335e8"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------NetAddressPart-00--=_TVL87312S705e6335e8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Can we add the following patch as well?  It seems we are
directly dereferencing userspace w/o calling get_from_user().

I should have caught this with the original post.

Thanks!
E

K=E1ri Dav=ED=F0sson <kd@flaga.is> wrote:


Hi,

Corrected these errors and commited.

Thanks,

K.D.

-----Original Message-----
From:	Eric
Sent:	Thu 4/12/2001 7:27 PM
To:	mtd@infradead.org
Cc:	=

Subject:	[Q] MEMGETREGIONxxx ioctls

Here are a few questions related to the MEMGETREGIONxxx ioctls.
I'd simply submit a patch, but I am not sure about the reasoning
and I'm not near a build system for verification:

	1) Why is MEMGETREGIONCOUNT declared with _IOW
	   instead of _IOR in mtd.h?  It seems to be a
	   read from kernelspace, rather than a write to
           kernelspace in mtdchar.c.

	2) Why is MEMGETREGIONINFO declared likewise with _IOW
	   instead of _IOWR?  The ioctl in mtdchar.c reads the
	   regionindex member and then populates the rest of the
	   struct accordingly.

	3) Do we need the declaration of =

		"struct mtd_erase_region_info *kr"
	   inside the MEMGETREGIONINFO ioctl handler?  It is =

	   initialized but never used, so I doubt it is necessary.

Thanks,
E

____________________________________________________________________
Get free email and a permanent address at http://www.netaddress.com/?N=3D=
1


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org




> --------------------------------------------- =

>	Attachment: winmail.dat =

>	MIME Type: application/ms-tnef =

> --------------------------------------------- =


____________________________________________________________________
Get free email and a permanent address at http://www.netaddress.com/?N=3D=
1

------NetAddressPart-00--=_TVL87312S705e6335e8
Content-Type: application/octet-stream; name="mtdchar.patch"
Content-Transfer-Encoding: base64
Content-Disposition: inline; filename="mtdchar.patch"

LS0tIG10ZGNoYXIuYy5vcmlnCUZyaSBBcHIgMjAgMTM6Mjc6MjAgMjAwMQorKysgbXRkY2hh
ci5jCUZyaSBBcHIgMjAgMTM6Mjc6MzQgMjAwMQpAQCAtMjk5LDE0ICsyOTksMTggQEAKIAkJ
YnJlYWs7CiAJY2FzZSBNRU1HRVRSRUdJT05JTkZPOgogCXsKLQkJc3RydWN0IHJlZ2lvbl9p
bmZvX3VzZXIgKiB1cjsKLQkJdXIgPSAoc3RydWN0IHJlZ2lvbl9pbmZvX3VzZXIgKikgYXJn
OworCQlzdHJ1Y3QgcmVnaW9uX2luZm9fdXNlciB1cjsKIAotCQlpZiAodXItPnJlZ2lvbmlu
ZGV4ID49IG10ZC0+bnVtZXJhc2VyZWdpb25zKQorCQlpZiAoY29weV9mcm9tX3VzZXIoCSZ1
ciwgCisJCQkJCShzdHJ1Y3QgcmVnaW9uX2luZm9fdXNlciAqKWFyZywgCisJCQkJCXNpemVv
ZihzdHJ1Y3QgcmVnaW9uX2luZm9fdXNlcikpKSB7CiAJCQlyZXR1cm4gLUVGQVVMVDsKKwkJ
fQogCisJCWlmICh1ci5yZWdpb25pbmRleCA+PSBtdGQtPm51bWVyYXNlcmVnaW9ucykKKwkJ
CXJldHVybiAtRUZBVUxUOwogCQlpZiAoY29weV90b191c2VyKChzdHJ1Y3QgbXRkX2VyYXNl
X3JlZ2lvbl9pbmZvICopIGFyZywgCi0JCQkJJihtdGQtPmVyYXNlcmVnaW9uc1t1ci0+cmVn
aW9uaW5kZXhdKSwKKwkJCQkmKG10ZC0+ZXJhc2VyZWdpb25zW3VyLnJlZ2lvbmluZGV4XSks
CiAJCQkJc2l6ZW9mKHN0cnVjdCBtdGRfZXJhc2VfcmVnaW9uX2luZm8pKSkKIAkJCXJldHVy
biAtRUZBVUxUOwogCQlicmVhazsK

------NetAddressPart-00--=_TVL87312S705e6335e8--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
