Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKETS-0003dB-7a
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 07:17:47 -0400
Message-ID: <4176493A.5080003@yandex.ru>
Date: Wed, 20 Oct 2004 15:17:14 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4176449B.4090706@yandex.ru>
	<1098270013.3872.83.camel@baythorne.infradead.org>
In-Reply-To: <1098270013.3872.83.camel@baythorne.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 4K block size question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> By writing nodes which don't cover a full 4KiB and hence aren't
> pristine.
Thanks.

By the way, what do you (and other JFFS2 folks) think about very big 
nodes of size = block size? I'm going to create such a big inode 
checkpoints. Is it OK? Are there some reasons not to do so and split 
them into several smaller nodes?

Thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
