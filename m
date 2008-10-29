Received: from 81-7-68-229.static.zebra.lt ([81.7.68.229] helo=teltonika.lt)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kv5zS-00043i-8C
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 08:01:19 +0000
Message-ID: <49081849.6040509@teltonika.lt>
Date: Wed, 29 Oct 2008 10:01:13 +0200
From: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
MIME-Version: 1.0
To: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: [PATCH} : Fix compilation warnings in fs/jffs2/nodemgmt.c
References: <ea11fea30810270630x2740ceb3m58df4d0093a86fee@mail.gmail.com>
In-Reply-To: <ea11fea30810270630x2740ceb3m58df4d0093a86fee@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Manish Katiyar wrote:
> Below patch fixes the following compilation warnings :
> fs/jffs2/nodemgmt.c: In function 'jffs2_find_nextblock':
> fs/jffs2/nodemgmt.c:265: error: 'struct jffs2_sb_info' has no member
> named 'wbuf_ofs'
> fs/jffs2/nodemgmt.c:265: error: 'struct jffs2_sb_info' has no member
> named 'wbuf_len'
> fs/jffs2/nodemgmt.c:266: error: 'struct jffs2_sb_info' has no member
> named 'wbuf_ofs'
> make[2]: *** [fs/jffs2/nodemgmt.o] Error 1
> 

You are too late. This is already fixed and patch is in mtd git tree.

> 
> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
