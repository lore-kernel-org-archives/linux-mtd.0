Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13cW3R-0007xE-00
	for mtd-list@infradead.org; Fri, 22 Sep 2000 17:52:05 +0100
Received: from tele2-gw.tao-group.com ([212.19.67.123] helo=gate.tao-group.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13cW3P-0007x8-00
	for mtd@infradead.org; Fri, 22 Sep 2000 17:52:04 +0100
Received: from pearl.tao.co.uk (pearl.tao.co.uk [172.16.100.66])
	by gate.tao-group.com (8.9.3/8.9.3) with ESMTP id RAA14723
	for <mtd@infradead.org>; Fri, 22 Sep 2000 17:52:02 +0100
To: mtd@infradead.org
From: "David Given" <dg@tao-group.com>
Subject: Re: Changes to Config.in, mtdchar.c & mtdcore.c
In-reply-to: Your message of "Fri, 22 Sep 2000 17:47:45 +0200."
             <003201c024ac$73198100$0800a8c0@win95.inteloop.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 Sep 2000 17:52:01 +0100
Message-Id: <E13cW3N-0007q4-00@pearl.tao.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

[...]
> static struct file_operations mtd_fops =3D {
>-	owner:		THIS_MODULE,
>+	/*Whats this? owner:		THIS_MODULE,*/
> 	llseek:		mtd_lseek,     	/* lseek */
> 	read:		mtd_read,	/* read */
> 	write: 		mtd_write, 	/* write */

Don't know, but all the devfs stuff used it so I put it in. It must be a =

2.3ism and is probably worth putting in #ifdefs.

-- =

David Given
dg@tao-group.com




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
