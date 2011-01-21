MIME-Version: 1.0
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B036A8DAF6C@dbde02.ent.ti.com>
References: <1295518680-8737-1-git-send-email-s-ghorai@ti.com>
	<AANLkTin3pRkqLkQ_J1iTtqr0M+iz5V25S9ZwJc9+T0VW@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B036A8DAF6C@dbde02.ent.ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 21 Jan 2011 13:07:44 +0530
Message-ID: <AANLkTi=0ZuG6i3x4uZ2+R8ZVmvmydrvK2zZQJbLoz=4L@mail.gmail.com>
Subject: Re: [PATCH] omap3: nand: bch ecc support added
To: "Ghorai, Sukumar" <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Kamat, Nishant" <nskamat@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 21, 2011 at 9:37 AM, Ghorai, Sukumar <s-ghorai@ti.com> wrote:
>
>> -----Original Message-----
>> From: Vimal Singh [mailto:vimal.newwork@gmail.com]
>> Sent: Thursday, January 20, 2011 8:47 PM
>> To: Ghorai, Sukumar
>> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
>> kernel@lists.infradead.org; Kamat, Nishant
>> Subject: Re: [PATCH] omap3: nand: bch ecc support added
>>
>> Hi Ghorai,
>>
>> I am the initial author of this patch. And I guess this patch still
>> uses most of my work.
> [Ghorai] I know you are working on it,
>
> But I think your code was in a shape for -
> 1. not for up-streamble shape
That's because I never posted it for up-stream.

> 2. non functional,
No, it was a working (at least for 8-bit correction) patch on that
kernel version (I do not remember the correct version now, may be
.29-.30)
It did not work for 4-bit, because of known reason. And I guess while
posting this patch you should also have mentioned/documented about
that. No?

> So can you check this version matching with your original code?
> In that case I can add your Signed-off.
Yes, you should. I can see this version has got many changes, but
original idea is same. And not all code is changed. Does it?

Regards,
Vimal
