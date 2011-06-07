Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTtWT-0006Yl-FJ
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 10:28:34 +0000
Received: by wyb28 with SMTP id 28so4745798wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 03:28:31 -0700 (PDT)
Subject: Re: ubifs_decompress: cannot decompress ...
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1307389926-12209-1-git-send-email-mlcreech@gmail.com>
References: <1307377091.3112.100.camel@localhost>
	<1307389926-12209-1-git-send-email-mlcreech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 13:24:14 +0300
Message-ID: <1307442254.11104.75.camel@localhost>
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

On Mon, 2011-06-06 at 15:52 -0400, Matthew L. Creech wrote:
> On Mon, Jun 6, 2011 at 12:18 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > I have to go home now - could you please improve dbg_dump_leb().
> > Currently it calls ubifs_scan(), which scans, finds corrupted node,
> > prints corruption information and returns -EUCLEAN and destroys the
> > scanned data.
> >
> 
> Will something like this be okay?  Or do you still want to dump the
> partially-parsed data from the corrupt node as well (not just the raw contents
> of the LEB)?

Probably a temporary hack like this should work.

diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 37383e8..c709045 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -352,8 +352,9 @@ corrupted:
 		ubifs_err("LEB %d scanning failed", lnum);
 	}
 	err = -EUCLEAN;
-	ubifs_scan_destroy(sleb);
-	return ERR_PTR(err);
+//	ubifs_scan_destroy(sleb);
+//	return ERR_PTR(err);
+	return sleb;
 
 error:
 	ubifs_err("LEB %d scanning failed, error %d", lnum, err);

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
