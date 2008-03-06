Received: from wa-out-1112.google.com ([209.85.146.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXGs0-0005I9-Em
	for linux-mtd@lists.infradead.org; Thu, 06 Mar 2008 14:14:52 +0000
Received: by wa-out-1112.google.com with SMTP id v33so2165847wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Mar 2008 06:14:51 -0800 (PST)
Message-ID: <bae050c10803060614x5a81a065ldbfacb33edf04b7@mail.gmail.com>
Date: Thu, 6 Mar 2008 22:14:51 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: UBI: question about ubi_leb_change
In-Reply-To: <1204811457.23706.49.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10803060426l2b90f9e2n4a0cd3e0dd1c4d19@mail.gmail.com>
	<1204807835.23706.38.camel@sauron>
	<bae050c10803060539y16c65e26o181ef7b26ce008cf@mail.gmail.com>
	<1204811457.23706.49.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> But UBI in now way can help you to solve this problem. How could it?
> Invent an interface which would help.
>
> The only way to go is to teach the FS which sits on top of you to inform
> you about all blocks which become free when something is deleted. But
> the existing FSes do not do this. An yes, this means you'll move garbage
> all over the place, which is slow.
>
> This is why we started UBIFS instead of doing FTL - because we assumed a
> native FS should be significantly more efficient then FTL.

But Windows do not recognize UBIFS.  I have to support VFAT to work on
UBI, how can I do? Guess I have nothing to do but suffer the slow
time. Now I just want to save a little time, do not
read the whole old mapped LEB back, but only necessary pages.  The
VFAT partitions usuallly use for storing  media data (mp3, mp4, avi
....). Only the filesystem meta-data stored area has much chance to be
little change.

So I needs some functions which I discribe before.  I met some problem
when I created them.
Maybe one more day will be fix,  or still can't, if it last too long
time still can't fix, hope I can get some help from you if you are
free.

Thank you :-)

---
Best wishes,
Nancy
