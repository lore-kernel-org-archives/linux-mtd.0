Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCJRo-0007w1-8l
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 10:59:25 -0400
Message-ID: <41597C0B.7040607@yandex.ru>
Date: Tue, 28 Sep 2004 18:58:19 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <41595913.4040007@yandex.ru>	
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>	
	<41596471.5020108@yandex.ru>	
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>	
	<41596913.6080207@yandex.ru>	
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>	
	<41596DDC.3000506@yandex.ru>	
	<1096380254.30942.77.camel@hades.cambridge.redhat.com>	
	<41597498.7090704@yandex.ru>
	<1096382241.30942.81.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096382241.30942.81.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 an nodes checking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> It doesn't work unless you _know_ that the last time the fs was mounted
> it was with this new code instead of with the old code which _doesn't_
> do that. Unless you call it JFFS3 it doesn't seem like the answer :)
>
Hmm, you mean that I'll lost the backward compatibility in case of 
unclean reboot. Yes, you are right. Thanks.

But... from the another hand, this is only in case of unclean reboots... 
Moreover, we may do this only for _big files_ ...

What would you say if somebody offer you a patch with such optimization 
? Would you reject it? Or you would accept it and rename JFFS2 to JFFS3 
:-) ?

> The file system is simple -- in fact it's _trivial_. Only the
> optimisations are complex. It's a bit like chess. :)
:-)
Hmm, yes. I meant JFFS2 as whole, with all its optimizations.

Anyway, the complex solution with partial fragtrees is the potential 
source of new bugs, etc.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
