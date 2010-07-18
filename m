Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaPS7-0000Od-Up
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 08:42:28 +0000
Received: by fxm3 with SMTP id 3so1948569fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 18 Jul 2010 01:42:27 -0700 (PDT)
Subject: Re: Snapshot in UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: mob@certi.org.br
In-Reply-To: <4C3B8471.6020803@certi.org.br>
References: <4C3B8471.6020803@certi.org.br>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 11:42:23 +0300
Message-Id: <1279442543.16247.41.camel@localhost.localdomain>
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

On Mon, 2010-07-12 at 18:09 -0300, Moises Beck wrote:
> Hello,
>       I would like to know if is it possible to take a snapshot of an 
> UBIFS, so that you can come back in time if a system update crashes, for 
> example ?

No, it is not possible. Although the FS design allows adding this
feature, but this needs a lot of work. Indeed, UBIFS is one huge B-tree,
so the same approach as in btrfs can be used.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
