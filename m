Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKF89-0004FQ-T0
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 07:59:52 -0400
Message-ID: <41765314.2000103@yandex.ru>
Date: Wed, 20 Oct 2004 15:59:16 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4176449B.4090706@yandex.ru>	
	<1098270013.3872.83.camel@baythorne.infradead.org>	
	<4176493A.5080003@yandex.ru>
	<1098271310.3872.87.camel@baythorne.infradead.org>
In-Reply-To: <1098271310.3872.87.camel@baythorne.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 4K block size question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok, thanks for answer.

> Other than the fact that it doesn't pack well, not really.
Hmm, I don't cleanly understand what do you mean. I suspect you mean 
that requesting the whole block from the jffs2_reserve_space() is bad 
idea - I agree, I am not going to do so.

Or you mean that small chunks of data are compressed better than big 
ones? If so, can you pleas explain why?

> If they're that large are they _really_ an effective use of space? 
Of course, I gonna request small piece of space (small minsize parameter 
of the jffs2_reserve_space()). But, if the jffs2_reserve_space() 
allocates the whole block, I think it is OK to write one big node.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
