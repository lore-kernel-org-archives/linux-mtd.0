Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LJrAC-0006dL-Lq
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 15:14:45 +0000
Subject: Re: about the _dtype_ parameter
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan xu <xiaochuanxv@gmail.com>
In-Reply-To: <ff5b6bcd0901050659k4679c64egffcfa054da4c9034@mail.gmail.com>
References: <ff5b6bcd0901050659k4679c64egffcfa054da4c9034@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 05 Jan 2009 17:14:07 +0200
Message-Id: <1231168447.6608.26.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-01-05 at 22:59 +0800, xiaochuan xu wrote:
> Hi,
> 
> >> In my test, I found that the third parameter of ubi_wl_get_peb()
> >> function _dtype_ is always UBI_SHORTTERM.
> 
> >Which test?
> I write a temporary file in the ubifs with O_TRUNC flag over and over.
> I see that all the @dtype variables are equal to 2 not 3.
> why does this happen?

Hmm, indeed, UBIFS uses UBI_SHORTTERM in 'reserve_space()', which looks
wrong - thanks for noticing. Could you please try the attached patch?

> Even though, as you say, most of the data are type of UBI_UNKNOWN,
> the @dtype variable seems to make less sense in the current implemenation.
> If this is ture, I think it's necessary to implement a
> dynamic-data-type-classification
> policy.

Agree. I'll be happy to merge such an improvement, but I do not have
plans to do this myself.

Patch:

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 10ae25b..6a885c5 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -208,7 +208,7 @@ again:
 	offs = 0;
 
 out:
-	err = ubifs_wbuf_seek_nolock(wbuf, lnum, offs, UBI_SHORTTERM);
+	err = ubifs_wbuf_seek_nolock(wbuf, lnum, offs, UBI_UNKNOWN);
 	if (err)
 		goto out_unlock;

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
