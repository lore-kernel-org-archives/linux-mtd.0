Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ifpf-0002gV-00
	for mtd-list@infradead.org; Thu, 29 Mar 2001 18:03:35 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ifpe-0002gP-00
	for mtd@infradead.org; Thu, 29 Mar 2001 18:03:34 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Thu, 29 Mar 2001 17:03:32 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Thu, 29 Mar 2001 17:03:32 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: partitions and erase regions
Date: Thu, 29 Mar 2001 17:03:31 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A9125@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I am implementing a "virtual" erase regions for partitions.
It looks to me that should be enough to create them in
add_mtd_partition().

This would make it easyer to manage partitions that cross erase region
boundaries.

Are there any reasons that this should not be done?

K.D.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
