Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ElRXK-0004hq-Kf
	for linux-mtd@lists.infradead.org; Sun, 11 Dec 2005 08:46:51 -0500
Message-ID: <439C2DA3.9090405@yandex.ru>
Date: Sun, 11 Dec 2005 16:46:11 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
References: <439821F4.7010403@yandex.ru>
	<200512111128.34835.manningc2@actrix.gen.nz>
In-Reply-To: <200512111128.34835.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: NAND simulator
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning wrote:
> Yes please.
Uhh, will pospone this for now, will try to repair JFFS2 which doesn't 
work after the last month's commits. Crud! Not sure whom to blame so far.

> Can nandsim simulate storage larger than physical RAM (just swapping out) or 
> would this need special support (eg. add some block device support? We're 
> getting people in YAFFSland who are working with 8Gbytes of flash (and it 
> will only get bigger!) and I expect you'd want large emulations to stress 
> JFFS3. Being able to simulate areas up to, say, 16Gbytes for now would be a 
> nice thing.
Well, did not plan it. But we probably may add this functionality. We 
may borrow it from mtd2blk ...

> A way of simulating a failure (bit flip, write error) would also be handy for 
> testing fs and ecc error handling.
Yeah, good feature. But I'm not sure how to implement an interface for 
this. It is probably easier to hack nandsim and add this manually...

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
