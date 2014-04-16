Message-ID: <534E51BF.9050508@ti.com>
Date: Wed, 16 Apr 2014 12:47:43 +0300
From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: davinci-nand: disable subpage write for
 keystone-nand
References: <1395346112-13350-1-git-send-email-ivan.khoronzhuk@ti.com>
 <532B4C36.8060405@ti.com> <5343F0D6.2010804@ti.com>
 <20140416070833.GA5512@norris-Latitude-E6410>
In-Reply-To: <20140416070833.GA5512@norris-Latitude-E6410>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Santosh Shilimkar <santosh.shilimkar@ti.com>, m-karicheri2@ti.com,
 rob@landley.net, galak@codeaurora.org, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, Warner Losh <imp@bsdimp.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 04/16/2014 10:08 AM, Brian Norris wrote:
> On Tue, Apr 08, 2014 at 03:51:34PM +0300, Ivan Khoronzhuk wrote:
>> On 03/20/2014 10:14 PM, Santosh Shilimkar wrote:
>>> On Thursday 20 March 2014 04:08 PM, Ivan Khoronzhuk wrote:
>>>> From: Murali Karicheri <m-karicheri2@ti.com>
>>>> Sub page write doesn't work because of hw issue in controller found on
>>>> Keystone SOCs. AEMIF controller is also used on DaVinci SOCs which
>>>> don't seems to have any issue. So add "ti,keysone-nand" compatible
>>>> to nand driver in order to set NAND_NO_SUBPAGE_WRITE option.
>>>>
>>>> Cc: Brian Norris <computersforpeace@gmail.com>
>>>> Cc: Warner Losh <imp@bsdimp.com>
>>>> Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
>>>>
>>>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>>>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
>>>> ---
>>>>
>>> Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
>> Brian,
>> Could you pick up subj patch?
> Pushed to l2-mtd.git. Is it critical this goes in for 3.15? It's
> currently queued for -next (3.16).
>
> Brian

This is a critical fix and it should be for 3.15.
Thanks.

-- 
Regards,
Ivan Khoronzhuk
