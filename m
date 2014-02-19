Message-ID: <5304E41F.4080205@ti.com>
Date: Wed, 19 Feb 2014 19:04:31 +0200
From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 1/2] memory: ti-aemif: introduce AEMIF driver
References: <1391629574-18955-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1391629574-18955-2-git-send-email-ivan.khoronzhuk@ti.com>
 <20140218203049.GA18647@kroah.com> <53048822.2080307@ti.com>
 <20140219143403.GA31063@kroah.com>
In-Reply-To: <20140219143403.GA31063@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 linux@arm.linux.org.uk, pawel.moll@arm.com, swarren@wwwdotorg.org,
 ijc+devicetree@hellion.org.uk, nsekhar@ti.com, galak@kernel.crashing.org,
 rob.herring@calxeda.com, linux-kernel@vger.kernel.org,
 "\[initial author\] Murali Karicheri" <m-karicheri2@ti.com>,
 santosh.shilimkar@ti.com, rob@landley.net, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 02/19/2014 04:34 PM, Greg KH wrote:
> On Wed, Feb 19, 2014 at 12:32:02PM +0200, Ivan Khoronzhuk wrote:
>>>> +	aemif->clk = devm_clk_get(dev, NULL);
>>>> +	if (IS_ERR(aemif->clk)) {
>>>> +		dev_err(dev, "cannot get clock 'aemif'\n");
>>>> +		return PTR_ERR(aemif->clk);
>>> No freeing memory?
>> There is no need to free memory explicitly.
>> devm_kzalloc is used instead of kzalloc.
> Yes, but where does the device on the error path get removed?

Why these functions are needed in that case...

As I see, memory allocated with these functions
are automatically freed on driver detach.

Additionally I've checked if resources are released after
AEMIF driver probe error.
And they're released completely in case of probe error.

:-\

-- 
Regards,
Ivan Khoronzhuk
