Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSwX4-00061H-09
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2004 06:57:31 -0500
Message-ID: <4195F689.9070705@yandex.ru>
Date: Sat, 13 Nov 2004 14:56:57 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4195EF83.8050104@yandex.ru>
	<1100345900.8015.17.camel@localhost.localdomain>
In-Reply-To: <1100345900.8015.17.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 prints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



David Woodhouse wrote:
> On Sat, 2004-11-13 at 14:26 +0300, Artem B. Bityuckiy wrote:
> 
>>But the main thing why I think it would be nice to introduce macros like 
>>these is that the messages will be a bit standard. I mean that all 
>>errors will have the same prefix. It is useful when you develop JFFS2 
>>with debugging output on. In this case you will just s/JFFS2 Error and 
>>see all the error messages. But currently, it is hard to find all the 
>>error messages in JFFS2 because some of them use prefix "Error", some 
>>just contain the word "failed", etc.
> 
> 
> I'm not sure that just a standard prefix will really help with
> debugging. The trick is still to know what's important, and what's
> noise. And running it with full debugging is slow enough already over a
> 115200 baud serial line, without adding more stuff to each line :)
I'm debugging JFFS2 on the P4 host with the Flash simulator, so I do not 
restricted by the serial line speed. May be somebody use USB which is 
also faster.

The situation is that I have *lots* of debugging output and want to see 
all warnings/errors. May be not only I :-) Yes, some of the output is 
unneeded and too noisy, but many is very useful.

Moreover, we will not need to write the name of function in the 
debugging printk. I mean

D1(printk(KERN_DEBUG "some_long_function_name(): some important message"));

We will use shorter calls like
JFFS2DMSG(1, "some important message");

> 
> I'd much rather see an effort to weed out the unnecessary prints at
> debug level 1, moving them to level 2. I don't consider level 2 to be
> particularly useful in general; it's _too_ verbose. 
> 
Yes, I've mentioned this and I switch off the lists content output when 
developing JFFS2. I think these messages should be moved to the level 2.


So, do you think we should not introduce such output macros?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
