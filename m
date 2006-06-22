Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FtIYk-0002S7-7P
	for linux-mtd@lists.infradead.org; Thu, 22 Jun 2006 02:21:02 -0400
Subject: Re: Current mtd tree is broken
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0606211535y2b85e229ubd235b3849c2013e@mail.gmail.com>
References: <625fc13d0606211535y2b85e229ubd235b3849c2013e@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 22 Jun 2006 10:20:22 +0400
Message-Id: <1150957222.4244.5.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-06-21 at 17:35 -0500, Josh Boyer wrote:
> 1) Remove the BUG call and allow writesize == 0 to be valid.  This is
> what was originally done and I didn't see a problem with that.

May panto just point which chips are broken? The fix must be trivial in
most cases.

> 2) Fix the remaining drivers to set writesize to something other than 0.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
