Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EggBe-0000cV-CB
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 05:24:46 -0500
Message-ID: <438ADACA.3090102@yandex.ru>
Date: Mon, 28 Nov 2005 13:24:10 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "zhao, forrest" <forrest.zhao@intel.com>
References: <8126E4F969BA254AB43EA03C59F44E840C3738@pdsmsx404>	
	<4386FC5F.9050305@yandex.ru>
	<1133144458.3156.15.camel@localhost.localdomain>
In-Reply-To: <1133144458.3156.15.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: The problem that I didn't think out
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao, forrest wrote:
> I think keeping track of a list of 10 most worn out eraseblocks
> is hard to be O(1) since this list is changed dynamically.
> In particular, we need to recalculate the list after every update
> operation; in order to recalculate the list we need to keep the usage
> information of all erase blocks in RAM in sorted manner. So if this is
> the case, the RAM occupation is O(N).
> 
Hmm, I meant the following.

1. How to choose an eraseblock to garbage collect.

We split all the eraseblocks onto several (virtual) groups, N 
eraseblocks in each. For example, 30 eraseblocks in each group: 0-29. 
30-59, ... One of the groups is "current".

Suppose we have mounted JFFS3. Assign group 0 to be "current". GC asks 
us to choose an eraseblock to GC. We search for the "best" candidate 
only in the current group. And GC it. During search we also find out M 
"best" candidates. Then switch the current group to the next. Next time 
we'll search in the next group. We'll correct our "best" list. Etc.

Something like this. Not, this wont give us absolutely best candidates. 
But still.

The description is just an idea, don't take it as a serious description.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
