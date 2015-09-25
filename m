Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfQCy-0000dK-7j
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 10:26:28 +0000
Received: by obbzf10 with SMTP id zf10so78713933obb.2
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2015 03:26:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK__sc6BFSMu6+NjTkT9xsqdjA+H=Df9nw=ajTmfuRmn4Hz3+A@mail.gmail.com>
References: <CAK__sc6BFSMu6+NjTkT9xsqdjA+H=Df9nw=ajTmfuRmn4Hz3+A@mail.gmail.com>
Date: Fri, 25 Sep 2015 12:26:07 +0200
Message-ID: <CAFLxGvwtq9WF3SL_ZaAYHMsvi4g3B29XwRddKvPyu2YDz2P-hA@mail.gmail.com>
Subject: Re: UBIFS recovery/forensics tools
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Andrew Tierney <cybergibbons@cybergibbons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Gstir <david@sigma-star.at>, yangds.fnst@cn.fujitsu.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 25, 2015 at 11:29 AM, Andrew Tierney
<cybergibbons@cybergibbons.com> wrote:
> Hello all,
>
> I am a reverse engineer, and I am finding that UBIFS is becoming
> increasingly common on embedded devices. A common task is recovering
> file systems from locked down or damaged devices, and I'm finding this
> very challenging with UBIFS!
>
> I have seen talk on here of userspace tools to recover damaged UBIFS
> systems. Did anything every come of this? I am currently using "ubi
> reader" ( https://github.com/jrspruitt/ubi_reader ) with some success.

We're currently working on such tools.
Stay tuned.

-- 
Thanks,
//richard
