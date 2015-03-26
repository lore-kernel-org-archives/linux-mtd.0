Received: from mail-yh0-x22b.google.com ([2607:f8b0:4002:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yb5gR-0005i0-Ip
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 11:10:45 +0000
Received: by yhpt93 with SMTP id t93so24454142yhp.0
 for <linux-mtd@lists.infradead.org>; Thu, 26 Mar 2015 04:10:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyG38+dQZXyFeGF3nru71bPR0VU_0ZTKJmmdVh96txqGA@mail.gmail.com>
References: <CAFLxGvy6bnPnzZyGXiAN8Jq54E7CDpF5CmvLzkAuuMn8jdUbmQ@mail.gmail.com>
 <1422789058-4595-1-git-send-email-david.oberhollenzer@sigma-star.at>
 <CAFLxGvyG38+dQZXyFeGF3nru71bPR0VU_0ZTKJmmdVh96txqGA@mail.gmail.com>
Date: Thu, 26 Mar 2015 12:10:21 +0100
Message-ID: <CAFLxGvw+rrQ3qRYoVC52Tszo__TBxU8Yv23x-SP_yEeppf4=Mg@mail.gmail.com>
Subject: Re: [PATCH] UBI: power cut emulation for testing
From: Richard Weinberger <richard.weinberger@gmail.com>
To: david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 26, 2015 at 9:55 AM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Sun, Feb 1, 2015 at 12:10 PM,  <david.oberhollenzer@sigma-star.at> wrote:
>> From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>>
>> Emulate random power cuts by switching device to ro after a number of
>> writes to allow simple power cut testing with nand-sim.
>>
>> Maximum and minimum number of successful writes before power cut and
>> what kind of writes (EC header, VID header or none) to interrupt
>> configurable via debugfs.
>>
>> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
>
> Applied, thanks David!

Sorry, had to drop this patch.
power_cut_counter is of type unsigned int, but you treat it as signed
integer by using negative
numbers. Please clarify and resend.

-- 
Thanks,
//richard
