Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1480BR-0003kv-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 13:18:29 +0000
Received: from [195.224.55.237] (helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1480BQ-0003kp-00
	for mtd@infradead.org; Mon, 18 Dec 2000 13:18:29 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <52AF3CB987C7D41183CD0090271F67C3184D@m4eng.m4data.co.uk> 
References: <52AF3CB987C7D41183CD0090271F67C3184D@m4eng.m4data.co.uk> 
To: Simon Munton <Simon.Munton@m4data.co.uk>
Cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: JFFS: deleted files still appear in directory 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Dec 2000 13:17:33 +0000
Message-ID: <25546.977145453@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Simon.Munton@m4data.co.uk said:
> Yep, that fixed it. I'll try and break something else now. 

Yeah - you're definitely slacking if you're finding bugs I've already fixed 
:)

Concentrate on bugs centred around unlink(). There's probably something we 
haven't considered yet.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
