From: "R, Vignesh" <vigneshr@ti.com>
Subject: Re: [PATCH v5 3/5] mtd: devices: m25p80: add support for mmap read
 request
To: Mark Brown <broonie@kernel.org>
References: <1449807000-6457-1-git-send-email-vigneshr@ti.com>
 <1449807000-6457-4-git-send-email-vigneshr@ti.com>
 <20160209193616.GN13270@sirena.org.uk> <56BC1D3E.5020203@ti.com>
 <20160212223711.GD18988@sirena.org.uk> <56C2D731.6050306@ti.com>
 <20160216123854.GJ18327@sirena.org.uk>
CC: Tony Lindgren <tony@atomide.com>, Brian Norris
 <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@arm.linux.org.uk>,
 "hramrach@gmail.com" <hramrach@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>
Message-ID: <56C49B9E.8060506@ti.com>
Date: Wed, 17 Feb 2016 21:41:10 +0530
MIME-Version: 1.0
In-Reply-To: <20160216123854.GJ18327@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 02/16/2016 06:08 PM, Mark Brown wrote:
> On Tue, Feb 16, 2016 at 01:30:49PM +0530, Vignesh R wrote:
>> On 02/13/2016 04:07 AM, Mark Brown wrote:
>>> On Thu, Feb 11, 2016 at 11:03:50AM +0530, Vignesh R wrote:
>>>> On 02/10/2016 01:06 AM, Mark Brown wrote:
> 
>>>>> Looking at this I can't help but think that spi_flash_read() ought to
>>>>> have the stub in rather than the caller.  But given that we're pretty
>>>>> much only ever expecting one user I'm not 100% sure it actually matters.
> 
>>>> Well, my initial patch set passed long list of arguments to
>>>> spi_flash_read(), but Brian suggested to use struct[1] in order to avoid
>>>> unnecessary churn when things need changed in the API.
> 
>>> I don't see what that has to do with my point?
> 
>> AFAIU, your previous comment was to move initialization of
>> spi_flash_read_message struct to spi_flash_read(). This would mean
> 
> No, not at all.  I'm talking about how we handle the case where we don't
> have hardware support for this and need to implement it in software -
> currently that's in a separate place to the place where we call the
> driver.
> 

Yeah, but AFAIK, hardware accelerated read support is applicable for
m25p80 flashes only, I doubt whether spi_flash_read() will be used by
other types. I felt keeping the software implementation in m25p80_read()
will be consistent with m25p80_write().


-- 
Regards
Vignesh
