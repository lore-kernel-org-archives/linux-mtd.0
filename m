Message-ID: <531E7E0D.6080605@atmel.com>
Date: Tue, 11 Mar 2014 11:07:57 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] Disable Subpage nand write when using Atmel PMECC
References: <1393845329-18175-1-git-send-email-Herve.CODINA@celad.com>
 <53194432.50104@atmel.com> <20140307080251.GI31517@norris-Latitude-E6410>
In-Reply-To: <20140307080251.GI31517@norris-Latitude-E6410>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Herve Codina <Herve.CODINA@celad.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Brian

On 3/7/2014 4:02 PM, Brian Norris wrote:
> On Fri, Mar 07, 2014 at 11:59:46AM +0800, Josh Wu wrote:
>> On 3/3/2014 7:15 PM, Herve Codina wrote:
>>> Crash detected on sam5d35 and its pmecc nand ecc controller.
>>>
>>> The problem was a call to chip->ecc.hwctl from nand_write_subpage_hwecc
>>> (nand_base.c) when we write a sub page.
>>> chip->ecc.hwctl function is not set when we are using PMECC controller.
>>> As a workaround, set NAND_NO_SUBPAGE_WRITE for PMECC controller in
>>> order to disable sub page access in nand_write_page.
>>>
>>>
>>> Signed-off-by: Herve Codina <Herve.CODINA@celad.com>
>> Acked-by: Josh Wu <josh.wu@atmel.com>
> Pushed to l2-mtd.git. Thanks!

Sorry for the later thought. But I think this patch should go to the 
stable Linux branch
since any subpage write will cause crash in SAMA5D3 and AT91SAM9X5.
So is it possible to add a tag: "Cc: stable@vger.kernel.org" for this 
commit?

Best Regards,
Josh Wu

>
> Brian
