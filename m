Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CTdPG-0003r6-Aa
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 04:44:20 -0500
Message-ID: <41987A4F.6090400@oktetlabs.ru>
Date: Mon, 15 Nov 2004 12:43:43 +0300
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <41986D89.4060308@oktetlabs.ru>	
	<1100508552.8015.61.camel@localhost.localdomain>
	<1100510529.5074.119.camel@thomas>
In-Reply-To: <1100510529.5074.119.camel@thomas>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: NAND pages cache?
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> On Mon, 2004-11-15 at 08:49 +0000, David Woodhouse wrote:
> 
>>On Mon, 2004-11-15 at 11:49 +0300, Artem Bityuckiy wrote:
>>
>>>So, the obvious idea how to avoid this is to introduce something like 
>>>NAND pages cache. The cache will keep several NAND pages which were last 
>>>accessed.
>>>
>>>I don not know is it good to do this only in JFFS2 or on the MTD NAND layer?
>>
>>I thought we already did this in the MTD NAND layer, since we had to
>>read whole pages there to do ECC anyway. Thomas?
> 
> 
> We do caching only if a page is read partially. If we read a full page
> we read directly into the fs buffer.
> 
> The partial reads happen when we read nodes. The full page reads happen
> when we read data. That's sufficient and captures most of the double
> reads on the same page.
> 
> tglx
Hmm, It seems I do not know something about MTD. I thought it *always* 
reads whole
pages in orger to always check ECC... I'll see this more close.

Ok, thanks for comment.

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
