Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXxLs-0004s5-1U
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2016 20:45:05 +0000
Received: by mail-wm0-x22e.google.com with SMTP id g62so173940761wme.0
 for <linux-mtd@lists.infradead.org>; Mon, 22 Feb 2016 12:44:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvx3Xe3pYPd=4sQR-_3_x=J9RsF7uhYpVK8EtbrcuV0kZA@mail.gmail.com>
References: <CAD1M0635nyHDL6vo+KUWy-FJKU=VSHPpeWyj_aMA06wQNw1t0w@mail.gmail.com>
 <CAFLxGvx3Xe3pYPd=4sQR-_3_x=J9RsF7uhYpVK8EtbrcuV0kZA@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Mon, 22 Feb 2016 12:44:12 -0800
Message-ID: <CAD1M063+aiBQd0fMkySw=TbiK5vRvFY6qXstKSR6KuyVe6jadA@mail.gmail.com>
Subject: Re: ubifs+overlayfs
To: Richard Weinberger <richard.weinberger@gmail.com>
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

Hi,

On Sun, Feb 21, 2016 at 6:27 AM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> Cc'ing linux-mtd.
>
> On Sat, Feb 20, 2016 at 1:02 AM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
>> It seems that overlayfs requires RENAME_WHITEOUT and RENAME_EXCHANGE.
>> However, these two flags aren't currently supported in ubifs (or
>> anything other than ext4, f2fs, and xfs). This causes any atomic
>> renames to fail (e.g. using 'mv' command).
>
> Hmm, right. I always thought overlayfs does checks at mount time.
> But apparently I was wrong.
> Thanks for pointing this out.

No problem.

>> I'm currently trying to implement these flags, but I'm having some
>> issues as I'm pretty vanilla when it comes to implementation details
>> on ubifs. I'm taking inspiration from patches [1] and [2], but I'm
>> kind of coming up short. Is there anyone currently working on this? If
>> not, I would certainly appreciate any advice for implementing these
>> features.
>
> Not to my knowledge. But you can use my O_TMPFILE patch as start.
> See linux-mtd mailinglist.
> If you have questions, just ask.
> As using overlayfs is common on embedded stuff we definitely need that on UBIFS.
> Just in case I'm putting that also on my todo list.

Great, that patch looks like it would help. If I can't totally figure
out a solution on my own, I'll let you know since you can probably
type out the implementation to these flags much faster than I am
currently able to.

>> What I'm doing: I'm attempting to create a 'whiteout' object from
>> within the ubifs_rename function. However, I noticed that it calls
>> ubifs_jnl_rename, which is where I believe I should try to implement
>> this. I haven't touched RENAME_EXCHANGE yet.
>>
>> [1] https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-4.4/110-jffs2-use-.rename2-and-add-RENAME_WHITEOUT-support.patch
>> [2] https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-4.4/111-jffs2-add-RENAME_EXCHANGE-support.patch
>
> Hmm, these patches seem wrong to me.
> Unless I'm very mistaken it looks like every whiteout creates an busy
> orphaned inode.

Great, I will only look at implementations currently in the kernel then.

Thanks,
- Pushpal

> --
> Thanks,
> //richard
