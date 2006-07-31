Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7ZRM-0003J3-AU
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 11:12:28 -0400
Date: Mon, 31 Jul 2006 17:12:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: BUG: missing get_mtd_device when running cat /dev/mtdblock*
Message-ID: <20060731151216.GC16710@wohnheim.fh-wedel.de>
References: <20060731142615.GB16710@wohnheim.fh-wedel.de>
	<625fc13d0607310805i1d13877fj12e37607be038212@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <625fc13d0607310805i1d13877fj12e37607be038212@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 July 2006 10:05:52 -0500, Josh Boyer wrote:
> On 7/31/06, Jörn Engel <joern@wohnheim.fh-wedel.de> wrote:
> >While debugging on a 2.6.5 kernel (with fairly recent mtd) I noticed
> >that mtdblock appears to be bypassing get_mtd_device().
> 
> Yes, it bypasses calling that.  But...
> 
> >Can anyone verify this on current mtd by adding a simple printk() to
> >get_mtd_device() and running cat /dev/mtdblock0 > /dev/null or so?
> >
> >I am assuming this is not desired behaviour and should get fixed.
> 
> It seems mtd_blkdevs.c handles the reference counting itself.  See
> blktrans_open.  Most certainly this could be changed to call
> get_mtd_device instead, but I believe all the locking is correct as it
> stands.
> 
> Might want to double check though.

Well, the gluebi patch does not work with that.  Among other things,
gluebi introduced two new methods to struct mtd_info:

+	int (*open) (struct mtd_info *mtd);
+	int (*close) (struct mtd_info *mtd);

And these need to get called before/after devices get accessed.  I
believed the following to be sufficient:

@@ -298,8 +298,12 @@ struct mtd_info *get_mtd_device(struct m
 	if (ret && !try_module_get(ret->owner))
 		ret = NULL;
 
-	if (ret)
+	if (ret) {
+		if (ret->usecount == 0)
+			if (ret->open)
+				ret->open(ret);
 		ret->usecount++;
+	}
 
 	up(&mtd_table_mutex);
 	return ret;
@@ -311,6 +315,9 @@ void put_mtd_device(struct mtd_info *mtd
 
 	down(&mtd_table_mutex);
 	c = --mtd->usecount;
+	if (c == 0)
+		if (mtd->close)
+			mtd->close(mtd);
 	up(&mtd_table_mutex);
 	BUG_ON(c < 0);
 

Looks like it isn't.  And I don't see a good reason why it shouldn't
be enough.

Jörn

-- 
All art is but imitation of nature.
-- Lucius Annaeus Seneca
