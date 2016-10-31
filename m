Received: from s159.web-hosting.com ([68.65.120.118])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1HoU-0004bo-Uf
 for linux-mtd@lists.infradead.org; Mon, 31 Oct 2016 19:00:08 +0000
Received: from mail-lf0-f50.google.com ([209.85.215.50]:35075)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.86_1) (envelope-from <jagan@openedev.com>)
 id 1c1Ho7-003Gh7-Lu
 for linux-mtd@lists.infradead.org; Mon, 31 Oct 2016 14:59:46 -0400
Received: by mail-lf0-f50.google.com with SMTP id f134so105665716lfg.2
 for <linux-mtd@lists.infradead.org>; Mon, 31 Oct 2016 11:59:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20161027201930.GA1582@localhost>
References: <aad52b708dcf6754edab87d2e0afe4f0ee6831f9.1476891131.git.cyrille.pitchen@atmel.com>
 <d92f8ef8-be78-0386-fa84-117c3cae6459@denx.de>
 <CAD6G_RRm0ttasw8DAQvE2fOpXd61tTsbNwyy_vJ_quAO0y3swA@mail.gmail.com>
 <20161027201930.GA1582@localhost>
From: Jagan Teki <jagan@openedev.com>
Date: Tue, 1 Nov 2016 00:29:41 +0530
Message-ID: <CAD6G_RQEgFbAgh25F8YE-gv66JV2qhUeb8pAVyEHzaXttgLF9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] MAINTAINERS: add a maintainer for the SPI NOR
 subsystem
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 boris.brezillon@free-electrons.com, nicolas.ferre@atmel.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 28, 2016 at 1:49 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi,
>
> On Fri, Oct 21, 2016 at 11:28:00PM +0530, Jagan Teki wrote:
>> On Thu, Oct 20, 2016 at 7:12 PM, Marek Vasut <marex@denx.de> wrote:
>> > On 10/19/2016 05:34 PM, Cyrille Pitchen wrote:
>> >> I would like to volunteer as a maintainer for the SPI NOR part of the MTD
>> >> subsystem.
>
> Thanks! I'll be happy to have the help.
>
> [...]
>
>> >> Also both Marek Vasut and Richard Weinberger have volunteered as well as
>> >> maintainers for the SPI NOR subsystem.
>
> Snipped all mention of Richard, since he did not volunteer :)
>
>> >> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> >> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> >
>> > Acked-by: Marek Vasut <marek.vasut@gmail.com>
>>
>> Acked-by: Jagan Teki <jteki@openedev.com>
>>
>> >
>> > btw I think I'll need higher privileges in patchwork to fiddle with patches.
>
> I expect you'll be mailing Jeremy soon then.
>
>> >> ---
>> >> ChangeLog:
>> >>
>> >> v1 -> v2:
>> >> - add Marek and Richard as maintainers.
>> >> - add Acked-by from Boris Brezillon.
>> >>
>> >>
>> >>  MAINTAINERS | 12 ++++++++++++
>> >>  1 file changed, 12 insertions(+)
>> >>
>> >> diff --git a/MAINTAINERS b/MAINTAINERS
>> >> index 757f9c4b388d..7e63b2015072 100644
>> >> --- a/MAINTAINERS
>> >> +++ b/MAINTAINERS
>> >> @@ -11390,6 +11390,18 @@ W:   http://www.st.com/spear
>> >>  S:   Maintained
>> >>  F:   drivers/clk/spear/
>> >>
>> >> +SPI NOR SUBSYSTEM
>> >> +M:   Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> >> +M:   Marek Vasut <marek.vasut@gmail.com>
>> >> +M:   Richard Weinberger <richard@nod.at>
>
> Snipped the above line, and pushed to linux-mtd.git.
>
>>
>> May be I was little late, but if there is any space for one more or so
>> I would also like to co-maintain? Currently I am maintaining
>> SPI/SPI-FLASH for u-boot and working for generic MTD (with u-boot
>> driver model) + SPI-NOR addition on u-boot which eventually similar
>> conceptual theory what Linux follows.
>
> I'd be happy to add more if the others think that it's warranted. If
> not, I'm sure all involved would still be happy with extra review, and
> that could serve nearly the same purpose, as long as the committers
> don't fall asleep like I admittedly have too often.

True Brian, hope I may heard something form Marek or Cyrille.

thanks!
-- 
Jagan.
