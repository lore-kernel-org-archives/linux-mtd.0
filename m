Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CTdNd-0003YT-7R
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 04:42:42 -0500
Message-ID: <419879CB.3010209@yandex.ru>
Date: Mon, 15 Nov 2004 12:41:31 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4198686D.8000301@yandex.ru>
	<1100508326.8015.57.camel@localhost.localdomain>
In-Reply-To: <1100508326.8015.57.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: BUG in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



David Woodhouse wrote:
> On Mon, 2004-11-15 at 11:27 +0300, Artem B. Bityuckiy wrote:
> 
>>Hello,
>>
>>I've hit on bug in JFFS2, but I can not reproduce it easilly yet. I have 
>>  stess test which in general creates files, deletes them, creates 
>>directories and deletes them, and so on so on. When I run this test 
>>nightly, I see the following error when I come at work in the morning:
>>
>>kernel BUG at 
>>/tester/linux/linux-2.6.8-1.521up-custom-nopreempt/fs/jffs2/gc.c:1164!
> 
> 
> In my copy of v1.137 there's three instances of BUG_ON() around there,
> but none at line 1164. They're at lines 116[123]. 
I have the lastest MTD snapshot, v1.140. This is BUG_ON(end > 
JFFS2_F_I_SIZE(f));

> 
> Start by changing it from a simple BUG_ON() to a printk saying precisely
> what went wrong and giving all the other information which might be
> relevant. If you can just trap into a debugger when it happens, that's
> even better.
I'll do this as soos as I have done other pending JFFS2 tasks :-) I 
think I'll insert useful printkeyss there since now I have no configured 
environment to use debugger.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
