Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hoZz-00089S-00
	for mtd-list@infradead.org; Tue, 27 Mar 2001 09:11:51 +0100
Received: from jerusalem.magic.fr ([195.154.101.82])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14hoZw-00089M-00
	for mtd@infradead.org; Tue, 27 Mar 2001 09:11:48 +0100
Received: from sofia.magic.fr (sofia.magic.fr [195.115.17.9])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id KAA23454
	for <mtd@infradead.org>; Tue, 27 Mar 2001 10:11:45 +0200 (CEST)
Received: from mail.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by sofia.magic.fr (8.9.0/8.9.0) with ESMTP id KAA18523
	for <mtd@infradead.org>; Tue, 27 Mar 2001 10:11:44 +0200 (CEST)
Message-ID: <3AC04C42.3FF16A7F@inventel.fr>
Date: Tue, 27 Mar 2001 10:16:02 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: =?iso-8859-1?Q?K=E1ri=20Dav=ED=F0sson?= <kd@flaga.is>
CC: mtd@infradead.org
Subject: Re: jffs in flash?
References: <EADB10BAC266A14A85ECBF8686A73E310A9120@kolkrabbi.flaga.is>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

correct me if I am wrong : in sa1100-flash.c, there are several examples =
where
a flash is divided into several partitions ;

for example : I have a 16Mbit flash and I have divided it into two partit=
ions of
8Mbit each

static struct mtd_partition is_blue00_partitions[] =3D {
   { name : "boot partition",
    offset : 0,
    size : 0x00200000 },
   { name : "cramfs partition",
    offset : 0x00200000,
    size : 0x00200000 }
};



K=E1ri Dav=ED=F0sson wrote:
> =

> Hi,
> =

> I have one flash chip (4MB) that i want to use parts of as a disk, e.g.=

> with jffs or jffs2.
> It seems to me that the jffs wants to use the whole chip under the fs.
> Is this correct?
> If not how can I tell jffs to start using the flash at some offset?
> =

> Thanks,
> =

> K.D.
> =

> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
