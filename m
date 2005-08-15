Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4iL0-0000ll-V7
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 13:01:33 -0400
Message-ID: <4300CA41.60706@yandex.ru>
Date: Mon, 15 Aug 2005 21:00:49 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Ryan B. Lynch" <rlynch@bway.net>
References: <4300BEE2.4020104@bway.net> <4300C922.402@bway.net>
In-Reply-To: <4300C922.402@bway.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: possible bug in "--pad" option for mkfs.jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ryan B. Lynch wrote:
> I did a little more testing with this, and the "--pad" option doesn't
> work AT ALL on my installation.  Something is definitely wrong, here.
> 
> I compiled JFFS2 from source, using a CVS snapshot from 2005/08/14, with
> the "jffs2-summary-20050811-v2.patch" applied.
> 
> Can anyone confirm this?

Dunno, never used this option (what for?). Glance at utils/mkfs.jffs2.c. :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
