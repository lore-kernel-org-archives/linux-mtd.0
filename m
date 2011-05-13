Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QKoFZ-0000t7-TJ
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 09:01:36 +0000
Received: by eyh6 with SMTP id 6so767446eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 May 2011 02:01:32 -0700 (PDT)
Subject: Re: [PATCH 2/2] UBIFS: fix-up free space on mount if flag is set
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1305198589.2713.97.camel@localhost>
References: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
	<1304722703-7904-3-git-send-email-mlcreech@gmail.com>
	<1305198589.2713.97.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 May 2011 10:58:33 +0300
Message-ID: <1305273513.14423.15.camel@localhost>
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

On Thu, 2011-05-12 at 14:09 +0300, Artem Bityutskiy wrote:
> On Fri, 2011-05-06 at 18:58 -0400, Matthew L. Creech wrote:
> > +	if (c->space_fixup) {
> > +		err = ubifs_fixup_free_space(c);
> > +		if (err)
> > +			goto out;
> > +	}
> > +
> >  	dbg_gen("re-mounted read-write");
> >  	c->remounting_rw = 0;
> >  	err = dbg_check_space_info(c);
> 
> Note, I've moved the 'ubifs_fixup_free_space()' a bit down to make sure
> we first print "re-mounted" and "deferred recovery completed" messages,
> and then start fixing up. I think this is a bit neater.

I do not know if that was me or you, but I've found out that the a lot
of code uses spaces for indentation instead of tabs, and checkpatch.pl
complains:

WARNING: please, no spaces at the start of a line
#119: FILE: fs/ubifs/sb.c:746:
+                       err = PTR_ERR(lprops);$

ERROR: code indent should use tabs where possible
#120: FILE: fs/ubifs/sb.c:747:
+                       goto out;$

.... a lot of this ....

But I've just fixed this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
