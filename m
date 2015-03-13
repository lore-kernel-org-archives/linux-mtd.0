Received: from mail-we0-f173.google.com ([74.125.82.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWJNU-0007q8-At
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2015 06:47:24 +0000
Received: by wevk48 with SMTP id k48so21147220wev.7
 for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2015 23:47:01 -0700 (PDT)
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com.
 [209.85.212.181])
 by mx.google.com with ESMTPSA id g5sm1477861wjr.19.2015.03.12.23.47.01
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2015 23:47:01 -0700 (PDT)
Received: by wibbs8 with SMTP id bs8so3420640wib.4
 for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2015 23:47:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACna6ry5Fu2S6s761jMgsz4K-ZUEDEDJh7xd_hTfaKPGvThJjg@mail.gmail.com>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
 <CACna6ryC8TyxvvtztoSgZUXnE+tJdY6tefbXVkaZ60JoZ7ti7A@mail.gmail.com>
 <CAN1oZWw2RUf7jSDGqk5UUrT3DDR2MHD6ORGQ1OLXQyES6+3Cjw@mail.gmail.com>
 <CACna6rzPRKFN+RzoF3TnNrPMy=rci25wb4NFPHZXBu9P61MjLQ@mail.gmail.com>
 <A8F913A698B3864C898FDDF9BF921BC9E8C00F@PG-ITEXCH01.altera.priv.altera.com>
 <CAN1oZWyq8Tni6M6yUZSU4Ky-Mku78kZW=qiNVEBcx-YuX7npXA@mail.gmail.com>
 <CAN1oZWyp6bC=UhwHxKn5GPvTsr88ON9CthWWjpA8j1opgaE2-A@mail.gmail.com>
 <CACna6ry5Fu2S6s761jMgsz4K-ZUEDEDJh7xd_hTfaKPGvThJjg@mail.gmail.com>
Date: Fri, 13 Mar 2015 14:47:01 +0800
Message-ID: <CAN1oZWyHcojSeW+XpaFHM2+cnTvHpZ8=CmqKEQfiOVKeiZZ=3w@mail.gmail.com>
Subject: Re: FW: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
From: Viet Nga Dao <vndao@altera.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Viet Nga Dao <vndao@altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
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

On Fri, Mar 13, 2015 at 1:45 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
> On 11 March 2015 at 09:41, Viet Nga Dao <vndao@altera.com> wrote:
>> On Tue, Mar 10, 2015 at 4:09 PM, Viet Nga Dao <vndao@altera.com> wrote:
>>> Ok. I will modify the code the way you suggest.
>>
>> I just realize that the opcode for RDID is handled by hardware in my
>> case, therefore i dont really need to worry about 0xab opcode.
>
> Nice :) Maybe just put a comment in code so ppl will know (in future)
> why we don't strictly follow specs.
>
>
>> Is there any other comments about the modified part i did the lock and
>> unlock in spi-nor.c?
>
> I can't, I don't know spi-nor well enough :|
>
> --
> Rafa=C5=82
I have to wait for Brian then. Anway, thanks Rafal :)
