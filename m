Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lYjn-0003ru-00
	for mtd-list@infradead.org; Tue, 17 Oct 2000 16:33:11 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13lYjm-0003rl-00
	for mtd@infradead.org; Tue, 17 Oct 2000 16:33:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13lYfi-0006hw-00@mokona.furryterror.org> 
References: <E13lYfi-0006hw-00@mokona.furryterror.org> 
To: Amy Fong <afong@furryterror.org>
Cc: mtd@infradead.org
Subject: Re: typo in sbc_mediagx.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Oct 2000 16:31:49 +0100
Message-ID: <21339.971796709@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


afong@furryterror.org said:
>  Uh yeah. You're using the QUEUE_EMPTY macro which doesn't really
> exist in 2.2 or at least exists as 

Hmmm. It doesn't work in 2.4 either. But I've illustrated how I think it 
can be done with a kernel thread. If anyone disagrees with me sufficiently, 
I'm quite happy to be proved wrong, as long as the proof is under GPL.

Of course, if you agree with my method in spite of my implementation, 
you're welcome to fix that too :)


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
