Received: from mail-vn0-x235.google.com ([2607:f8b0:400c:c0f::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z6xbr-00047K-K7
 for linux-mtd@lists.infradead.org; Mon, 22 Jun 2015 09:01:44 +0000
Received: by vnbf62 with SMTP id f62so6770715vnb.1
 for <linux-mtd@lists.infradead.org>; Mon, 22 Jun 2015 02:01:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5587c30b.a8c1420a.4df03.ffffae2aSMTPIN_ADDED_BROKEN@mx.google.com>
References: <5587c30b.a8c1420a.4df03.ffffae2aSMTPIN_ADDED_BROKEN@mx.google.com>
Date: Mon, 22 Jun 2015 11:01:21 +0200
Message-ID: <CAFLxGvxXisrEyApZChzNywPLjqSOOU-E3jajQFw2Ef5ouYPpdQ@mail.gmail.com>
Subject: Re: UBI-FS Master Node failure
From: Richard Weinberger <richard.weinberger@gmail.com>
To: David J Myers <david.myers@amg-panogenics.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 22, 2015 at 10:01 AM, David J Myers
<david.myers@amg-panogenics.com> wrote:
> Guys,
> I have an embedded product running a system based on linux-2.6.29,
> originally from the IC supplier, but patched and modified to our spec.

That's a very old kernel. Did you backport *all* stable patches?

> Recently we have had two units go down with the same UBI-FS Master Node
> failure, both in LEB-2 at slightly different offsets. The console log looks
> like this:-
>
> [    6.645845] UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB
> 2:86016
> [    6.653268] UBIFS error (pid 1): ubifs_scanned_corruption: corrupted data
> at LEB 2:86016
> [    6.668163] UBIFS error (pid 1): ubifs_scan: LEB 2 scanning failed
> [    6.889661] UBIFS error (pid 1): ubifs_recover_master_node: failed to
> recover master node
> [    6.898497] List of all partitions:
> [    6.902188] 1f00             128 mtdblock0 (driver?)
> [    6.907218] 1f01             768 mtdblock1 (driver?)
> [    6.912314] 1f02             128 mtdblock2 (driver?)
> [    6.917318] 1f03            4096 mtdblock3 (driver?)
> [    6.922395] 1f04            4096 mtdblock4 (driver?)
> [    6.927397] 1f05           65536 mtdblock5 (driver?)
> [    6.932464] 1f06          184320 mtdblock6 (driver?)
> [    6.937455] No filesystem could mount root, tried:  ubifs
> [    6.942988] Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)
>
> I found two patches to fs/ubifs/recovery.c since 2.6.29 which I applied, but
> they did not fix the corrupted flash. These two patches were this one:-

I fear it is not that easy.  Maybe you're facing a different issue.
And if the data is already corrupted there is no guarantee that a UBIFS
recent UBIFS can fix it.

-- 
Thanks,
//richard
