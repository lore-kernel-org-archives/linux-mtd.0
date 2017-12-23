Received: from mail-yb0-x22b.google.com ([2607:f8b0:4002:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSilH-0002bl-B4
 for linux-mtd@lists.infradead.org; Sat, 23 Dec 2017 12:18:44 +0000
Received: by mail-yb0-x22b.google.com with SMTP id z62so18838373yba.11
 for <linux-mtd@lists.infradead.org>; Sat, 23 Dec 2017 04:18:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwzRBGJf0-jCAwGts1HwV_nT072+yhHLP079sxQezoTFQ@mail.gmail.com>
References: <cover.1512741134.git.dongsu@kinvolk.io>
 <945d325a2239efcd55273abb2bac41cfc7264fea.1512041070.git.dongsu@kinvolk.io>
 <CAFLxGvwzRBGJf0-jCAwGts1HwV_nT072+yhHLP079sxQezoTFQ@mail.gmail.com>
From: Dongsu Park <dongsu@kinvolk.io>
Date: Sat, 23 Dec 2017 13:18:30 +0100
Message-ID: <CANxcAMtVqgLmQaTtfJocGGgsn5dSX2CDwzh6bwv6OnjUUwsTrg@mail.gmail.com>
Subject: Re: [PATCH 02/11] mtd: Check permissions towards mtd block device
 inode when mounting
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Miklos Szeredi <mszeredi@redhat.com>,
 Linux Containers <containers@lists.linux-foundation.org>,
 Seth Forshee <seth.forshee@canonical.com>, Alban Crequy <alban@kinvolk.io>,
 "Eric W . Biederman" <ebiederm@xmission.com>, Sargun Dhillon <sargun@sargun.me>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Dec 22, 2017 at 10:06 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> Dongsu,
>
> On Fri, Dec 22, 2017 at 3:32 PM, Dongsu Park <dongsu@kinvolk.io> wrote:
>> From: Seth Forshee <seth.forshee@canonical.com>
>>
>> Unprivileged users should not be able to mount mtd block devices
>> when they lack sufficient privileges towards the block device
>> inode.  Update mount_mtd() to validate that the user has the
>> required access to the inode at the specified path. The check
>> will be skipped for CAP_SYS_ADMIN, so privileged mounts will
>> continue working as before.
>
> What is the big picture of this?
> Can in future an unprivileged user just mount UBIFS?

I'm not sure I'm aware of all use cases w.r.t mtd & ubifs.
To my understanding, in these days many container runtimes allow
unprivileged users to run containers. (docker, lxc, runc, bubblewrap, etc)
That's why the kernel should deal with additional permission checks
that might have not been necessary in the past.
This MTD patch is one of those special cases.

> Please note that UBIFS sits on top of a character device and not a block device.

Aha, good to know.

Thanks,
Dongsu

> --
> Thanks,
> //richard
