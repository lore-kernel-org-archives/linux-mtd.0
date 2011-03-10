Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxgsK-0006dP-Ae
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2011 14:30:01 +0000
Received: by ewy3 with SMTP id 3so610054ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2011 06:29:58 -0800 (PST)
Subject: Re: UBIFS defaults?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Hunter Adrian (Nokia-MS/Helsinki)" <adrian.hunter@nokia.com>
In-Reply-To: <1299675687.2741.14.camel@localhost>
References: <1299675687.2741.14.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Mar 2011 16:28:15 +0200
Message-ID: <1299767295.6676.26.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Bhavesh Parekh <bhaveshparekh1@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-09 at 15:01 +0200, Artem Bityutskiy wrote:
> Hi,
> 
> currently, UBIFS checks data CRC on read by default, i.e., the
> 'chk_data_crc' mount option is the default one. This makes people who
> apply benchmarks less happy, because they just use the defaults.
> 
> Should we make the 'no_chk_data_crc' mount option to be the default
> instead? The rationale is that people who do care to read the
> documentation can switch to 'chk_data_crc' if they need, and people who
> do quick UBIFS evaluation will end up with faster read speed by default.
> 
> See this section for more information about the 'no_chk_data_crc' mount
> option: http://www.linux-mtd.infradead.org/doc/ubifs.html#L_checksumming
> 
> Would be nice to hear UBIFS users' opinion.


>From f7a2d4a6dea3fcec4612aa81baabf8aae0040896 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 10 Mar 2011 16:26:32 +0200
Subject: [PATCH] UBIFS: do not check data crc by default

Change the default UBIFS behavior WRT data CRC checking. Currently,
UBIFS checks data CRC when reading, which slows it down quite a bit,
and this is the default option. However, it looks like in average
user does not need this feature and would prefer faster read speed
over extra reliability. And this seems to be de-facto standard that
file-systems do not check data CRC every time they read from the
media.

Thus, make UBIFS default behavior so that it does not check data
CRC. This corresponds to the no_chk_data_crc mount option. Those users
who need extra protection can always enable it using the chk_data_crc
option.

Please, read more information about this feature here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_checksumming

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 Documentation/filesystems/ubifs.txt |    4 ++--
 fs/ubifs/super.c                    |    1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/ubifs.txt b/Documentation/filesystems/ubifs.txt
index 12fedb7..d7b13b0 100644
--- a/Documentation/filesystems/ubifs.txt
+++ b/Documentation/filesystems/ubifs.txt
@@ -82,12 +82,12 @@ Mount options
 bulk_read		read more in one go to take advantage of flash
 			media that read faster sequentially
 no_bulk_read (*)	do not bulk-read
-no_chk_data_crc		skip checking of CRCs on data nodes in order to
+no_chk_data_crc (*)	skip checking of CRCs on data nodes in order to
 			improve read performance. Use this option only
 			if the flash media is highly reliable. The effect
 			of this option is that corruption of the contents
 			of a file can go unnoticed.
-chk_data_crc (*)	do not skip checking CRCs on data nodes
+chk_data_crc		do not skip checking CRCs on data nodes
 compr=none              override default compressor and set it to "none"
 compr=lzo               override default compressor and set it to "lzo"
 compr=zlib              override default compressor and set it to "zlib"
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b722ebc..e5dc1e1 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1985,6 +1985,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	INIT_LIST_HEAD(&c->old_buds);
 	INIT_LIST_HEAD(&c->orph_list);
 	INIT_LIST_HEAD(&c->orph_new);
+	c->no_chk_data_crc = 1;
 
 	c->vfs_sb = sb;
 	c->highest_inum = UBIFS_FIRST_INO;
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
