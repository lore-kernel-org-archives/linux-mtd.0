Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lcGR-0005Ct-00
	for mtd-list@infradead.org; Tue, 17 Oct 2000 20:19:07 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13lcGQ-0005Cn-00
	for mtd@infradead.org; Tue, 17 Oct 2000 20:19:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13lbrw-0001b4-00@mokona.furryterror.org> 
References: <E13lbrw-0001b4-00@mokona.furryterror.org> 
To: Amy Fong <afong@furryterror.org>
Cc: mtd@infradead.org
Subject: Re: typo in sbc_mediagx.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Oct 2000 20:19:27 +0100
Message-ID: <14375.971810367@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Committed, thanks. I didn't bother with the version check - !CURRENT ought 
to still work in 2.4.

I've amended the 2.2.16 patch, and just deleted the 2.4 patches - there's 
no point in them now that MTD is in Linus' tree.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
