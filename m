Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmUSU-0001qH-1l
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 17:01:02 +0000
Received: by ewy20 with SMTP id 20so2239487ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Feb 2011 09:01:00 -0800 (PST)
Subject: Re: [PATCH v2 0/5] UBIFS: fix recovery on CFI NOR
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20110207172523.11294ec5@wker>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<20110207172523.11294ec5@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Feb 2011 18:58:59 +0200
Message-ID: <1297097939.5938.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Holger Brunck <holger.brunck@keymile.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Detlev Zundel <dzu@denx.de>, Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-02-07 at 17:25 +0100, Anatolij Gustschin wrote:
> I dropped the lines containing ffffffff in the dump above (verified
> that these were all ffffffff).
> 
> The UBIFS data node before the dumped area seems to be okay
> and contains "ABC123ABC123ABC123..." data block.
> 
> The corrupted area seems to contain data from an interrupted
> write operation. 

It looks like I missed the no_more_nodes() function. I think this should
fix the issue you have found. If you still have the flash which ubifs
refuses to mount, you can apply this patch, and ubifs should mount that
media.

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 4278ae7..65e4664 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -430,7 +430,7 @@ static int no_more_nodes(const struct ubifs_info *c, void *buf, int len,
 	int skip, dlen = le32_to_cpu(ch->len);
 
 	/* Check for empty space after the corrupt node's common header */
-	skip = ALIGN(offs + UBIFS_CH_SZ, c->min_io_size) - offs;
+	skip = ALIGN(offs + UBIFS_CH_SZ, c->max_write_size) - offs;
 	if (is_empty(buf + skip, len - skip))
 		return 1;
 	/*
@@ -442,7 +442,7 @@ static int no_more_nodes(const struct ubifs_info *c, void *buf, int len,
 		return 0;
 	}
 	/* Now we know the corrupt node's length we can skip over it */
-	skip = ALIGN(offs + dlen, c->min_io_size) - offs;
+	skip = ALIGN(offs + dlen, c->max_write_size) - offs;
 	/* After which there should be empty space */
 	if (is_empty(buf + skip, len - skip))
 		return 1;

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
