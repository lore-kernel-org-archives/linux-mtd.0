Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW4U5-00067y-Ga
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 11:07:22 +0000
Message-ID: <4ED75FD0.3050704@newsguy.com>
Date: Thu, 01 Dec 2011 03:06:56 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/5] mtd api changed to return bitflips on read operations
References: <1322528477-19666-1-git-send-email-mikedunn@newsguy.com>
 <1322729362.2332.15.camel@koala>
In-Reply-To: <1322729362.2332.15.camel@koala>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jamie Iles <jamie@jamieiles.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Andres Salomon <dilinger@queued.net>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Sukumar Ghorai <s-ghorai@ti.com>, Olof Johansson <olof@lixom.net>,
 Vimal Singh <vimal.newwork@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/01/2011 12:49 AM, Artem Bityutskiy wrote:
> Hi,
>
> thanks you, a nit-pick below.
>
> On Mon, 2011-11-28 at 17:01 -0800, Mike Dunn wrote:
>>   * @datbuf:	data buffer - if NULL only oob data are read/written
>>   * @oobbuf:	oob data buffer
>> + * @max_bitflips: for read operations, greatest number of bit errors corrected
>> + *                on any one minimum i/o unit (e.g., nand page)
>> + *                (value returned to caller by the driver)
>>   *
> Could you please make this change in the comment: s/greatest/maximum/ -
> I find it easier to understand that way and it is more consistent with
> the variable name.
>
>


Sure.  I'm a fan of clarity myself.

Thanks,
Mike
