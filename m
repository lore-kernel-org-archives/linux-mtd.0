Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14bN1j-0007rD-00
	for mtd-list@infradead.org; Fri, 09 Mar 2001 13:33:51 +0000
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14bN1h-0007r6-00
	for mtd@infradead.org; Fri, 09 Mar 2001 13:33:50 +0000
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-60460U3500L350S0V35) with ESMTP id is
          for <mtd@infradead.org>; Fri, 9 Mar 2001 13:33:45 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Fri, 9 Mar 2001 13:33:44 +0000
content-class: urn:content-classes:message
Subject: Abstractation
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 9 Mar 2001 13:33:44 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A910E@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I need to add a cfi_cmdset_0003 to support a Intel chip that we have in
our boards.

Why does I as the cmdset writer have to know all this stuff about the
buswith,
number of chips etc?

Me as a cmdset writer should only be conserned with implementing the
cmdset which is
only affecting one chip at a time, no matter how many there might be on
the bus.

What I am trying to say why is the layering not something like:

--------------------
| Kernel interface |
| has notation of  |
| read / write     |   Sees flash as linear buffer
| to/from linear   |
| buffers (buf)    | =20
--------------------
          |
          |
          |
-----------------------  Sees flash as collection of linear sectors
| Mtd knows  the      |  that might be distributed over many flash chips
| mapping from        |
| buffer range to     |
| individual flash    |
| chips/sectors       |
| i.e. where          |
| buf[x] is physically|
-----------------------
          |
          |
          |
--------------------
| cmdset            | sees only one flash chip.
| knows how to write| it knows how to erase sectors, write to them,
read,
| to chip at given  | at word level
| offset for given  |
| chip              |
---------------------

Any way,

Just a thought.

K.D.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
