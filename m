Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZCtY-0005CA-7L
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 04:51:40 +0000
Message-ID: <5268A73C.7020800@ti.com>
Date: Thu, 24 Oct 2013 10:21:08 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3]Add quad/memory mapped support for SPI flash.
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
 <20131024002253.GZ23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131024002253.GZ23337@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: spi-devel-general@lists.sourceforge.net, broonie@kernel.org,
 dwmw2@infradead.org, balbi@ti.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Thanks for the reply.
On Thursday 24 October 2013 05:52 AM, Brian Norris wrote:
> Hi Sourav,
>
> I must admit, I missed some of this series due to a combination of
> strange Gmail filtering (I just learned that a filter for "PATCH"
> doesn't match "PATCHv3" in Gmail...) and the inconsistent naming in your
> patch series. (I see PATCH, PATCHv3, and RFC/PATCH.) I'll try to prevent
> that in the future.
>
Sorry for this, I tried to keep the tag according to the status of
the patch. I will try to be uniform in my patch subject.
> On Wed, Oct 09, 2013 at 08:54:41PM +0530, Sourav Poddar wrote:
>> This patch add quad/memory mapped support in flash driver(m25p80).
> Does "memory mapped" supoprt need to be in the same series as quad read
> support? Those are very different topics, it seems.
>
Yes, this are different topic and I can send you the quad support
seperately as a single patch ?
>> Added support for quad memory mapped for TI qspi controller also.
>>
>> This patch has been tested with some internal dts data.
> Your patches use new DT bindings which are not documented. If you are
> adding bindings, please document them in
> Documentation/devicetree/bindings/ and CC devicetree@vger.kernel.org.
> (You only need to CC them for the binding documenation, not necessarily
> all your code changes.)
Ok. I will take care of this.
> That being said, I'm not sure you need some of the bindings that you're
> using. I'll comment on the affected patch(es).
>
> Brian
