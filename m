Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adl5z-0004tj-F0
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 20:52:40 +0000
Received: by mail-lb0-x229.google.com with SMTP id k15so84516040lbg.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2016 12:52:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzL7ujU6+OHnYGbk3pWOxSjw_Voo2=7iOYfvb+cbGvTEQ@mail.gmail.com>
References: <CAKmQUfY0tU1H_e0kYk5r4gREL55R8uHtgXrbEMuS4pSJ6cf94g@mail.gmail.com>
 <CAFLxGvzL7ujU6+OHnYGbk3pWOxSjw_Voo2=7iOYfvb+cbGvTEQ@mail.gmail.com>
Date: Wed, 9 Mar 2016 21:52:17 +0100
Message-ID: <CAKmQUfZT+S5--mQntpUrZWR4gk4YcoXChN5254hixYtrT5JFYw@mail.gmail.com>
Subject: Re: Is ubiattach alone somehow damaging a partition?
From: john smith <wempwer@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/9/16, Richard Weinberger <richard.weinberger@gmail.com> wrote:
> Are both mtd1 and mtd2 supposed to carry UBI?
> I'm not rally sure what you are trying to do...

Hmm... probably not as kernel booting command does not contain
anything similar to this:

root=ubi:rootfs rootfstype=ubifs ubi.mtd=flash1.rootfs0

However, I just thought that I can use ubiattach to be able to mount
any given mtd device.  I was looking for a way to get access to a
currently not used mtd device.  If ubiattach is suitable for this,
then what may be?

> If you ask UBI to attach to an mtd it will write to it.

Where exactly?  In do_attach() there is only open(), ioctl() and
close() called.  Where will writing take place?
-- 
<wempwer@gmail.com>
