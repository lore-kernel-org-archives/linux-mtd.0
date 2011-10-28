Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RJkyX-00057Q-Ir
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 11:51:54 +0000
Message-ID: <4EAA973F.8060104@parrot.com>
Date: Fri, 28 Oct 2011 13:51:27 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Javier Martinez Canillas <martinez.javier@gmail.com>
Subject: Re: [RFC] Change ECC algorithm from userspace
References: <CAAwP0s059H3BGhYbYLux2gR6ZNb+sFDue676OM2Evz5cA2q6DA@mail.gmail.com>
	<4EAA845B.1020009@parrot.com>
	<CAAwP0s32AJCm_AjxubDSu8ikzhXeRWUqqsPrBmygUHPkRvtv8g@mail.gmail.com>
In-Reply-To: <CAAwP0s32AJCm_AjxubDSu8ikzhXeRWUqqsPrBmygUHPkRvtv8g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Javier Martinez Canillas a écrit :
> On Fri, Oct 28, 2011 at 12:30 PM, Matthieu CASTET
> <matthieu.castet@parrot.com> wrote:
>> PS : note that some OMAP ROM support a better protection than Hamming (but the
>> details are not public AFAIK)
>>
>> From OMAP34xx Multimedia Device, Silicon Revision 3.1.x, public version :
>>
>> Pages can contain errors caused by memory alteration. To correct these errors,
>> the ROM code uses ECC,
>> based on Hamming codes for SLC NAND and BCH (Bose, Ray-Chaudhuri, Hocquenghem)
>> code for
>> multilevel cell (MLC) devices. The computed ECC is compared to ECC stored in the
>> spare area of the
>> corresponding page. If there are uncorrectable errors, the ROM code returns with
>> FAIL.
>>
>
> Yes I've read that on the DM3730 TRM but as far as I understand only
> applies to MLC devices, but ours is SLC.
>
It also works on SLC devices. We are using it on micron slc that need 4 bits ECC.


Matthieu
