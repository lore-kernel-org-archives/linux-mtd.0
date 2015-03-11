Received: from mail-vc0-x22b.google.com ([2607:f8b0:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVdcj-00037S-Hk
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 10:12:22 +0000
Received: by mail-vc0-f171.google.com with SMTP id hy10so2614621vcb.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2015 03:11:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANg6kwr1UmTDDoKBLXzuA_qnVcmnCWe+jjhy7tOqG0RTEj2r1A@mail.gmail.com>
References: <CANg6kwr1UmTDDoKBLXzuA_qnVcmnCWe+jjhy7tOqG0RTEj2r1A@mail.gmail.com>
Date: Wed, 11 Mar 2015 11:11:59 +0100
Message-ID: <CAFLxGvxe3Qze7ppYQYu_HCBDMDeLzX8cTG6P7PBVmgg4sweYGQ@mail.gmail.com>
Subject: Re: UBIFS power-cut testing
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Kurozaki m <kurozaki45@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 11, 2015 at 6:23 AM, Kurozaki m <kurozaki45@gmail.com> wrote:
> I really need to do power-cut testing in my device but there is no
> documentation on how to do this, just references to integck and the
> debugfs tst_recovery file. Where can I find a guide on how to actually
> do power-cut testing for UBIFS?
>
> I have a couple of mtd partitions in my flash device, and one of them
> I use to store some critical files. The problem is that sometimes
> after power failure(I think) it gets corrupted(Master node gets
> corrupted) and I'm not able to recover. What I did is I created a
> backup volume in the same UBI device so that I have both a data and
> backup volume, the critical files are backed up and kept in sync by an
> init script and in case corruption occurs I recreate the data
> partition and recover the files.
>
> I want to be able to test that my script actually works by doing
> power-cut testing emulations, but I have no idea where to begin. I
> cross compiled integck for my device and set the corresponding
> environment variables, but when I run it all I see is:
>
> pid is 2907
>
> and then nothing happens.

To trigger a powercut UBIFS has a debufs knob called "tst_recovery".

HTH!

-- 
Thanks,
//richard
