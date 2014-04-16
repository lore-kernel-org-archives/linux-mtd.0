Message-ID: <1397625673.22465.8.camel@host5.omatika.ru>
Subject: Re: [PATCH v3 10/21] mtd: support BB SRAM on ICP DAS LP-8x4x
From: Sergei Ianovich <ynvich@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 16 Apr 2014 09:21:13 +0400
In-Reply-To: <20140416050449.GJ3131@norris-Latitude-E6410>
References: <1386901645-28895-1-git-send-email-ynvich@gmail.com>
 <1387309071-22382-1-git-send-email-ynvich@gmail.com>
 <1387309071-22382-11-git-send-email-ynvich@gmail.com>
 <20140416050449.GJ3131@norris-Latitude-E6410>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, "open
 list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
 Russell King <linux@arm.linux.org.uk>, Kees Cook <keescook@chromium.org>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>,
 Philip Avinash <avinashphilip@ti.com>, Kumar Gala <galak@codeaurora.org>,
 Grant Likely <grant.likely@linaro.org>, "open list:MEMORY
 TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-15 at 22:04 -0700, Brian Norris wrote:
> Hi Sergei,
> 
> On Tue, Dec 17, 2013 at 11:37:40PM +0400, Sergei Ianovich wrote:
> > This provides an MTD device driver for 512kB of battery backed up SRAM
> > on ICPDAS LP-8X4X programmable automation controllers.
> > 
> > SRAM chip is connected via FPGA and is not accessible without a driver,
> > unlike flash memory which is wired to CPU MMU.
> > 
> > This SRAM becomes an excellent persisent storage of volatile process
> > data like counter values and sensor statuses. Storing those data in
> > flash or mmc card is not a viable solution.
> > 
> > Signed-off-by: Sergei Ianovich <ynvich@gmail.com>
> > ---
> >    v2..v3
> >    * no changes (except number 08/16 -> 10/21)
> > 
> >    v0..v2
> >    * use device tree
> >    * use devm helpers where possible
> 
> What's the status of this series? Is the rest of this platform support
> going in via other trees yet? I have a few trivial comments, but this
> driver mostly looks good as-is.

(...)

> You'll need a (trivial) DT binding doc in
> Documentation/devicetree/bindings/ to go with this. You might also need
> to split the arch/arm/boot/dts/ stuff out to a separate patch, so the
> MTD driver can go in the MTD tree separate from the ARM tree bits.

(...)

> With that, you have my:
> 
> 	Reviewed-by: Brian Norris <computersforpeace@gmail.com>
> 
> and I can merge this to the MTD tree if/when you'd like.

Thanks for response, the rest of the series is stuck on a DMA driver
with no development activity. I'll fix the comments, separate ARM staff
and refile the patch.
