Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hXY5-00027h-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 15:00:45 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14hXY4-00027b-00
	for mtd@infradead.org; Mon, 26 Mar 2001 15:00:44 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Mon, 26 Mar 2001 14:00:42 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Mon, 26 Mar 2001 14:00:42 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: patch to cfi_cmdset0001.c and erase.c
Date: Mon, 26 Mar 2001 14:00:40 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A911F@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I just commited a patch to cfi_cmdset0001.c in the spirit of
cfi_cmdset002.c::cfi_*erase_varsize() function.
I don't see the need for cfi_intelext_erase() since it's functionality
is included in cfi_intelext_erase_varsize(),
so I removed the former and replaced with the *varsize() variant. I
basically copied it from cfi_cmdset0002.c.
Maybe the same should be done in cfi_cmdset0002.c, i.e. get rid of the
cfi_amd*_erase() function all together?

This (code reuse with copy-paste) kind of hints that we can structure
cfi_cmdset*.c files in a better way....

I also changed the erase.c to use the new region_info_t structure that
is now exported to userspace with the
two ioctls (MEMGETREGIONCOUNT and MEMGETREGIONINFO) that I commited on
the weekend.

Please try these out with the amd chips, since I have none. It works for
me in an intel chip.

K.d.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
