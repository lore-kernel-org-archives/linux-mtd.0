Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCIVE-0006lz-C6
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 09:58:52 -0400
Message-ID: <41596DDC.3000506@yandex.ru>
Date: Tue, 28 Sep 2004 17:57:48 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <41595913.4040007@yandex.ru>	
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>	
	<41596471.5020108@yandex.ru>	
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>	
	<41596913.6080207@yandex.ru>
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096379132.30942.66.camel@hades.cambridge.redhat.com>
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
> On Tue, 2004-09-28 at 17:37 +0400, Artem B. Bityuckiy wrote:
> 
>>If this isn't last node, the reason is media errors. 
> 
> 
> No. What about an unclean reboot followed by more valid writes? You end
> up with the broken node in the middle.
Sorry, I don't understand. Suppose, after unclean reboot the bad last 
node appears. Before any write, this last node will be detected *before 
write* since the iget() will be called before it. Is it?

> The GC already doesn't delete _anything_ until all inodes have been
> checked. In fact I suppose it _could_ proceed, checking each inode only
> as and when it encounters a node belonging to that inode... but that
> would generally screw up the accounting totals and make my head hurt so
> it wasn't done that way.
>
Hm, yes.

Ok, anyway, there are possibilities to improve the iget().

What do you think the best way to do such change (no check on iget()) ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
