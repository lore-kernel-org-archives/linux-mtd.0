Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LVLF1-0000p0-G8
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 07:35:11 +0000
Subject: Re: [PATCH 1/2] MTD: add fsync capability
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0902051400t6c9e7525h28597ae442501751@mail.gmail.com>
References: <1233869152-23992-1-git-send-email-corentincj@iksaif.net>
	<8bd0f97a0902051400t6c9e7525h28597ae442501751@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 Feb 2009 09:34:43 +0200
Message-Id: <1233905683.17790.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-02-05 at 17:00 -0500, Mike Frysinger wrote:
> On Thu, Feb 5, 2009 at 16:25, Corentin Chary wrote:
> > +static int mtd_fsync(struct file *file, struct dentry *dentry, int datasync)
> > +{
> > +       struct mtd_file_info *mfi = file->private_data;
> > +       struct mtd_info *mtd = mfi->mtd;
> > +
> > +       DEBUG(MTD_DEBUG_LEVEL0, "MTD_fsync\n");
> > +
> > +       /* Only sync if opened RW */
> > +       if ((file->f_mode & FMODE_WRITE) && mtd->sync)
> > +               mtd->sync(mtd);
> > +
> > +       return 0;
> > +} /* mtd_fsync */
> 
> adding a comment to mark the end of a function isnt common ... i'd
> drop that.  otherwise, the patch looks pretty straightforward to me,
> but i'm not a big VFS guru ;).
> -mike

The patch looks fine for me, except of the weird end comment, and
the ancient ugly "DEBUG(MTD_DEBUG_LEVEL0, "MTD_fsync\n");" ...

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
