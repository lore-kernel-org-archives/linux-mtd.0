Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpZEi-0003uX-0C
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 08:29:24 +0000
Message-ID: <1401265736.2118.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] ubifs: respect MS_SILENT mount flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "hujianyang@huawei.com" <hujianyang@huawei.com>
Date: Wed, 28 May 2014 11:28:56 +0300
In-Reply-To: <1401264889.983.19.camel@sauron.fi.intel.com>
References: <1401193128.1304.132.camel@sauron.fi.intel.com>
 <20140527141030.GA3130@earthship.local>
 <1401202595.1304.165.camel@sauron.fi.intel.com>
 <5384B772.4030506@makrotopia.org> <538545B4.7070103@huawei.com>
 <1401264104.983.12.camel@sauron.fi.intel.com>
 <1401264446.983.17.camel@sauron.fi.intel.com>
 <1401264889.983.19.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "daniel@makrotopia.org" <daniel@makrotopia.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-05-28 at 11:14 +0300, Artem Bityutskiy wrote:
> On Wed, 2014-05-28 at 08:07 +0000, Bityutskiy, Artem wrote:
> > On Wed, 2014-05-28 at 11:01 +0300, Artem Bityutskiy wrote: 
> > > +       /*
> > > +        * Good commend describing what we are doing.
> > > +        */
> > > +       c->probing = 1
> > 
> > Err, actually:
> > 
> >           c->probing = silent;
> > 
> > >         err = ubifs_read_superblock(c);
> > > +       c->probing = 0
> > >         if (err)
> > >                 goto out_free;
> 
> I guess you guys got the idea, but just in case, you also will need to
> add "if (!c->probing) { ubifs_error() }" in the relevant places.

Or even introduce a new version of the error macro, something like
'ubifs_errc(), and use that in the relevant places. Not sure what is
going to look better, though. Here is a sketch:


diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index e8c8cfe..60cffa7 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -52,6 +52,14 @@
        pr_warn("UBIFS warning (pid %d): %s: " fmt "\n",            \
                current->pid, __func__, ##__VA_ARGS__)
 
+/*
+ * A variant of 'ubifs_err()' which takes the UBIFS file-sytem description
+ * object as an argument.
+ */
+#define ubifs_errc(c, fmt, ...)                                    \
+       if (!(c)->probing)                                          \
+               ubifs_err(fmt, ##__VA_ARGS__)
+
 /* UBIFS file system VFS magic number */
 #define UBIFS_SUPER_MAGIC 0x24051905




-- 
Best Regards,
Artem Bityutskiy
