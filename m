Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hZxo-00035A-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 17:35:28 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14hZxn-000352-00
	for mtd@infradead.org; Mon, 26 Mar 2001 17:35:27 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Mon, 26 Mar 2001 16:35:11 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Mon, 26 Mar 2001 16:35:11 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: jffs in flash?
Date: Mon, 26 Mar 2001 16:35:10 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A9120@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I have one flash chip (4MB) that i want to use parts of as a disk, e.g.
with jffs or jffs2.
It seems to me that the jffs wants to use the whole chip under the fs.
Is this correct?
If not how can I tell jffs to start using the flash at some offset?

Thanks,

K.D.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
