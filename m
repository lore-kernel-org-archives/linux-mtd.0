Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORTNC-00080g-La
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 17:04:27 +0000
Received: by gyb11 with SMTP id 11so4529454gyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Jun 2010 10:04:24 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 23 Jun 2010 13:04:23 -0400
Message-ID: <AANLkTilwqK96Btosh4kzW0kMDjRWzWskrG_ymekpV9Uz@mail.gmail.com>
Subject: ubifs_scan() error handling
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org, Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Without having a complete understanding of how the UBI and UBIFS
internals work, I have a question regarding error handling in
ubifs_scan().

When ubifs_scan() encounters SCANNED_EMPTY_SPACE during execution, it
checks whether the LEB is all 0xFFs and if not - returns -EUCLEAN.  In
some cases (for example, in orphan.c/kill_orphans()), any error
returned by ubifs_scan() results in a call to ubifs_recover_leb().
Would it make sense and be acceptable to make this call any time
ubifs_scan() returns an error?  And if so, would it make more sense to
include the ubifs_recover_leb() call in ubifs_scan() at goto
corruption?

Thanks,
twebb
