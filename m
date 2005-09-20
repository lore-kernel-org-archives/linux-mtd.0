Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHgJp-0003ld-44
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 07:30:01 -0400
Message-ID: <432FF28C.7030005@yandex.ru>
Date: Tue, 20 Sep 2005 15:29:16 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F171945FE7F31D429CCE8BEE8950@phx.gbl>
In-Reply-To: <BAY17-F171945FE7F31D429CCE8BEE8950@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add JFFS2 eraseblock header support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hmm,

zhao forrest wrote:
> Your comments are welcome.

+struct jffs2_eraseblock_header
+{
+       jint16_t magic;
+       jint16_t nodetype; /* == JFFS2_NODETYPE_ERASEBLOCK_HEADER */
+       jint32_t totlen;
+       jint32_t hdr_crc;
+       jint32_t fs_version; /* the version of this JFFS2 fs image */
Well, I assume we may have 3 fields here:
u8 version;
u8 compat_fset;
u8 incompat_fset;
u8 rocompat_fset;

+       jint32_t erase_count; /* the erase count of this erase block */
4 bytes enough?

+       jint16_t dsize; /* the size of additional data behind node_crc */
What for?

+       jint32_t node_crc;
+       jint32_t data_crc;
+       jint32_t data[0];
+} __attribute__((packed));
+


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
