Received: from bay17-f12.bay17.hotmail.com ([64.4.43.62] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHuG8-0002nK-SZ
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 22:23:24 -0400
Message-ID: <BAY17-F12F1E2B388A262D0276F04E8940@phx.gbl>
In-Reply-To: <432FF28C.7030005@yandex.ru>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru
Date: Wed, 21 Sep 2005 10:22:54 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
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

>
>+struct jffs2_eraseblock_header
>+{
>+       jint16_t magic;
>+       jint16_t nodetype; /* == JFFS2_NODETYPE_ERASEBLOCK_HEADER */
>+       jint32_t totlen;
>+       jint32_t hdr_crc;
>+       jint32_t fs_version; /* the version of this JFFS2 fs image */
>Well, I assume we may have 3 fields here:
>u8 version;
>u8 compat_fset;
>u8 incompat_fset;
>u8 rocompat_fset;

OK. I'll modify the patch to add support for these 3 new fields.

>
>+       jint32_t erase_count; /* the erase count of this erase block */
>4 bytes enough?
>

Yes. Now the erase cycles of flash erase block is about 100,000. So 4 
bytes is enough.

>+       jint16_t dsize; /* the size of additional data behind node_crc */
>What for?

This is for future extension. For example, if we decide to add more fields
into eraseblock_header in the future, they'll be appended to
eraseblock_header. dsize tells the data length of appended data; 
data_crc tells the crc of appended data.

>
>+       jint32_t node_crc;
>+       jint32_t data_crc;
>+       jint32_t data[0];
>+} __attribute__((packed));
>+
>
>
