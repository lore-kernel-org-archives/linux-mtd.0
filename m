Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b61es-0005jg-OH
 for linux-mtd@lists.infradead.org; Thu, 26 May 2016 20:13:31 +0000
Received: by mail-wm0-x244.google.com with SMTP id q62so8596950wmg.3
 for <linux-mtd@lists.infradead.org>; Thu, 26 May 2016 13:13:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160518012445.GA74128@google.com>
References: <1462494716-95312-1-git-send-email-computersforpeace@gmail.com>
 <CAOMqctQLichyA3g_6K9UY8N8CY3GLvvP=_zqz+kUphRw3vxqZA@mail.gmail.com>
 <20160518012445.GA74128@google.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 26 May 2016 22:12:29 +0200
Message-ID: <CAOMqctQco67=UZXsrk8CZhy5BuNrcg_woeaVrECNV_RcXBccOA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] Add error checking to spi-nor read and write
To: Brian Norris <computersforpeace@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Han Xu <han.xu@nxp.com>, Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Rafal Milecki <zajec5@gmail.com>,
 Jagan Teki <jteki@openedev.com>, "Andrew F. Davis" <afd@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Bean Huo <beanhuo@micron.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 18 May 2016 at 03:24, Brian Norris <computersforpeace@gmail.com> wrote:
> On Mon, May 16, 2016 at 09:47:20PM +0200, Michal Suchanek wrote:
>> Hello,
>>
>> On 6 May 2016 at 02:31, Brian Norris <computersforpeace@gmail.com> wrote:
>> > Hi,
>> >
>> > I'm picking up Michal's patch set, since he dropped it on the floor, and it's
>> > useful for others. My additions:
>> >
>> >  * rebased on latest
>> >  * added fixes for drivers that have been merged in the meantime
>> >  * addressed most of Heiner's comments
>> >
>>
>> Since that offset error slipped into the previous rebase I was
>> planning to do some more thorough testing before resubmit but did not
>> get to it yet.
>>
>> Thanks for picking this up.
>
> No problem. If you get the chance, one or more of
> {Reviewed,Tested,Acked}-by would be helpful.
>

I did not get to look at the new changes in detail.
Acked-by: Michal Suchanek <hramrach@gmail.com>
Tested-by: Michal Suchanek <hramrach@gmail.com> on the parts which are
not vendor-specific.

I used spi-sun4i with m25p80 driver.

Thanks

Michal
