Received: from mail-yk0-x22a.google.com ([2607:f8b0:4002:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbAua-0007gP-Sl
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 16:45:42 +0000
Received: by ykef74 with SMTP id f74so7687582yke.1
 for <linux-mtd@lists.infradead.org>; Thu, 26 Mar 2015 09:45:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <68AC191B3EB2874F99C36CD9CA3A6D42195CB0@cgpmbx01.comet.ch>
References: <68AC191B3EB2874F99C36CD9CA3A6D42195CB0@cgpmbx01.comet.ch>
Date: Thu, 26 Mar 2015 17:45:17 +0100
Message-ID: <CAFLxGvzqfmFqRLts5Swa-tintZzJksb6PsRXaNBX9KaRBpXMvg@mail.gmail.com>
Subject: Re: UBIFS corruption and UBI + unstable bit questions
From: Richard Weinberger <richard.weinberger@gmail.com>
To: "Morand, Guy" <Guy.Morand@comet.ch>
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

On Thu, Mar 26, 2015 at 5:00 PM, Morand, Guy <Guy.Morand@comet.ch> wrote:
> Hello UBI developers,
>
> I was wondering what happens to the UBI volume if an UBIFS partition gets
> corrupted:
> * Is only the partition corrupted?
> * Is the whole volume corrupted?

Can you please be more specific.
What exactly do you mean by "only the partition"?
Also what do you mean by "corrupted"?

If a filesystem is corrupted there is nothing you can do...
(By definition of corrupted)

> Moreover, about this "Unstable bit issue" ...
> * Does it still make sense to use UBI/UBIFS as it doesn't seem to be fully
>   power cut failsafe?

It all depends on how you define "fully power cut failsafe".
UBI/FS is not a magic bullet. People who *really* care about power cut safety
attack the problem also with their hardware.
e.g., by not using the cheapest NAND chip they can find. ;-)

> * Have you planned to fix this issue?

TBH nobody cared enough so far to either fix the issue on its own or
fund one of us UBI developers.

Are you able to trigger this problem?

-- 
Thanks,
//richard
