Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13WIuz-0000lg-00
	for mtd-list@infradead.org; Tue, 05 Sep 2000 14:37:41 +0100
Received: from cvsftp.cotw.com ([208.242.241.39] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13WIux-0000la-00
	for mtd@infradead.org; Tue, 05 Sep 2000 14:37:39 +0100
Received: from cotw.com (laptop1.ptec.com [192.168.10.10])
	by cvsftp.cotw.com (8.9.3/8.9.3) with ESMTP id IAA12121
	for <mtd@infradead.org>; Tue, 5 Sep 2000 08:37:57 -0500
Message-ID: <39B4F959.EA4AFEBD@cotw.com>
Date: Tue, 05 Sep 2000 08:47:05 -0500
From: "Steven J. Hill" <sjhill@cotw.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Naming of functions in 'mtdcore.c'
References: <21668.968158401@passion.cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

For the 'register_mtd_user' and 'unregister_mtd_user' functions
would renaming them to something like 'add_mtd_notify_callbacks'
and 'del_mtd_notify_callbacks' be more understandable? At a
first read it would to me. Comments?

-Steve

-- 
 Steven J. Hill - Embedded SW Engineer
 Public Key: 'finger sjhill@mail.cotw.com'
 FPR1: E124 6E1C AF8E 7802 A815
 FPR2: 7D72 829C 3386 4C4A E17D


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
