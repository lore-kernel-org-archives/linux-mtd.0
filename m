Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCIx4-00077A-7B
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 10:27:41 -0400
Message-ID: <41597498.7090704@yandex.ru>
Date: Tue, 28 Sep 2004 18:26:32 +0400
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
In-Reply-To: <1096380254.30942.77.camel@hades.cambridge.redhat.com>
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

David Woodhouse wrote:
> On Tue, 2004-09-28 at 17:57 +0400, Artem B. Bityuckiy wrote:
> 
>>Sorry, I don't understand. Suppose, after unclean reboot the bad last 
>>node appears. Before any write, this last node will be detected *before 
>>write* since the iget() will be called before it. Is it?
> 
> 
> True, but it won't necessarily be _deleted_ so it could still be there
> on the _next_ boot.
Yes, you are right. But we may handle this situation. Suppose we've 
found that the last node is bad. In this can we write new node 
containing the same data area (the area range is known since the header 
CRC is good). Thus, that last bad node will be obsoleted and the new 
last node will be good. If there are will be new unclean reboot, we will 
have two bad nodes at the end.
Only after obsoleting last bad node we allow new writes.

What do you think now? :-)

> 
> You have to make the read/write code capable of dealing with the fact
> that the full rbtree hasn't been built. Possibly you sort through the
> raw nodes and put them into _pools_, each covering something like a
> 256KiB of the file. Then when you get a read or write of any such range,
> you check the CRCs for the nodes in that _range_ and build the full map
> only for that range of the file. It sounds painful, to be honest -- I'd
> rather just tell people not to use such large files on JFFS2 -- split it
> up into multiple files instead.
> 

I'm really going to do such the optimization and your idea is 
complicated enough. I'd like to find easier solution and don't introduce 
additional complicated things to the already complicated file system :-) 
Ok, I'll think on this problem.

For now, the Idea with checking only the last node seems to me better. 
But I didn't think enough about it yet.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
