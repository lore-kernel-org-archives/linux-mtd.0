Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1emjmt-0001lo-N4
 for linux-mtd@lists.infradead.org; Fri, 16 Feb 2018 17:27:09 +0000
Received: by mail-pg0-x241.google.com with SMTP id j9so2927429pgv.3
 for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2018 09:26:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1802161822560.4340@hadrien>
References: <cover.1518797480.git.shreeya.patel23498@gmail.com>
 <CAAEAJfAg_hei2PF37_oX2tf+Mv43ye-nEOt+KRVFerp1Jfzn2Q@mail.gmail.com>
 <alpine.DEB.2.20.1802161822560.4340@hadrien>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 16 Feb 2018 14:26:56 -0300
Message-ID: <CAAEAJfAtvm5bii9eyUnYmU=tQCOvE_hPk0eBJQ1vwgogbGYr-A@mail.gmail.com>
Subject: Re: [Outreachy kernel] Re: [PATCH NAND 0/5] Replace printk statements
 with pr_*macros
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Shreeya Patel <shreeya.patel23498@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 outreachy-kernel <outreachy-kernel@googlegroups.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 February 2018 at 14:23, Julia Lawall <julia.lawall@lip6.fr> wrote:
>
>
> On Fri, 16 Feb 2018, Ezequiel Garcia wrote:
>
>> Hi Shreeya,
>>
>> Thanks for the contribution.
>>
>> On 16 February 2018 at 13:50, Shreeya Patel
>> <shreeya.patel23498@gmail.com> wrote:
>> > This patchset removes all the log levels i.e. KERN_WARN,
>> > KERN_NOTICE, KERN_ERR, KERN_INFO, KERN_DEBUG used in the printk
>> > statements and replaces the printk statements with appropriate
>> > pr_*macros.
>> > According to the kernel coding style, pr_*macro is the preferred
>> > way to print the message.
>> >
>>
>> So, two things to begin with.
>>
>> First of all, despite this contribution being part of outreachy,
>> I believe you can include mailing lists in your case.
>>
>> In other words, don't use the "nol" option in get_maintainer
>> script and Cc the MTD mailing list: linux-mtd at lists.infradead.org.
>
> Shouldn't the dev_* functions also be usable?
>

Provided that:
1. it's applicable, i.e. if in the context of a device.
2. Richard is not too opposed to the idea.

Then, yes.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
