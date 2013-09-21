Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VNVwy-0008Nb-Ey
 for linux-mtd@lists.infradead.org; Sat, 21 Sep 2013 22:46:53 +0000
Received: by mail-vc0-f181.google.com with SMTP id hz10so1218156vcb.26
 for <linux-mtd@lists.infradead.org>; Sat, 21 Sep 2013 15:46:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7c74c0d714e8e87daebbfd0163642d71@localhost>
References: <mailman.6.1379692801.23497.linux-mtd@lists.infradead.org>
 <7c74c0d714e8e87daebbfd0163642d71@localhost>
Date: Sun, 22 Sep 2013 00:46:29 +0200
Message-ID: <CAFLxGvwvoeyhDDD=WqEpw59f8WKKujQo7Pg8mcJOev-7oN-_CQ@mail.gmail.com>
Subject: Re: Patching mkfs.ubifs.c for running under Windows ?
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: gutemine <gutemine@oozoon.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 21, 2013 at 12:58 PM, gutemine <gutemine@oozoon.de> wrote:
> Hi!
>
> I'm the author of ubidump, the first real ubifs image extract tool.
> ubidump allows to extract ubifs images created by mkfs.ubifs and also ubifs
> volumes created by ubinize.

Where did you hide it?
Sounds interesting...

> ubidump works without any nandsim, block2mtd or mtdram modules and doesn't
> mount the image at all. Therefore it runs nicely on both Linux and Windows
> as it is written in pure C and doesn't use any mtd-utils code or includes.
>
> Live under Linux was easy, but I took the challange to make it run under
> Windows too, because there it was not possible to mount and extract an
> ubifs image until now.
>
> ubidump under Windows supports Hard and Symlinks by using the native NTFS
> functionality. Only device files and pipes are written as simple text files
> containing the needed information for a re-pack (eg. char or block device
> and major and minor number).
>
> As users of ubidump under Windows now asked me for getting also the
> possibility to re-pack their extracted ubifs images, I'm considering to
> patch mkfs.ubifs.c, so that it handles also the Windows hard and softlinks
> and my dummy device files correctly.
>
> My question is now, if it would be OK to add these changes to the standard
> mkfs.ubifs.c (off cource nicely wrapped in #ifdef WINDOWS statements so
> that these changes don't do any harm when compiled on other plattforms) and
> send you the diff, or if I should create an extra open source tool based on
> the existing mkfs.ubifs.c code.

-ENOPATCH. :-)

IOW, we need to review it first.

-- 
Thanks,
//richard
