Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnSIK-0003US-Qy
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 08:22:17 +0000
Message-ID: <4C722FAD.2030501@parrot.com>
Date: Mon, 23 Aug 2010 10:22:05 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
References: <4C4DEA3D.5070208@broadcom.com>
	<4C4F3691.9020505@broadcom.com>	<1282465255.16502.52.camel@brekeke>
	<AANLkTim-XofxxyZt6epCcoQN=PL0vFdT0vjmk_5D=soY@mail.gmail.com>
In-Reply-To: <AANLkTim-XofxxyZt6epCcoQN=PL0vFdT0vjmk_5D=soY@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

Kevin Cernekee a écrit :
> On Sun, Aug 22, 2010 at 1:20 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> I'm not picking this patch to my l2-mtd-2.6.git, since AFAICS the chips
>> support ONFI should be detected properly.
>>
>> The "older chips" which do not support reading ONFI data can then be
>> detected using special quirks. But using heuristics even for the chips
>> which do support reading ONFI data sounds bad.
> 
> The NAND controllers on certain legacy SoCs are not able to read the
> ONFI parameter page, even if the flash device itself supports ONFI.
Why ?
Are there controllers that doesn't allow to send custom command ?

Matthieu
