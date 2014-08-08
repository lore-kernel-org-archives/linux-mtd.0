Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFZbX-0008Ha-Fz
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 02:08:28 +0000
Received: by mail-vc0-f169.google.com with SMTP id le20so7560592vcb.14
 for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2014 19:08:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140807224618.GQ3711@ld-irv-0074>
References: <20140805135947.GA5593@localhost>
 <CAPDOMVgN=tc_o7E19ss4j5FAG4vpgUSzuUXYLSNGfpWCvPsAwA@mail.gmail.com>
 <20140807224618.GQ3711@ld-irv-0074>
Date: Thu, 7 Aug 2014 22:08:05 -0400
Message-ID: <CAPDOMVhv2nThm3Ka1BFQwn37+b9M_=RdZzQLK=u1rTJ3YdaXFQ@mail.gmail.com>
Subject: Re: [sbc_gxx] kernel BUG at include/linux/mtd/map.h:148!
From: Nick Krause <xerofoify@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Yuanhan Liu <yuanhan.liu@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Su Tao <tao.su@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Fengguang Wu <fengguang.wu@intel.com>, LKP <lkp@01.org>,
 Jet Chen <jet.chen@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 7, 2014 at 6:46 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi,
>
> On Tue, Aug 05, 2014 at 08:08:57PM -0400, Nick Krause wrote:
>> On Tue, Aug 5, 2014 at 9:59 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
>> > Hello,
>> >
>> > This is an old BUG that still lives in linux-next.
>> >
>> > [    4.284620] device id = 2670
>> > [    4.286157] SBC-GXx flash: IO:0x258-0x259 MEM:0xdc000-0xdffff
>> > [    4.287060] ------------[ cut here ]------------
>> > [    4.287722] kernel BUG at include/linux/mtd/map.h:148!
>> > [    4.288048] invalid opcode: 0000 [#1] PREEMPT SMP
>>
>> I am new , here and will try to trace your issue on linus's tree
>> unless there is a major difference between Linus's tree and
>> linux-next.
>> If there is please let me known before I start tracing this.
>
> This is a known issue, and Fengguang has reported this before:
>
>   http://lists.infradead.org/pipermail/linux-mtd/2014-March/053019.html
>
> I'm still not quite sure how to solve this one. It seems to be a
> limitation of the kconfig language.
>
> Brian


I am and banned from the lists but trying to get back on, if you want
my help please
let me known. I will read this bug report first but just tell me if
you want some help.
Cheers Nick
