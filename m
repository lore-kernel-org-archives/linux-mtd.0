Received: from mail-vn0-x22b.google.com ([2607:f8b0:400c:c0f::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmTR7-0002J0-BZ
 for linux-mtd@lists.infradead.org; Sun, 26 Apr 2015 20:45:57 +0000
Received: by vnbf129 with SMTP id f129so9653823vnb.9
 for <linux-mtd@lists.infradead.org>; Sun, 26 Apr 2015 13:45:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <006901d08012$3a1f97a0$ae5ec6e0$@codeaurora.org>
References: <006901d08012$3a1f97a0$ae5ec6e0$@codeaurora.org>
Date: Sun, 26 Apr 2015 22:45:33 +0200
Message-ID: <CAFLxGvyJDyN2-WJUkJ9wz5cCDvNjrUsbdpHrN4DH7S1gQoF2Yw@mail.gmail.com>
Subject: Re: planning general storage capacity for y fs
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Dolev Raviv <draviv@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
Cc: linux-ext4@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tanya Brokhman <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 26, 2015 at 1:14 PM, Dolev Raviv <draviv@codeaurora.org> wrote:
> Hi,
> I'm looking for guidelines for planning storage capacity. I understand it
> strongly depended on the usage type.
> I want to know at what point storage fullness is effecting performance in a
> standard read/write partition. Do different File Systems (UBIFS/EXT4) have
> different full-free ratio?
> What about read only fs? Can I plan less free space in such cases?
>
> I'll appreciate any input on this, for UBIFS specific and fs in general.

Not sure if I got your question.
You want to know how filesystems in general behave when they run out
of free space?
The general answer is that they need more effort to find free space.

In case of UBIFS you also have to think of the garbage collector.
See http://www.linux-mtd.infradead.org/doc/ubifs.html
At the end of the day you'll have to run benchmarks on your own to
find out how a specific filesystem behaves on your workload...

-- 
Thanks,
//richard
