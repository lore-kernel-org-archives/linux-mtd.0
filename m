Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12v3ad-0003Vq-00
	for mtd-list@infradead.org; Thu, 25 May 2000 20:46:43 +0100
Received: from mbunix.mitre.org ([129.83.20.100] helo=smtpproxy1.mitre.org)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12v3ab-0003Vk-00
	for mtd@infradead.org; Thu, 25 May 2000 20:46:42 +0100
Received: from avsrv1.mitre.org (avsrv1.mitre.org [129.83.20.58])
	by smtpproxy1.mitre.org (8.9.3/8.9.3) with ESMTP id PAA17807
	for <mtd@infradead.org>; Thu, 25 May 2000 15:46:35 -0400 (EDT)
Received: from mailsrv1.mitre.org (mailsrv1.mitre.org [129.83.20.6])
	by smtpsrv1.mitre.org (8.9.3/8.9.3) with ESMTP id PAA29069
	for <mtd@infradead.org>; Thu, 25 May 2000 15:45:39 -0400 (EDT)
Message-ID: <392D83C9.BF8341D2@mitre.org>
Date: Thu, 25 May 2000 15:49:29 -0400
From: "Mr. Oogie Boogie" <rpreston@mitre.org>
MIME-Version: 1.0
To: mtd@infradead.org
CC: dviro@lucidvon.com, phiggins@transzap.com
Subject: Re: Patched LILO problems
References: <Pine.LNX.4.21.0005241545550.16970-100000@phiggins.transzap.com> <14636.60670.580939.911318@jodie.lucid>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Dvir Oren wrote:
> 
> Patrick Higgins writes ("Patched LILO problems"):
> 
> > I'm using the binary patched LILO from mtd/patches/lilo-mtd.tar.gz, and it
> > doesn't seem to pass the correct command line to kernel.  The parameters I
> 
> Yes.  I noticed that the patched LILO does not in fact pass parameters
> (well, the only ones I used were root=) to the kernel.  For my purposes,
> I just rdev each kernel.
> 
> Perhaps it would be a good idea to go over the patches and see if it
> destroys something.

I had this problem as well.  This was a few months ago so my memory is
a little fuzzy.  The patch I used I downloaded from M-systems.  I
mucked around with it to try and find why the command line got mangled
and discovered that it passes the command line correctly when I booted
from a hard drive (the hd was a mirror image of the DoC) or from a
floppy with the DoC as root, so I'm pretty sure it is not the patch.

I gave up in frustration and hard coded the command line I wanted into
the kernel.  I'd like a better solution, so if you find one please let
me know.

-- 
Ralph A. Preston
The MITRE Corporation
202 Burlington Road, MS E015
Bedford, MA 01730-1420
Work: 781-271-7914  Fax: 781-271-8875  Cell: 617-257-2695


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
