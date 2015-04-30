Received: from mail-wg0-x242.google.com ([2a00:1450:400c:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnwAf-0005wh-I7
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 21:39:02 +0000
Received: by wggy19 with SMTP id y19so6041609wgg.3
 for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2015 14:38:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201504302043.11118.marex@denx.de>
References: <cover.1430403750.git.hramrach@gmail.com>
 <55132b4496e7fe73f949186c0f140f3e4fd4e2c7.1430403750.git.hramrach@gmail.com>
 <201504302043.11118.marex@denx.de>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 30 Apr 2015 23:37:58 +0200
Message-ID: <CAOMqctQes17hiccCfbX5=pnTkPv2H+MxkYaPFx-XkgmF+SiXfg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MTD: m25p80: fix write return value.
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Ben Hutchings <ben@decadent.org.uk>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30 April 2015 at 20:43, Marek Vasut <marex@denx.de> wrote:
> On Thursday, April 30, 2015 at 03:33:47 PM, Michal Suchanek wrote:
>> The size of written data was added to user supplied value rather than
>> written at the provided address.
>
> You might want to work on the commit message a little, something like
> the following, but feel free to reword as seen fit.
>
> The 'retlen' points to a variable representing the number of data bytes
> written/read (see include/linux/mtd/mtd.h) by the current invocation of
> the function. This variable must be set, not incremented.
>
> Otherwise, the patch is correct I believe:
>
> Acked-by: Marek Vasut <marex@denx.de>
>

ok, I will send an updated version.

Thanks

Michal
