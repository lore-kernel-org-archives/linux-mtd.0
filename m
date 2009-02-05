Received: from yx-out-1718.google.com ([74.125.44.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVCGs-0007gi-2A
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 22:00:30 +0000
Received: by yx-out-1718.google.com with SMTP id 3so215871yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Feb 2009 14:00:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1233869152-23992-1-git-send-email-corentincj@iksaif.net>
References: <1233869152-23992-1-git-send-email-corentincj@iksaif.net>
Date: Thu, 5 Feb 2009 17:00:28 -0500
Message-ID: <8bd0f97a0902051400t6c9e7525h28597ae442501751@mail.gmail.com>
Subject: Re: [PATCH 1/2] MTD: add fsync capability
From: Mike Frysinger <vapier.adi@gmail.com>
To: Corentin Chary <corentincj@iksaif.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 5, 2009 at 16:25, Corentin Chary wrote:
> +static int mtd_fsync(struct file *file, struct dentry *dentry, int datasync)
> +{
> +       struct mtd_file_info *mfi = file->private_data;
> +       struct mtd_info *mtd = mfi->mtd;
> +
> +       DEBUG(MTD_DEBUG_LEVEL0, "MTD_fsync\n");
> +
> +       /* Only sync if opened RW */
> +       if ((file->f_mode & FMODE_WRITE) && mtd->sync)
> +               mtd->sync(mtd);
> +
> +       return 0;
> +} /* mtd_fsync */

adding a comment to mark the end of a function isnt common ... i'd
drop that.  otherwise, the patch looks pretty straightforward to me,
but i'm not a big VFS guru ;).
-mike
