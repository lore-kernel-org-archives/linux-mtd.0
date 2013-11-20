Message-ID: <528D1DD6.9010808@ti.com>
Date: Wed, 20 Nov 2013 22:38:46 +0200
From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Grygorii Strashko
 <grygorii.strashko@ti.com>
Subject: Re: [PATCH 0/3] Reuse davinci-nand driver for Keystone arch
References: <1384964699-15134-1-git-send-email-ivan.khoronzhuk@ti.com>
 <528D18EC.6000501@ti.com> <528D1C94.7010100@ti.com>
In-Reply-To: <528D1C94.7010100@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Rob Landley <rob@landley.net>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/20/2013 10:33 PM, Santosh Shilimkar wrote:
> On Wednesday 20 November 2013 03:17 PM, Grygorii Strashko wrote:
>> On 11/20/2013 06:24 PM, Ivan Khoronzhuk wrote:
>>> This series contains updates of Davinci nand driver, in order to be
>>> reused for Keystone platform.
>>>
>>> Depends on:
>>> - Davinci nand driver fixes and updates:
>>>     https://lkml.org/lkml/2013/11/20/271
>>
>> ^^^^ I suggest to merge this series with above one as it
>> should not break anything.
>>
> I agree. That way the mtd patch series can go
> together nicely.
>
> Regards,
> Santosh
>

Ok, I will combine them

-- 
Regards,
Ivan Khoronzhuk
