Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vdmM-0004Mr-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 09:52:58 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vdmL-0004Ml-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 09:52:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <B17893052A17D211A9860060978F7E63014A013C@mail.msys.co.il> 
References: <B17893052A17D211A9860060978F7E63014A013C@mail.msys.co.il> 
To: Oron Ogdan <Orono@m-sys.com>
Cc: MTD list <mtd@imladris.mvhi.com>, Stephen Tweedie <sct@redhat.com>
Subject: Re: Power Down 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 08 Dec 1999 09:54:12 +0000
Message-Id: <E11vdnY-0002hW-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Orono@m-sys.com said:
> The only way to be resistant to power failures in the file system
> level  is to use a log-structured file system.

> I heard ext3 is log-structured but I am sure one of the Linux guys here
> knows more about this, 

ext3 is a journalling filesystem. I believe that it's not log-structured. 

Journalling is sufficient for protection from power failures. Stephen, 
would you care to elaborate on the difference?

> Any other file system  that takes power failures into account, (I am afraid 
> to guess NFTL ????).

I believe that NTFS is also journalling but not log-structured.

> Some of our customers use their own home brewed LFSs and do it successfully. 

Personally, I'm inclined to believe that we should run a filesystem directly 
on the flash device - rather than faking a block device and running a 'normal' 
filesystem on top of that. 

I've been rushed off my feet here with other things for a while, but as soon as
I get back to it, after I've fixed the NFTL and DiskOnChip Millennium support,
that's what I'm intending to look at.

If you're running ext2 on a DiskOnChip you should mount it with the noatime 
option if you can - this will eliminate a lot of write activity.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
