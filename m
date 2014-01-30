Message-ID: <52EA116E.3030100@gmail.com>
Date: Thu, 30 Jan 2014 09:46:38 +0100
From: boris brezillon dev <b.brezillon.dev@gmail.com>
MIME-Version: 1.0
To: =?UTF-8?B?SGVucmlrIE5vcmRzdHLDtm0=?= <henrik@henriknordstrom.net>,
 linux-sunxi@googlegroups.com
Subject: Re: [linux-sunxi] Re: [RFC PATCH v2 09/14] mtd: nand: add sunxi NFC
 dt bindings doc
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>	
 <1391006064-28890-10-git-send-email-b.brezillon.dev@gmail.com>	
 <CAL_JsqLVr1gSLArqtfOiHce+u6ZK8FiKMX0o9bvMrMoGGhATvg@mail.gmail.com>
 <1391035079.14902.3.camel@localhost>
In-Reply-To: <1391035079.14902.3.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, dev@linux-sunxi.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>,
 Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Henrik,

Sorry for the noise, I sent the mail to Rob's old address.

On 29/01/2014 23:37, Henrik Nordström wrote:
> ons 2014-01-29 klockan 11:11 -0600 skrev Rob Herring:
>
>> Isn't allwinner,rb implied by a lack of rb-gpios property. Or no R/B
>> pin is an option? If so, don't you need some fixed time delay
>> properties like max erase time?
>>
>> rb-gpios could be added to the generic nand binding as well.
> The Allwinner NAND controller have dedicated RB pins when NAND is
> enabled, only MUXed with other functions when NAND is not enabled.
>
> Leaving RB unconnected is not a valid hardware configuration. The
> controller internal timing engine depends on being able to sense RB to
> sequence NAND commands properly.

This is not true (at least in this driver). It was in yuq's driver because
he was using the NFC_WAIT_FLAG ,and in this case the controller wait
for the native R/B pin to be high before considering the CMD is complete.

This driver choose the appropriate way to test the R/B state of the
NAND chip according to what was specified in the DT:
- allwinner,rb: native R/B id. These pins will be used by the NAND
   controller to test the R/B state. Only 0 and 1 are valid because the
   NAND controller only support 2 R/B pins.
- rb-gpios: gpio used for R/B tests. This is a simple GPIO and will
   use the GPIO subsystem to test the R/B pin state.
- none: the NAND base code will wait some time before and send
   STATUS cmd to the NAND to check its status.

BTW, the controller supports 8 CS (8 NAND chips), but only have 2 native
R/B pins, this means you'll have to use the GPIO or standard GET_STATUS
method if you connect 3 or more NAND chips.

And for the record, I still think the rb-gpios property (or whatever
common name you choose: nand-rb-gpios ?) should be part of
the generic NAND binding, because other controllers (at least the
atmel one :)) use GPIOs to test R/B state.

Best Regards,

Boris

>
> Regards
> Henrik
>
