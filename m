Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14r1hM-0005a8-00
	for mtd-list@infradead.org; Sat, 21 Apr 2001 19:01:32 +0100
content-class: urn:content-classes:message
Subject: RE: [RE: [Q] MEMGETREGIONxxx ioctls]
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C0CA8D.11EC1BD6"
Date: Sat, 21 Apr 2001 18:01:20 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A9143@kolkrabbi.flaga.is>
From: =?Windows-1252?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: "Eric" <ebrower@usa.net>
Cc: <mtd@infradead.org>,
	<dwmw2@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C0CA8D.11EC1BD6
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

I though that these kind of errors, i.e. referencing
user space directly from the kernel would trigger a
seg fault?

Anyways, It is now fixed.

Thanks,

K.D.

-----Original Message-----
From:	Eric
Sent:	Fri 4/20/2001 9:11 PM
To:	K=E1ri Dav=ED=F0sson
Cc:	mtd@infradead.org; dwmw2@infradead.org
Subject:	Re: [RE: [Q] MEMGETREGIONxxx ioctls]

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
Cc:=09
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

	3) Do we need the declaration of=20
		"struct mtd_erase_region_info *kr"
	   inside the MEMGETREGIONINFO ioctl handler?  It is=20
	   initialized but never used, so I doubt it is necessary.

Thanks,
E

____________________________________________________________________
Get free email and a permanent address at =
http://www.netaddress.com/?N=3D1


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org




> ---------------------------------------------=20
>	Attachment: winmail.dat=20
>	MIME Type: application/ms-tnef=20
> ---------------------------------------------=20

____________________________________________________________________
Get free email and a permanent address at =
http://www.netaddress.com/?N=3D1




------_=_NextPart_001_01C0CA8D.11EC1BD6
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IhUSAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEAJQAAAFJFOiBbUkU6IFtRXSBNRU1H
RVRSRUdJT054eHggaW9jdGxzXQBcCwEFgAMADgAAANEHBAAVABIAAQAUAAYAHgEBIIADAA4AAADR
BwQAFQASAAEAFAAGAB4BAQmAAQAhAAAARkNDMDY2QjFBQ0YyOTc0QjlCQTlFRTc1REIxRTkwMDkA
dgcBA5AGAPwLAAA3AAAAAwA2AAAAAABAADkA1hvsEY3KwAEeAD0AAQAAAAUAAABSRTogAAAAAAIB
RwABAAAAMAAAAGM9SVM7YT0gO3A9RmxhZ2E7bD1LT0xLUkFCQkktMDEwNDIxMTgwMTIwWi0yMTIy
AB4ASQABAAAAJQAAAFJlOiBbUkU6IFtRXSBNRU1HRVRSRUdJT054eHggaW9jdGxzXQAAAABAAE4A
gLlPid7JwAEeAFoAAQAAAAUAAABFcmljAAAAAAIBWwABAAAAMgAAAAAAAACBKx+kvqMQGZ1uAN0B
D1QCAAAAAEVyaWMAU01UUABlYnJvd2VyQHVzYS5uZXQAAAACAVwAAQAAABUAAABTTVRQOkVCUk9X
RVJAVVNBLk5FVAAAAAAeAF0AAQAAAAUAAABFcmljAAAAAAIBXgABAAAAMgAAAAAAAACBKx+kvqMQ
GZ1uAN0BD1QCAAAAAEVyaWMAU01UUABlYnJvd2VyQHVzYS5uZXQAAAACAV8AAQAAABUAAABTTVRQ
OkVCUk9XRVJAVVNBLk5FVAAAAAAeAGYAAQAAAAUAAABTTVRQAAAAAB4AZwABAAAAEAAAAGVicm93
ZXJAdXNhLm5ldAAeAGgAAQAAAAUAAABTTVRQAAAAAB4AaQABAAAAEAAAAGVicm93ZXJAdXNhLm5l
dAAeAHAAAQAAACEAAABbUkU6IFtRXSBNRU1HRVRSRUdJT054eHggaW9jdGxzXQAAAAACAXEAAQAA
ABsAAAABwMnei/hOA5SgKb1Blopny2alffY1ACuN7hgAHgBzAAEAAAAnAAAAbXRkQGluZnJhZGVh
ZC5vcmc7IGR3bXcyQGluZnJhZGVhZC5vcmcAAB4AdAABAAAADwAAAEvhcmkgRGF27fBzc29uAAAe
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
QhAatLkIACsv4YIBAAAAAAAAAC9PPUZMQUdBL09VPUZJUlNUIEFETUlOSVNUUkFUSVZFIEdST1VQ
L0NOPVJFQ0lQSUVOVFMvQ049S0FSSUQAAAAeAPo/AQAAABUAAABTeXN0ZW0gQWRtaW5pc3RyYXRv
cgAAAAACAfs/AQAAAB4AAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAALgAAAAMA/T/kBAAA
AwAZQAAAAAADABpAAAAAAAMAHUAAAAAAAwAeQAAAAAAeADBAAQAAAAYAAABLQVJJRAAAAB4AMUAB
AAAABgAAAEtBUklEAAAAHgAyQAEAAAAQAAAAZWJyb3dlckB1c2EubmV0AB4AM0ABAAAAEAAAAGVi
cm93ZXJAdXNhLm5ldAAeADhAAQAAAAYAAABLQVJJRAAAAB4AOUABAAAAAgAAAC4AAAALACkAAAAA
AAsAIwAAAAAAAwAGEIYVNfQDAAcQ0wUAAAMAEBAAAAAAAwAREAAAAAAeAAgQAQAAAGUAAABISSxJ
VEhPVUdIVEhBVFRIRVNFS0lORE9GRVJST1JTLElFUkVGRVJFTkNJTkdVU0VSU1BBQ0VESVJFQ1RM
WUZST01USEVLRVJORUxXT1VMRFRSSUdHRVJBU0VHRkFVTFQ/QU5ZAAAAAAIBfwABAAAAPAAAADxF
QURCMTBCQUMyNjZBMTRBODVFQ0JGODY4NkE3M0UzMTBBOTE0M0Brb2xrcmFiYmkuZmxhZ2EuaXM+
APha

------_=_NextPart_001_01C0CA8D.11EC1BD6--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
