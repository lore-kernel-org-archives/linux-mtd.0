Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgUJm-0000vE-1h
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 03:07:02 +0000
Received: by fxm3 with SMTP id 3so2690775fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Aug 2010 20:06:55 -0700 (PDT)
Subject: Re: question about drivers/mtd/ubi/cdev.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia@diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008032206060.20393@ask.diku.dk>
References: <Pine.LNX.4.64.1008032206060.20393@ask.diku.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Aug 2010 06:06:52 +0300
Message-Id: <1280891212.4363.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-03 at 22:12 +0200, Julia Lawall wrote:
> I was wondering about the following code in the function rename_volumes in 
> the file drivers/mtd/ubi/cdev.c:
> 
> list_for_each_entry(re, &rename_list, list) {
> 	...
>         if (no_remove_needed)
>                 continue;
> 	...
>         re = kzalloc(sizeof(struct ubi_rename_entry), GFP_KERNEL);
> 	if (!re) { ... }
>         re->remove = 1;
>         re->desc = desc;
>         list_add(&re->list, &rename_list);
> 	...
> }
> 
> Is there a danger of repeating computation since re is redefined and moved 
> back to the beginning of the list?

Hmm, the code is bogus, I do not know how it works, but it does, because
I tested it :-)

We should not use 're' as a temporary variable inside the loop. I guess
we can use 're1' instead. I'll change this later, when have time, unless
you submit a fix earlier :-)

Thanks for pointing this!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
