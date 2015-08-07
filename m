Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNc7t-0004R2-Cs
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 07:31:38 +0000
Received: by obbfr1 with SMTP id fr1so36780633obb.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2015 00:31:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOx4H9CHrhBhW6DZrJi8h+Lz=5QFbmUn=n9o1WwBpzY1FGDR_A@mail.gmail.com>
References: <CAOx4H9CHrhBhW6DZrJi8h+Lz=5QFbmUn=n9o1WwBpzY1FGDR_A@mail.gmail.com>
Date: Fri, 7 Aug 2015 09:31:14 +0200
Message-ID: <CAFLxGvwr0-jTESMBV+BCcVf8-ZJGZPqO3cKhLeb8BwUnRs54mQ@mail.gmail.com>
Subject: Re: UBI confusing scrubbing information
From: Richard Weinberger <richard.weinberger@gmail.com>
To: t kevin <kevint324@gmail.com>
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

On Fri, Aug 7, 2015 at 5:20 AM, t kevin <kevint324@gmail.com> wrote:
> Hi,
>
> [ 2982.880000] UBI: scrubbed PEB 426 (LEB 0:1255), data moved to PEB 1301
> [ 2983.420000] UBI: scrubbed PEB 426 (LEB 0:451), data moved to PEB 1301
> [ 3043.920000] UBI: scrubbed PEB 426 (LEB 0:491), data moved to PEB 1301
> [ 3044.740000] UBI: scrubbed PEB 426 (LEB 0:1255), data moved to PEB 1301
> [ 3045.240000] UBI: scrubbed PEB 426 (LEB 0:1098), data moved to PEB 1301
> [ 3045.820000] UBI: scrubbed PEB 426 (LEB 0:65), data moved to PEB 1301
> [ 3046.160000] UBI: scrubbed PEB 1319 (LEB 0:1098), data moved to PEB 1301
>
> I'm using kernel 2.6.36.
> I got above message on my console which got me confused.
> First few lines indicates PEB 426 is on different LEBs?
> And all those PEB/LEB are moved to PEB1301 multiple times?
>
> Please help me understand what is happening.

It can be that PEB426 and 1301 got erased between the log messages.

-- 
Thanks,
//richard
