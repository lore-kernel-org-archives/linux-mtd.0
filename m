Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12px9m-0000DZ-00
	for mtd-list@infradead.org; Thu, 11 May 2000 18:53:54 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12px9j-0000DT-00
	for mtd@infradead.org; Thu, 11 May 2000 18:53:52 +0100
Received: from localhost (1203 bytes) by jodie.lucid
	via sendmail with P:stdio/R:bind_hosts/T:inet_zone_bind_smtp
	(sender: <dvir>) (ident <dvir> using unix)
	id <m12pxG2-0000ccC@jodie.lucid>
	for <mtd@infradead.org>; Thu, 11 May 2000 21:00:22 +0300 (IDT)
	(Smail-3.2.0.102 1998-Aug-2 #2 built 1998-Oct-13)
From: Dvir Oren <dvir@lucidvon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14618.62773.723372.310409@jodie.local>
Date: Thu, 11 May 2000 21:00:21 +0300 (IDT)
To: Patrick Higgins <phiggins@transzap.com>
Subject: Initrd?
In-Reply-To: <Pine.LNX.4.21.0005101335290.1556-100000@phiggins.transzap.com>
References: <Pine.LNX.4.21.0005101335290.1556-100000@phiggins.transzap.com>
Reply-To: Dvir Oren <dviro@lucidvon.com>
CC: mtd@infradead.org
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Patrick Higgins writes ("Initrd?"):
> linking the driver?  Would the bootloader require special knowledge of

You'll most likely need to use a modified LILO, so that it will be able
to read the kernel from the flash.  After reading the kernel, I don't
think there will be any problems.

The modified LILO has been published on this list, and is also
part of M-Systems' drivers (though their version is a libc5 lilo v20).

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
