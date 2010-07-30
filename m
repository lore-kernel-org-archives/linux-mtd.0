Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OeihR-0003FK-8x
	for linux-mtd@lists.infradead.org; Fri, 30 Jul 2010 06:04:05 +0000
Received: by eyd10 with SMTP id 10so570646eyd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Jul 2010 23:04:04 -0700 (PDT)
Subject: Re: [PATCH v4] mtd-utils: clean up compile warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <316b2205ef90aed27bc9bf7b3a5701f0@localhost>
References: <316b2205ef90aed27bc9bf7b3a5701f0@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Jul 2010 09:04:01 +0300
Message-Id: <1280469841.2838.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-07-26 at 11:37 -0700, Kevin Cernekee wrote:
> gcc 4.4.3 on x86_64:
> 
> libcrc32.c:42: warning: static is not at beginning of declaration
> 
> libfec.c:120: warning: initialization discards qualifiers from pointer target type
> libfec.c:121: warning: initialization discards qualifiers from pointer target type
> 
> libfec.c:417: warning: passing argument 2 of my_malloc discards qualifiers from pointer target type
> 
> recv_image.c:164: warning: comparison of unsigned expression < 0 is always false
> recv_image.c:170: warning: format %d expects type int, but argument 3 has type size_t
> recv_image.c:170: warning: format %d expects type int, but argument 4 has type long unsigned int
> 
> And many more along the same lines.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Pushed, thanks.
 
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
