Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ca6o-0004zA-00
	for mtd-list@infradead.org; Mon, 12 Mar 2001 21:44:06 +0000
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ca6n-0004z4-00
	for mtd@infradead.org; Mon, 12 Mar 2001 21:44:05 +0000
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-60460U3500L350S0V35) with ESMTP id is
          for <mtd@infradead.org>; Mon, 12 Mar 2001 21:43:58 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Mon, 12 Mar 2001 21:43:57 +0000
content-class: urn:content-classes:message
Subject: erase.c
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Mar 2001 21:43:54 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E3108AFC2@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

In the intel chip that we are using here all sectors seem to be locked
by default.
So in the erase utility I propose the following patch.

Maybe it is ambigous to do force unlocking of sectors like this.
Should we maybe have a separate utility to lock/unlock sectors?

K.D.

--- ../mtd/util/erase.c Thu Sep 21 22:00:07 2000
+++ util/erase.c        Mon Mar 12 14:58:58 2001
@@ -51,6 +51,12 @@
                 erase.length, erase.start);
          fflush(stdout);
=20
+         if(ioctl(Fd, MEMUNLOCK, &erase) !=3D 0)
+         {
+                 perror("\nMTD Unlock failure");
+                 close(Fd);
+                 return 8;
+                }
          if (ioctl(Fd,MEMERASE,&erase) !=3D 0)
              {     =20
                  perror("\nMTD Erase failure");


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
