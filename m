Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ov2Sx-0003ps-Kq
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 06:24:36 +0000
Received: by fxm12 with SMTP id 12so3720734fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 23:24:34 -0700 (PDT)
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <AANLkTinkp3O9uFhumuuBTq4T+Um9MSjFv3nb_byF0Q35@mail.gmail.com>
References: <1284263480-31573-1-git-send-email-vapier@gentoo.org>
	<1284308851.1783.23.camel@brekeke>
	<AANLkTinkp3O9uFhumuuBTq4T+Um9MSjFv3nb_byF0Q35@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 13 Sep 2010 09:23:10 +0300
Message-ID: <1284358990.27765.154.camel@localhost>
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

On Sun, 2010-09-12 at 15:05 -0400, Mike Frysinger wrote:
> On Sun, Sep 12, 2010 at 12:27, Artem Bityutskiy wrote:
> > On Sat, 2010-09-11 at 23:51 -0400, Mike Frysinger wrote:
> >> Sometimes dumping bad blocks is useful, like when the block isn't actually
> >> bad but the OOB layout isn't what the kernel is expecting or is otherwise
> >> screwed up.  The --nobad option allows just that.
> >
> > How useful is this? I think instead you should implement the force flag
> > we discussed and deal with 'otherwise screwed up' eraseblocks with
> > flash_erase. I am afraid it is too dangerous to introduce this option.
> 
> i dont see how this is any more dangerous than adding an option to
> force erasing of bad blocks ?  why should we be over protective of the
> system ?

Because it was like this for long time and people are accustomed to the
fact that if a block is marked as bad, nothing will happen to it.

Besides, if I misuse options and lose a really bad block, it is very
difficult to find it again.

>   this is what got is into the existing rut of unrecoverable
> blocks.

> 
> i find it useful during development to write out the content of pages
> irregardless of the bad blocks and then read them back.

But if a block is marked as bad, the current contents of it is not
necessarily 0xFFs and it does not necessarily ready to be written. You
have to first erase it.

So my point was - please, first provide the means to erase them.

>   and for
> recovering systems manually without having to resort to local access
> to the bootloader.
> -mike

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
