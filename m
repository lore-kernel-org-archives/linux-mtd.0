Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTV6Q-0006Jj-F2
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 08:24:03 +0000
Received: by fxm14 with SMTP id 14so3330777fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 01:23:59 -0700 (PDT)
Subject: Re: [PATCH 041/104] mtd: prepare to convert
	of_mtd_parse_partitions to partition parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <4DEC8C85.6090904@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
	<1307026293-8535-7-git-send-email-dbaryshkov@gmail.com>
	<1307347054.3135.28.camel@localhost>  <4DEC8C85.6090904@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 11:19:43 +0300
Message-ID: <1307348383.3135.41.camel@localhost>
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

On Mon, 2011-06-06 at 12:15 +0400, Dmitry Eremin-Solenikov wrote:
> Answering both of your questions here:
> My idea is to have an of node connected to mtd device, if there is
> any.

I just think the connection should be different. Probably the best would
be to have an OF-specific object (some struct of_info) containing struct
mtd_info inside, and then OF code can use container_of().

> It can be used by ofpart.c, ofoldpart.c (extract from physmap_of),
> maybe some other parsers/drivers/etc. 

I'm still not convinced we need ofoldpart.c - that is a small piece of
cade which can be put to ofpart.c.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
