Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX83P-000468-2q
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 11:49:32 +0000
Message-ID: <1396871016.17040.33.camel@sauron.fi.intel.com>
Subject: Re: ubifs: assertion fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Mon, 07 Apr 2014 14:43:36 +0300
In-Reply-To: <533A5407.4060900@codeaurora.org>
References: <f08bbebef039d5bb28c2fcd3022165b0.squirrel@www.codeaurora.org>
 <1396260879.9016.70.camel@sauron.fi.intel.com>
 <533A5407.4060900@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Dolev Raviv <draviv@codeaurora.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-01 at 08:52 +0300, Tanya Brokhman wrote:
> The log isn't flooded with the above mentioned error, but it does repeat 
> several times.

Even though you do a lot of I/O operations?

If the accounting becomes incorrect, I think you'd see a warning for
each and every I/O operations.

Also, do you have several UBIFS file-systems mounted?

> Is there any way we can help in debugging and fixing this? Also, we're 
> running on a 3.10 based kernel and I saw a lot of patches that change 
> the shrinker after 3.10 on linux-next. What kernel version did you see 
> the shrinker errors on?

Well, you just need to stress the shrinker. I did it by simply adding a
hack to ubifs module init which kmalloc()'ed a lot of memory. Not
too-much, but enough to cause some pressure when doing a lot of I/O
operations and get UBIFS shrinker be invoked. This took me some amount
of time to get a good hack. I use a normal PC with some Fedora, and
nandsime. This makes it a lot easier to debug, comparing with doing this
on a real target. After all, shrinker is a generic component. I think
that PC had 4GB of RAM. I do not remember how much I allocated in my
hack.

I think I used older version than 3.10 back then.

-- 
Best Regards,
Artem Bityutskiy
