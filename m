Message-ID: <507421FF.2090309@ti.com>
Date: Tue, 9 Oct 2012 18:39:19 +0530
From: Sekhar Nori <nsekhar@ti.com>
MIME-Version: 1.0
To: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 1/1] mtd:nand:clk: preparation for switch to common clock
 framework
References: <1347899860-24358-1-git-send-email-m-karicheri2@ti.com>
 <1347899860-24358-2-git-send-email-m-karicheri2@ti.com>
 <507420A4.8090905@ti.com>
In-Reply-To: <507420A4.8090905@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com, mikedunn@newsguy.com,
 artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, hs@denx.de, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/9/2012 6:33 PM, Sekhar Nori wrote:
> On 9/17/2012 10:07 PM, Murali Karicheri wrote:
>> As a first step towards migrating davinci platforms to use common clock
>> framework, replace all instances of clk_enable() with clk_prepare_enable()
>> and clk_disable() with clk_disable_unprepare(). Until the platform is
>> switched to use the CONFIG_HAVE_CLK_PREPARE Kconfig variable, this just
>> adds a might_sleep() call and would work without any issues.
>>
>> This will make it easy later to switch to common clk based implementation
>> of clk driver from DaVinci specific driver.
>>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> Reviewed-by: Mike Turquette <mturquette@linaro.org>
> 
> Tested this using NAND flash on DA850 EVM.
> 
> Acked-by: Sekhar Nori <nsekhar@ti.com>
> 
> Any chance this can make into the v3.7 kernel?

Just noticed another thread where Artem replied saying this patch is
pushed. Sorry about the noise.

Thanks,
Sekhar
