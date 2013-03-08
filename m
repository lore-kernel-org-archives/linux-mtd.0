MIME-Version: 1.0
In-Reply-To: <1362748785.5101.4.camel@sauron.fi.intel.com>
References: <1361978748-25281-1-git-send-email-shawn.guo@linaro.org>
 <1361978748-25281-8-git-send-email-shawn.guo@linaro.org>
 <1362748785.5101.4.camel@sauron.fi.intel.com>
Date: Fri, 8 Mar 2013 11:26:10 -0500
Message-ID: <CAMiH66EDjSAZLf-gtR-_kMasdKSKGRMrPThxtyw_RAixeNXHug@mail.gmail.com>
Subject: Re: [PATCH 07/12] mtd: gpmi: move to use generic DMA helper
From: Huang Shijie <shijie8@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Arnd Bergmann <arnd@arndb.de>,
 Marek Vasut <marek.vasut@gmail.com>, Vinod Koul <vinod.koul@intel.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 8, 2013 at 8:19 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2013-02-27 at 23:25 +0800, Shawn Guo wrote:
>> With the generic DMA device tree helper supported by mxs-dma driver,
>> client devices only need to call dma_request_slave_channel() for
>> requesting a DMA channel from dmaengine.
>>
>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>> Cc: Artem Bityutskiy <dedekind1@gmail.com>
>> Cc: linux-mtd@lists.infradead.org
>
> It looks like this ne is rather independent and can go via the MTD tree.
> So pushed this one to l2-mtd.git - let me know if I am confused. Thanks!
I suggest do not apply this patch. the whole patch set is still under
review now.

Best Regards
Huang Shijie

>
> --
> Best Regards,
> Artem Bityutskiy
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
