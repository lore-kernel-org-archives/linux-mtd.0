Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8CLc-0006ST-2P
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 22:45:05 +0000
Received: by mail-it1-x144.google.com with SMTP id c85-v6so242666itd.1
 for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2018 15:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkQfmN6PguBRdL68ZRuOEgC2GWEW4-XxeE3=7epLGODTqHqeQ@mail.gmail.com>
In-Reply-To: <CAGkQfmN6PguBRdL68ZRuOEgC2GWEW4-XxeE3=7epLGODTqHqeQ@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Thu, 4 Oct 2018 15:43:07 -0700
Message-ID: <CALLGbRLqOnJzTtFkC6LLO2Fgo+V2QvPDk4U+i1MW1AUOT8C3oA@mail.gmail.com>
Subject: Re: Nandsim, UBIFS and memory concerns
To: romain.izard.pro@gmail.com
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Romain,

On Thu, Oct 4, 2018 at 9:53 AM Romain Izard <romain.izard.pro@gmail.com> wrote:
>
> On a regular but slow basis, I get report of devices based on UBIFS running
> Linux 4.14 where the file system gets corrupted during an update. The update
> process creates new files with temporary names to replace existing files,
> and uses renames to replace these files atomically. What is observed is that
> in some cases, the update log describes all steps for a complete update, and
> yet some files contain the new version while others contain an older
> version. Moreover, it seems that some files with temporary names that should
> have been renamed are visible.
>
> As the update process is also able to use tmpfs to create files, and will
> use a large part of the available memory, I fear that this issue is related
> with the behaviour of UBIFS in low memory conditions. I'm wondering about
> UBIFS losing some parts of the log when a ENOMEM condition occurs during its
> operations or when the OOM killer targets a process that is doing some UBIFS
> processing.
>

I've seen these sort of symptoms that you describe in the wild. But
what I have seen has never had anything to do with UBIFS, but only
with problems with how updates (or other large filesystems operations)
are implemented. Specifically, the lack of a filesystem sync before a
reboot will have these exact effects. What you end up with is a
situation where the filesystem operations are done, yet the changes
haven't actually been flushed to "disk".  Doesn't mater if it's a HDD
or a UBIFS on flash, the effect is the same, though the time of
vulnerability might be different.

Especially since you mention the OOM killer and using tmpfs - I'd look
into if you're running out of RAM, and either causing an reboot oops
or at least killing the process before all file operations are
complete. Just because your log shows the operation was triggered at
the userspace level, doesn't mean the kernel has completed all
filesystem operations and written the physical device.

What you describe is not an UBIFS corruption, but a garden-variety
user-space file operations corruption issue.

As I said, I've encountered this before. The only thing you can do is
to examine your process and tailor it to be sure to complete it's
physical writes.  In our case, we had a few things to solve: * put
'sync' calls in our update scripts, * avoid the use of a problematic
utility, and * we tried using the `-osync` flag.  (-osync fixed the
problem at the cost of a performance hit. Later we decided not to go
that way and instead instructed our customers how to properly write
programs that wrote the filesystem).

- Steve
