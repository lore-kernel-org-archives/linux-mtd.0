Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11wNTP-0006ys-00
	for mtd-list@infradead.org; Fri, 10 Dec 1999 10:40:27 +0000
Received: from dukat.scot.redhat.com ([195.89.149.246] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11wNTN-0006ym-00
	for mtd@imladris.mvhi.com; Fri, 10 Dec 1999 10:40:25 +0000
From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14416.55529.249995.920763@dukat.scot.redhat.com>
Date: Fri, 10 Dec 1999 10:41:45 +0000 (GMT)
To: David Woodhouse <dwmw2@infradead.org>
Cc: Oron Ogdan <Orono@m-sys.com>, MTD list <mtd@imladris.mvhi.com>,
        Stephen Tweedie <sct@redhat.com>
Subject: Re: Power Down 
In-Reply-To: <E11vdnY-0002hW-00@devel2.axiom.internal>
References: <B17893052A17D211A9860060978F7E63014A013C@mail.msys.co.il>
	<E11vdnY-0002hW-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi,

On Wed, 08 Dec 1999 09:54:12 +0000, David Woodhouse
<dwmw2@infradead.org> said:

> Orono@m-sys.com said:
>> The only way to be resistant to power failures in the file system
>> level  is to use a log-structured file system.

>> I heard ext3 is log-structured but I am sure one of the Linux guys here
>> knows more about this, 

> ext3 is a journalling filesystem. I believe that it's not log-structured. 

Correct.

> Journalling is sufficient for protection from power failures. Stephen, 
> would you care to elaborate on the difference?

Log-structured disks are, oddly enough, structured as a log!  The
entire data layout is in the form of a conceptually infinite log.  All
disk writes are performed at the head of the log, so writes are
necessarily sequential.  The write performance, as a result, is
unmatched.  The read performance can sometimes suffer, but these
filesystems are intended for use with huge amounts of cache, so that
the write performance is more important: most reads are from cache.

A journaled filesystem has a log *in addition to* the normal disk
structure.  The log is used for recovery after a crash but does not
store any long-term persistent data for the filesystem.

> I believe that NTFS is also journalling but not log-structured.

Indeed.

Cheers,
 Stephen


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
