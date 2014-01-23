MIME-Version: 1.0
In-Reply-To: <52D1494E.9090303@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <52D1494E.9090303@overkiz.com>
Date: Thu, 23 Jan 2014 09:22:16 -0600
Message-ID: <CAL_JsqJNd_gtn-cCLbZxT=s5NkkXp0DZkJkZrBhWiaL6Js=woQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] mtd: nand: add sunxi NAND Flash Controller support
From: Rob Herring <robherring2@gmail.com>
To: boris brezillon <b.brezillon@overkiz.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Russell King <linux@arm.linux.org.uk>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, dev@linux-sunxi.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>,
 Grant Likely <grant.likely@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
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

On Sat, Jan 11, 2014 at 7:38 AM, boris brezillon
<b.brezillon@overkiz.com> wrote:
> On 08/01/2014 15:21, Boris BREZILLON wrote:
>>
>> Hello,
>>
>> This series add the sunxi NFC support with up to 8 NAND chip connected.
>> I'm still in the early stages drivers development and some key features
>> are
>> missing, but it's usable (I tested it on the cubietruck board).
>>
>> Here's what's missing:
>>   - HW ECC support
>>   - DMA support
>>   - HW randomization support
>>   - many more improvements
>>
>> This series depends on Emilio's patch series implementing mod0 clks
>>
>> (http://lists.infradead.org/pipermail/linux-arm-kernel/2013-July/185478.html)
>> + an other patch not yet posted
>>
>> (http://git.elopez.com.ar/linux/commits/5b4eb3ac406b9c98965714d40e8dd6da943d1ab0)
>
>
> During my reasearch regarding the HW ECC and HW randomizer of the Allwinner
> NAND flash controller I found this document describing the Altera NAND flash
> controller
> (which is in turn based on a cadence IP):

Which may be similar to drivers/mtd/nand/denali.c as Cadence bought Denali?

Rob
