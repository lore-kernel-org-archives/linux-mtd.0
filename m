Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXUz6-0000K2-0y
 for linux-mtd@lists.infradead.org; Sun, 21 Feb 2016 14:27:41 +0000
Received: by mail-ob0-x22c.google.com with SMTP id gc3so144204124obb.3
 for <linux-mtd@lists.infradead.org>; Sun, 21 Feb 2016 06:27:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAD1M0635nyHDL6vo+KUWy-FJKU=VSHPpeWyj_aMA06wQNw1t0w@mail.gmail.com>
References: <CAD1M0635nyHDL6vo+KUWy-FJKU=VSHPpeWyj_aMA06wQNw1t0w@mail.gmail.com>
Date: Sun, 21 Feb 2016 15:27:18 +0100
Message-ID: <CAFLxGvx3Xe3pYPd=4sQR-_3_x=J9RsF7uhYpVK8EtbrcuV0kZA@mail.gmail.com>
Subject: Re: ubifs+overlayfs
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cc'ing linux-mtd.

On Sat, Feb 20, 2016 at 1:02 AM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
> It seems that overlayfs requires RENAME_WHITEOUT and RENAME_EXCHANGE.
> However, these two flags aren't currently supported in ubifs (or
> anything other than ext4, f2fs, and xfs). This causes any atomic
> renames to fail (e.g. using 'mv' command).

Hmm, right. I always thought overlayfs does checks at mount time.
But apparently I was wrong.
Thanks for pointing this out.

> I'm currently trying to implement these flags, but I'm having some
> issues as I'm pretty vanilla when it comes to implementation details
> on ubifs. I'm taking inspiration from patches [1] and [2], but I'm
> kind of coming up short. Is there anyone currently working on this? If
> not, I would certainly appreciate any advice for implementing these
> features.

Not to my knowledge. But you can use my O_TMPFILE patch as start.
See linux-mtd mailinglist.
If you have questions, just ask.
As using overlayfs is common on embedded stuff we definitely need that on UBIFS.
Just in case I'm putting that also on my todo list.

> What I'm doing: I'm attempting to create a 'whiteout' object from
> within the ubifs_rename function. However, I noticed that it calls
> ubifs_jnl_rename, which is where I believe I should try to implement
> this. I haven't touched RENAME_EXCHANGE yet.
>
> [1] https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-4.4/110-jffs2-use-.rename2-and-add-RENAME_WHITEOUT-support.patch
> [2] https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-4.4/111-jffs2-add-RENAME_EXCHANGE-support.patch

Hmm, these patches seem wrong to me.
Unless I'm very mistaken it looks like every whiteout creates an busy
orphaned inode.

-- 
Thanks,
//richard
