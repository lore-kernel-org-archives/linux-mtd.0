Received: from mail-io0-x242.google.com ([2607:f8b0:4001:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5W9a-0000ev-EU
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 11:39:39 +0000
Received: by mail-io0-x242.google.com with SMTP id o22so4736770iod.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 04:39:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJo3e9cU50D7GDBYSCYRVYo+RrwvP+JvAZh9qQ=bcFgKjeYu7Q@mail.gmail.com>
References: <CAJo3e9cU50D7GDBYSCYRVYo+RrwvP+JvAZh9qQ=bcFgKjeYu7Q@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 2 May 2017 13:39:13 +0200
Message-ID: <CAFLxGvxKzMqPj0P9YFOLkMQCTb6tU2wxnH_TtcM8BCyDgtg8rQ@mail.gmail.com>
Subject: Re: [MTD] how to retrieve all patches related MTD bitflip_threshold
 from one old version to new one
To: chrysophoron kit <chrysophoronkit@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

chrysophoron kit,

On Tue, May 2, 2017 at 11:51 AM, chrysophoron kit
<chrysophoronkit@gmail.com> wrote:
> Hello every MTD export
>
> who knows how to retrieve all patches related MTD be applied from one
> old version kernel
> to new one? for example, we are now using 2.6.39, but we don't want to
> update kernel

And what about security updates?

> vertion to v4.x, we only want to update and install all MTD patches
> related MTD bitflip_threshold.
> becase we now continue using our old drivers based on 2.6.39, but
> found one issue is related to
> ECC bitflip_threshold, which 2.6.39 doesn't involve it. It is
> impossible now to let company update
> kernel version.

Well, if you really want to maintain your own franken-kernel you have
to inspect the git logs between 2.6.39 and mainline and backport
all needed changes. This is not trivial nor a lot of fun.

-- 
Thanks,
//richard
