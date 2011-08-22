MIME-Version: 1.0
In-Reply-To: <201108221320.55929.marek.vasut@gmail.com>
References: <1313581828-16625-1-git-send-email-b32955@freescale.com>
	<201108201346.21647.marek.vasut@gmail.com>
	<4E51E33C.8090800@freescale.com>
	<201108221320.55929.marek.vasut@gmail.com>
Date: Mon, 22 Aug 2011 09:41:36 -0400
Message-ID: <CAMiH66HL45x2dS2nxVtGBn8tuKUCmuD1e1uf82o8v2T9QO6h=Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] MTD : add helper functions library and header
	files for GPMI NAND driver
From: Huang Shijie <shijie8@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <b32955@freescale.com>, koen.beel.barco@gmail.com,
	linux-mtd@lists.infradead.org, w.sang@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Aug 22, 2011 at 7:20 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On Monday, August 22, 2011 07:03:56 AM Huang Shijie wrote:
>> Hi,
>>
>> > On Wednesday, August 17, 2011 01:50:27 PM Huang Shijie wrote:
>> >> bch-regs.h : registers file for BCH module
>> >> gpmi-regs.h: registers file for GPMI module
>> >> gpmi-lib.c: helper functions library.
>> >>
>> >> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> >> ---
>
> [...]
>
>> >> +err_out:
>> >> + =C2=A0return ret;
>> >> +}
>> >> +
>> >> +/* This is very useful! */
>> >
>> > Really? Cool, what for ?
>> > btw. this should really be enclosed in some #ifdef debug or whatnot.
>>
>> Yes, it shows the register contents when DMA timeout occurs.
>> this routine is called only when error occurs.
>>
> Hi,
>
> I'd expect exactly this explanation to be in the comment ;-)
>
ok, i will do it.

thanks
Huang Shijie

> Cheers
>
