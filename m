Received: from qw-out-1920.google.com ([74.125.92.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYYJh-0005zz-Vm
	for linux-mtd@lists.infradead.org; Wed, 05 Aug 2009 04:41:38 +0000
Received: by qw-out-1920.google.com with SMTP id 5so2827353qwf.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 Aug 2009 21:41:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <9c9fda240908042124y4f783dfehd575601c0a09550e@mail.gmail.com>
References: <20090804092046.16025.83910.sendpatchset@rx1.opensource.se>
	<9c9fda240908042124y4f783dfehd575601c0a09550e@mail.gmail.com>
Date: Wed, 5 Aug 2009 13:41:32 +0900
Message-ID: <aec7e5c30908042141l18b25ba4l66b3cb309f080b21@mail.gmail.com>
Subject: Re: [PATCH] mtd: make onenand/generic.c more generic
From: Magnus Damm <magnus.damm@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-sh@vger.kernel.org, tony@atomide.com, lethal@linux-sh.org,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kyungmin!

> On Tue, Aug 4, 2009 at 6:20 PM, Magnus Damm<magnus.damm@gmail.com> wrote:
>> From: Magnus Damm <damm@igel.co.jp>
>>
>> This patch removes the ARM dependency from the generic "onenand"
>> platform device driver. This change makes the driver useful for
>> other architectures as well. Needed for the SuperH kfr2r09 board.

On Wed, Aug 5, 2009 at 1:24 PM, Kyungmin Park<kmpark@infradead.org> wrote:
> Good idea add the onenand_platform_data, but dont' agree the renaming
> the onenand-flash.
> Other boards are use it even though it's not released it

I suspected so. But this is the only reason why changed the name. =)

If we don't change the name then the platform device will be attached
to the platform driver as usual, but the old platform data structure
will use a different binary format compated to what the driver
expects.

Changing the driver name makes sure that the old device disappears and
that people can move over to the new name and at the same time update
the platform data to the new format.

> Others are good.

Thanks.

I can post an updated version where I keep the driver name unchanged
if you prefer that. But I'm pretty sure out-of-tree drivers will break
with NULL pointer accesses or similar if we update the platform data
format without changing the name. I don't think you want that. =)

Cheers,

/ magnus
