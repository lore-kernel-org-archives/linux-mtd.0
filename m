Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Cwcz-0005ke-00
	for mtd-list@infradead.org; Fri, 14 Jul 2000 04:59:05 +0100
Date: Thu, 13 Jul 2000 22:58:57 -0500
From: Michael Elizabeth Chastain <mec@shout.net>
Message-Id: <200007140358.WAA26445@duracef.shout.net>
To: dwmw2@infradead.org, scote1@matrox.com
Subject: Re: Config.in
Cc: mtd@infradead.org, tao@acc.umu.se
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I introduced define_tristate in the 2.3 series.

I am not following the MTD discussion, but I gather the idea is to use
the same Config.in files for both 2.2 and 2.3.  If you need to do that,
I suppose you can use define_bool and get away with it.

define_tristate exists in order to help tighten up the type system in
Config Language.  The idea is to improve the tools so that they can give
warnings and errors about things like "this variable is a boolean in
one place and a tristate in another".  If this ever actually happens,
I hope that drivers/mtd/Config.in can be edited at that time to conform.

Just some historical two cent's worth from an old has-been.  :)

Michael


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
