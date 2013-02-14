Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5tEZ-0002Ad-Q1
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2013 07:27:56 +0000
Message-ID: <1360826890.12703.158.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RFC 4/5] UBIFS: Add security.* XATTR support for the UBIFS
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 14 Feb 2013 09:28:10 +0200
In-Reply-To: <1360750998-15191-5-git-send-email-mkl@pengutronix.de>
References: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
 <1360750998-15191-5-git-send-email-mkl@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-security-module@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Subodh Nijsure <snijsure@grid-net.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-02-13 at 11:23 +0100, Marc Kleine-Budde wrote:
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -553,7 +553,8 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
>  
>         dbg_jnl("ino %lu, dent '%.*s', data len %d in dir ino %lu",
>                 inode->i_ino, nm->len, nm->name, ui->data_len, dir->i_ino);
> -       ubifs_assert(dir_ui->data_len == 0);
> +       if (!xent)
> +               ubifs_assert(dir_ui->data_len == 0);

Shouldn't this snippet be in 2/5 instead?

-- 
Best Regards,
Artem Bityutskiy
