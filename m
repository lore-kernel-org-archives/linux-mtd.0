Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZtKW-00038M-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 11:34:36 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZtKU-00038F-00
	for mtd@infradead.org; Tue, 28 Mar 2000 11:34:34 +0100
Date: Tue, 28 Mar 2000 12:39:28 +0200 (CEST)
From: Finn Hakansson <finn.hakansson@axis.com>
To: =?ISO-8859-1?B?sce8rrHZ?= <kwonsk@mutech.co.kr>
cc: mtd@infradead.org
Subject: Re: Axis log based flash file system
In-Reply-To: <007e01bf985b$0c2ec1e0$0301a8c0@kwonsk.mutech.private>
Message-ID: <Pine.LNX.4.21.0003281206060.17037-100000@vvv.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 28 Mar 2000, =B1=C7=BC=AE=B1=D9 wrote:

> Hi, all
> In my thought, JFFS work of Axis was good for frequent log/delete
> applications
> like network printer or image server for web cam. But not good for gene=
ral
> file system.

That is correct. JFFS was designed with small flash devices in
mind. It would of course be possible to use it with other devices
though.


> Because, in JFFS, wear-leveling is only meaningful when old file is del=
eted
> and
> new file is created frequently (just like printer server).  maybe that'=
s why
> they called it implicite.

Well, since the file system is organized as a circular buffer
that is rotated around the flash, the different parts of the
flash device is used equally much. It could be seen as an
implicite effect.


> (wear leveling could be occur but not sure.)
> In situation where 80% of flash is steady (kernel + basic utils nerver
> deleted) then only 20 % of
> flash could be used in rotation. And if 20 % of flash could be fragment=
ed
> stopping rotation.  Maybe my understanding about JFFS (i just followd f=
ull
> source
> once)  would be poor. and I need more notes from axis people.
> Thansk.

In our products, we have the kernel and different programs on other
partitions with other file systems (i.e. ROMFS). We have a partition
with JFFS which is used for configuration files that the user can
modify (i.e. /etc). To that partition, a user can upload his own files.


/Finn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
