Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUkzB-00015L-Ad
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 22:15:05 +0000
Received: by mail-ob0-f169.google.com with SMTP id wp4so3250688obc.14
 for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2013 15:14:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20131011214653.GA29913@atomide.com>
References: <1381498603-15715-1-git-send-email-pekon@ti.com>
 <1381498603-15715-7-git-send-email-pekon@ti.com>
 <20131011181515.GJ23337@ld-irv-0074.broadcom.com>
 <20131011182840.GW29913@atomide.com>
 <CAN8TOE9S63a1YdtzS+urTGBoMqrhq83cXXEeGinvQi9=dyUX1Q@mail.gmail.com>
 <20131011214653.GA29913@atomide.com>
Date: Fri, 11 Oct 2013 15:14:43 -0700
Message-ID: <CAN8TOE-0e+7211_c-Ao6RwP22ttKLSfVS54RQjHBiQxFtwS6PQ@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] mtd: nand: omap: updated devm_xx for all resource
 allocation and free calls
From: Brian Norris <computersforpeace@gmail.com>
To: Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Avinash Philip <avinashphilipk@gmail.com>, "Balbi, Felipe" <balbi@ti.com>,
 Rob Herring <robherring2@gmail.com>, Pekon Gupta <pekon@ti.com>,
 Benoit Cousson <bcousson@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 11, 2013 at 2:46 PM, Tony Lindgren <tony@atomide.com> wrote:
> * Brian Norris <computersforpeace@gmail.com> [131011 12:35]:
>> On Fri, Oct 11, 2013 at 11:28 AM, Tony Lindgren <tony@atomide.com> wrote:
>> >
>> > FYI, the .dts changes should be queued separately by Benoit to avoid
>> > pointless merge conflicts. The arch/arm/mach-omap2/gpmc.c changes I
>> > need to look, hopefully I can ack those for you today so you can take
>> > the code related changes into the MTD tree.
>>
>> Why are you replying to this patch, instead of the DTS?
>
> Because you said you might merrge some parts of the series and I've
> seen many merge cycles of pointless merge conflicts with driver
> maintainers merging .dts files along with the driver changes? :)

Sure, thanks for pointing this out. I may have fallen into that myself.

> Pekon, can please post the .dts changes entirely separately from
> the driver changes in the future?
>
>> Also, I don't think all of this code is ready. There are several
>> comments from weeks ago that Pekon hasn't addressed. It's possible the
>> DT binding changes can go in, but not some of the later patches, yet.
>
> Yes that's up to you. I have not looked at the MTD parts and I
> appreciate the fact that you are reviewing that stuff. I've acked
> the arch/arm/*omap* parts so hopefully I'm out of the loop now.

Yes, I think so. The MTD stuff is the only remaining weak point I see.

Brian
