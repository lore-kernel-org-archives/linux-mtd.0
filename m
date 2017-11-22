Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHYV4-0002yq-Ql
 for linux-mtd@lists.infradead.org; Wed, 22 Nov 2017 17:07:53 +0000
Received: by mail-wm0-x229.google.com with SMTP id v186so11607362wma.2
 for <linux-mtd@lists.infradead.org>; Wed, 22 Nov 2017 09:07:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJz5OpfXTXzvVZxmCC1+R1AU6qqHaGoH-KJKWd_Fixt2EgAJSw@mail.gmail.com>
References: <CAJz5OpfXTXzvVZxmCC1+R1AU6qqHaGoH-KJKWd_Fixt2EgAJSw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 22 Nov 2017 18:07:27 +0100
Message-ID: <CAFLxGvwfchgz59E_bA5VEY7cQ-Pig-AaAyBfw=m9msMgP0nt9Q@mail.gmail.com>
Subject: Re: Jffs2: systemd-journald fails to open log files on jffs2
To: Frank Mori Hess <fmh6jj@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frank,

On Wed, Nov 22, 2017 at 4:12 PM, Frank Mori Hess <fmh6jj@gmail.com> wrote:
> Hi, I have systemd-journald spewing EINVAL errors on a 4.1.33 kernel
> when it tries to
> open persistent journal files on jffs2, for example:
>
> systemd-journald[766]: Failed to open system journal: Invalid argument
>
> I traced this back to a failing mmap call which was attempting to do a
> writable mmap with MAP_SHARED.  Are there any plans for jffs2 to
> support such mappings, or is the answer just to dump jffs2 and move on
> to ubifs?

As UBIFS guy you can guess what my answer is. ;-)

But I'd like to know why you are still using JFFS2.
Is this some super small NOR flash where UBIFS does not work?

-- 
Thanks,
//richard
