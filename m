Received: from mail-by2on0068.outbound.protection.outlook.com ([207.46.100.68]
 helo=na01-by2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAkPw-0006MY-Nv
 for linux-mtd@lists.infradead.org; Mon, 12 Jan 2015 19:12:50 +0000
Message-ID: <54B41BED.5090809@opensource.altera.com>
Date: Mon, 12 Jan 2015 13:09:33 -0600
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH V2 2/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
References: <1420564094-1086-1-git-send-email-grmoore@opensource.altera.com>
 <1420564094-1086-2-git-send-email-grmoore@opensource.altera.com>
 <54AD31F8.4050100@vanguardiasur.com.ar>
 <CAL_Jsq+nbZMnJZ=Wm--DODWRXm5aqEJ_7BVDuET9oSXJaJtWug@mail.gmail.com>
In-Reply-To: <CAL_Jsq+nbZMnJZ=Wm--DODWRXm5aqEJ_7BVDuET9oSXJaJtWug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Alan Tull <atull@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Kumar Gala <galak@codeaurora.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 01/08/2015 04:30 PM, Rob Herring wrote:
>
> This controller only works with flash devices and is different than this one:?
>
> Documentation/devicetree/bindings/spi/spi-cadence.txt
>

Yes, it is a different controller and is for flash only.  The docs call 
it the "QSPI Flash Controller".
...

>
> The above binding already uses "is-decoded-cs". Let's not invent something new.
>

OK.
...

>
>>> +- cdns,tshsl-ns : Delay in master reference clocks for the length that the master mode chip select outputs are de-asserted between transactions.
>>> +- cdns,tsd2d-ns : Delay in master reference clocks between one chip select being de-activated and the activation of another.
>>> +- cdns,tchsh-ns : Delay in master reference clocks between last bit of current transaction and deasserting the device chip select (qspi_n_ss_out).
>>> +- cdns,tslch-ns : Delay in master reference clocks between setting qspi_n_ss_out low and first bit transfer.
>
> Aren't these properties probeable at all? We really should have
> standard bindings for this. It seems spi NOR flash devices have gone
> somewhat undocumented, but it is not hard to find examples already in
> use.
>

They are not probeable, afaik.  I don't see these values in any 
probeable info block in the datasheet, only in the AC params table.

I can't find an example of these timing parameters, do you have one in mind?

> Is it master reference clocks or nanoseconds for the units?

Yeah, they are actually nanoseconds in the dts, converted to clocks in 
the driver.  I'll change the docs.

...

Thanks,
Graham
