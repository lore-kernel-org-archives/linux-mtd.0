Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWIPr-0006oC-9h
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2015 05:45:47 +0000
Received: by ieclw3 with SMTP id lw3so85105954iec.2
 for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2015 22:45:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN1oZWyp6bC=UhwHxKn5GPvTsr88ON9CthWWjpA8j1opgaE2-A@mail.gmail.com>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
 <CACna6ryC8TyxvvtztoSgZUXnE+tJdY6tefbXVkaZ60JoZ7ti7A@mail.gmail.com>
 <CAN1oZWw2RUf7jSDGqk5UUrT3DDR2MHD6ORGQ1OLXQyES6+3Cjw@mail.gmail.com>
 <CACna6rzPRKFN+RzoF3TnNrPMy=rci25wb4NFPHZXBu9P61MjLQ@mail.gmail.com>
 <A8F913A698B3864C898FDDF9BF921BC9E8C00F@PG-ITEXCH01.altera.priv.altera.com>
 <CAN1oZWyq8Tni6M6yUZSU4Ky-Mku78kZW=qiNVEBcx-YuX7npXA@mail.gmail.com>
 <CAN1oZWyp6bC=UhwHxKn5GPvTsr88ON9CthWWjpA8j1opgaE2-A@mail.gmail.com>
Date: Fri, 13 Mar 2015 06:45:25 +0100
Message-ID: <CACna6ry5Fu2S6s761jMgsz4K-ZUEDEDJh7xd_hTfaKPGvThJjg@mail.gmail.com>
Subject: Re: FW: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Viet Nga Dao <vndao@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, nga_chi86 <ngachi86@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 March 2015 at 09:41, Viet Nga Dao <vndao@altera.com> wrote:
> On Tue, Mar 10, 2015 at 4:09 PM, Viet Nga Dao <vndao@altera.com> wrote:
>> Ok. I will modify the code the way you suggest.
>
> I just realize that the opcode for RDID is handled by hardware in my
> case, therefore i dont really need to worry about 0xab opcode.

Nice :) Maybe just put a comment in code so ppl will know (in future)
why we don't strictly follow specs.


> Is there any other comments about the modified part i did the lock and
> unlock in spi-nor.c?

I can't, I don't know spi-nor well enough :|

--=20
Rafa=C5=82
