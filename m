Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EISbe-0000ce-Fs
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 11:03:40 -0400
Message-ID: <4332C1C7.5090706@yandex.ru>
Date: Thu, 22 Sep 2005 18:37:59 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F11A5B6E921FA39088B715BE8970@phx.gbl>
In-Reply-To: <BAY17-F11A5B6E921FA39088B715BE8970@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Adding eraseblock header support(revised version)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
> Your comments for the revised patch are welcome :)

+               if ((!jeb->has_eraseblock_header && jeb->free_size !=
c->sector_size - c->cleanmarker_size) ||
+                   (jeb->has_eraseblock_header &&
c->eraseblock_header_size && jeb->free_size != c->sector_size -
jeb->first_node->__totlen) ||
+                   (jeb->has_eraseblock_header &&
!c->eraseblock_header_size && jeb->free_size != c->sector_size))
+               {

1. I would not use so looong lines. There is a 80 chars restriction. In
JFFS2 it is OK to use long lines for prints.

2. jeb->has_eraseblock_header - so looong name ... Why not to use
jeb->has_ebh ?


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
