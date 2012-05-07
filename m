Message-ID: <4FA7F473.7060607@ti.com>
Date: Mon, 7 May 2012 11:12:35 -0500
From: Jon Hunter <jon-hunter@ti.com>
MIME-Version: 1.0
To: "Mohammed, Afzal" <afzal@ti.com>
Subject: Re: [PATCH v4 02/39] ARM: OMAP2+: gpmc: Adapt to HWMOD
References: <cover.1335874494.git.afzal@ti.com>
 <e0cf9678cb9a44d2a16401383ab8496eb825c291.1335874494.git.afzal@ti.com>
 <4FA04A8C.4050703@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E98299B@DBDE01.ent.ti.com>
 <4FA4041D.9010000@ti.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E987159@DBDE01.ent.ti.com>
In-Reply-To: <C8443D0743D26F4388EA172BF4E2A7A93E987159@DBDE01.ent.ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: "Hilman, Kevin" <khilman@ti.com>, "Menon, Nishanth" <nm@ti.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "Balbi,
 Felipe" <balbi@ti.com>, "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "vimal.newwork@gmail.com" <vimal.newwork@gmail.com>,
 "grinberg@compulab.co.il" <grinberg@compulab.co.il>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "notasas@gmail.com" <notasas@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Afzal,

On 05/07/2012 06:02 AM, Mohammed, Afzal wrote:
> Hi Jon,
> 
> On Fri, May 04, 2012 at 22:00:21, Hunter, Jon wrote:
>>>>> +
>>>>> +	pdata->clk_prd = gpmc_get_fclk_period();
>>>>
>>>> Does this need to be done here? May be this should be done in the probe
>>>> function. You could store the handle to the main clk in the pdata.
>>>
>>> This is done so that migration of gpmc driver to the drivers folder
>>> would be smooth, remember that this function will still live here.
>>
>> Sure, but why call this here?
> 
> Clk_prd is a platform data passed to the driver, so platform code
> updates it, where else can it be done ?

The point is that you can pass what ever you like. You do not need to
pass the frequency you can pass the clock handle instead.

What happens it the clk_get() of the gpmc_l3_clk fails during the init?

In fact if you migrate to runtime pm then we should not have the clk_get
in the gpmc_init any more.

Jon
