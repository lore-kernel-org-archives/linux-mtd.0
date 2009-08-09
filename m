Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma2qC-0004KG-6V
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 07:29:20 +0000
Message-ID: <4A7E7A59.3080501@gmail.com>
Date: Sun, 09 Aug 2009 10:27:21 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v3 26/27] [ARM] [NAND] [bcmring] add bcmring umi nand
	driver support
References: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25C53608@SJEXCHCCR02.corp.ad.broadcom.com>	<1247980139.11353.194.camel@localhost.localdomain>	<8628FE4E7912BF47A96AE7DD7BAC0AADCB25D06CCA@SJEXCHCCR02.corp.ad.broadcom.com>	<8628FE4E7912BF47A96AE7DD7BAC0AADCB25D06CDD@SJEXCHCCR02.corp.ad.broadcom.com>,
	<1249794985.9157.36.camel@localhost>
	<9383297B60843144AC17878B479520F1109ECFC740@SJEXCHCCR01.corp.ad.broadcom.com>
In-Reply-To: <9383297B60843144AC17878B479520F1109ECFC740@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.arm.linux.org.uk"
	<linux-arm-kernel@lists.arm.linux.org.uk>,
	"Leo \(Hao\) Chen" <leochen@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/09/2009 10:12 AM, Scott Branden wrote:
> Hi Artem,
>
> Thanks for the comments.
>
> This particular code (nand_bcm_umi.h) is shared between multiple
> OS's, simulation environments, and non-OS's.  As you are aware, this
> alone presents maintenance challenges.  The simplest approach was to
> make an include file and wrap that for each particular environment.
> We will look at splitting this into a C and H file.

Well, the idea is that include/linux/mtd the external MTD interface,
so you should put only the stuff which is about MTD<->other subsystems.
There are also headers that are about MTD core <-> MTD drivers interface.

So if you need to share something between different parts of your driver,
this should be rather in drivers/mtd/nand/, not in include/linux/mtd.

> The file passes Linux's checkpatch scripts.  I don't see a need for
> any further requirement?  It would be sad if a particular linux
> maintainer was stuck on other stylistic concerns because other
> maintainers are not.  Especially when this code is not specifically
> written for linux and is supported, tested, and maintained by us.

I do not have a strong opinion here, and I'm personally fine with this.
I mean, I do not mind if you ignore my /**...**/ and 'WindowsStyleVars'
comment.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
