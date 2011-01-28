Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pirsw-0006IZ-Gf
	for linux-mtd@lists.infradead.org; Fri, 28 Jan 2011 17:13:23 +0000
Received: by gxk21 with SMTP id 21so1185016gxk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Jan 2011 09:13:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1278995528.16634.129.camel@localhost>
References: <AANLkTilwqK96Btosh4kzW0kMDjRWzWskrG_ymekpV9Uz@mail.gmail.com>
	<1278995289.16634.126.camel@localhost>
	<1278995528.16634.129.camel@localhost>
Date: Fri, 28 Jan 2011 12:13:20 -0500
Message-ID: <AANLkTi==-biDcaFozVvkHUwXMYqMWk4=mbD16_TJ1JOO@mail.gmail.com>
Subject: Re: ubifs_scan() error handling
From: twebb <taliaferro62@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Tue, 2010-07-13 at 07:28 +0300, Artem Bityutskiy wrote:
>> > Would it make sense and be acceptable to make this call any time
>> > ubifs_scan() returns an error?
>>
>> May be. I'll think and return to you.
>
> We can probably go for it, but the current recovery is not enough for
> MLC anyway. So I'd prefer to do the change you propose as a part of
> larger UBIFS on MLC patch-set.
>
> Please, analyse ubifs_recover_leb(), find out what should be changed
> there for MLC, send a patch-set.
>

It's been awhile but I wanted to reopen the discussion on this topic.
Could you take a look at this proposed patch?  Essentially this change
results in the LEB being cleaned/recovered regardless of whether
is_last_write() is true or not.  There may be a better way to do this
earlier in the same function, but I'm not familiar enough with it to
know the significance of the is_last_write() call.


diff -Naru a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
--- a/fs/ubifs/recovery.c       2011-01-26 16:08:04.000000000 -0500
+++ b/fs/ubifs/recovery.c       2011-01-26 16:08:25.000000000 -0500
@@ -665,19 +665,8 @@
        }

        if (!empty_chkd && !is_empty(buf, len)) {
-               if (is_last_write(c, buf, offs)) {
-                       clean_buf(c, &buf, lnum, &offs, &len);
-                       need_clean = 1;
-               } else {
-                       int corruption = first_non_ff(buf, len);
-
-                       ubifs_err("corrupt empty space LEB %d:%d, corruption "
-                                 "starts at %d", lnum, offs, corruption);
-                       /* Make sure we dump interesting non-0xFF data */
-                       offs = corruption;
-                       buf += corruption;
-                       goto corrupted;
-               }
+               clean_buf(c, &buf, lnum, &offs, &len);
+               need_clean = 1;
        }

        /* Drop nodes from incomplete group */
