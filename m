Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZlTM-0002T7-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 03:11:12 +0100
Received: from [210.111.77.112] (helo=mutech.co.kr ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZlT9-0002T1-00
	for mtd@infradead.org; Tue, 28 Mar 2000 03:11:05 +0100
Received: from kwonsk.mutech.private ([192.168.1.3]) by mutech.co.kr (8.7.5/8.7.3) with SMTP id LAA13552 for <mtd@infradead.org>; Tue, 28 Mar 2000 11:11:52 +0900
Message-ID: <007e01bf985b$0c2ec1e0$0301a8c0@kwonsk.mutech.private>
From: "±Ç¼®±Ù" <kwonsk@mutech.co.kr>
To: <mtd@infradead.org>
Subject: Re: Axis log based flash file system
Date: Tue, 28 Mar 2000 11:12:10 +0900
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi, all
In my thought, JFFS work of Axis was good for frequent log/delete
applications
like network printer or image server for web cam. But not good for general
file system.
Because, in JFFS, wear-leveling is only meaningful when old file is deleted
and
new file is created frequently (just like printer server).  maybe that's why
they called it implicite.
(wear leveling could be occur but not sure.)
In situation where 80% of flash is steady (kernel + basic utils nerver
deleted) then only 20 % of
flash could be used in rotation. And if 20 % of flash could be fragmented
stopping rotation.  Maybe my understanding about JFFS (i just followd full
source
once)  would be poor. and I need more notes from axis people.
Thansk.





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
