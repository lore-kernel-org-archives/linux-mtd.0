Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKbb3-0006ks-9O
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 07:59:10 -0400
Message-ID: <4177A468.2030605@yandex.ru>
Date: Thu, 21 Oct 2004 15:58:32 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <4176449B.4090706@yandex.ru>	
	<1098270013.3872.83.camel@baythorne.infradead.org>	
	<4176493A.5080003@yandex.ru>
	<1098271310.3872.87.camel@baythorne.infradead.org>
In-Reply-To: <1098271310.3872.87.camel@baythorne.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: 4K block size question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

In the JFFS2, there is place where both c->erase_completion and 
c->inocache spinlocks are held. But the c->erase_completion is locked 
first. This fact does not highlighted in the README.Locking file.

I propose to metnion it there. (i.e., that if both locks are needed, the 
c->erase_completion must be locked first).


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
