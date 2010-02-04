Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nd5by-0003Vt-Ff
	for linux-mtd@lists.infradead.org; Thu, 04 Feb 2010 17:35:32 +0000
Subject: Re: Emulated write failures cause block marking as bad
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Skuczynski <mareksk7@gmail.com>
In-Reply-To: <a328840c1002040902ic5c17a8p5262e482b4fced01@mail.gmail.com>
References: <a328840c1002040902ic5c17a8p5262e482b4fced01@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 04 Feb 2010 19:33:14 +0200
Message-ID: <1265304794.7343.135.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2010-02-04 at 18:02 +0100, Marek Skuczynski wrote:
> Hello,
>    Today, I was trying to use debug option MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES.
>    What I have found is that occasionally,  the emulated write error
> happens while
>    executing sync_erase() function. In result of this, the part that
> is calling sync_erase()
>    mark the block as bad (see log below).
>    After a few minutes I had many bad blocks.

This is true.

>  Using this option to
> volume update test
>    makes no sense.

This is too strong statement. It does make sens - you verify that the
error handling functionality works.

You can say that this option is not good enough for you, this will be
more fair statement.

>    I am using kernel 2.6.23 with updated UBI  from 2.6.29.
>    Have you experienced this problem already ? if so, is this has been fixed ?

Yes, I saw it. This is purely a debugging feature, and it was enough for
me.

You can easilly develop it a bit more, and make it stop returning erase
errors when the amount of bad eraseblocks has reached some level.

Just amend ubi_dbg_is_erase_failure()

You might want to do the same for 'ubi_dbg_is_write_failure()', for the
same reasons, basically.

HTH.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
