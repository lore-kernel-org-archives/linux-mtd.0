Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13rSyf-0006zk-00
	for mtd-list@infradead.org; Thu, 02 Nov 2000 22:36:57 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13rSye-0006ze-00
	for mtd@infradead.org; Thu, 02 Nov 2000 22:36:56 +0000
Date: Thu, 2 Nov 2000 22:36:35 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Gregory Schallert <gschallert@dawning.com>
cc: mark.langsdorf@amd.com, mtd@infradead.org
Subject: Re: Problems with AMD CFI chips
In-Reply-To: <3A01BDA9.52756588@dawning.com>
Message-ID: <Pine.LNX.4.21.0011022235250.17678-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 2 Nov 2000, Gregory Schallert wrote:

> On an aside, how does jffs schedule the clean up and is this really CPU
> intensive?

While the conditions I quoted before are met, the jffs_gcd kernel thread
wakes up and does it in the background.

If the GC thread is ever killed by the user, or for some reason it's
been really slow and we've actually run out of free space, GC can also be
done from the user's context, to make room for a write to happen.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
