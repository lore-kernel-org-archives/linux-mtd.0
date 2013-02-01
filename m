Received: from ia-in-x022b.1e100.net ([2607:f8b0:4001:c02::22b]
 helo=mail-ia0-x22b.google.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U1CCB-0007yP-VY
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2013 08:42:05 +0000
Received: by mail-ia0-f171.google.com with SMTP id z13so5073355iaz.30
 for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2013 00:42:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20130131232015.GA3314@quad.lixom.net>
References: <CACRpkdZM8+6QaGrRtCCMWoZQO23uej7JDr1xz2zG7TtwQ7Ngqw@mail.gmail.com>
 <20130128213135.GA3047@quad.lixom.net>
 <CACRpkdaHo_xLwqUDF9C71HbuGEcJHg_Jrsf0gCSPYXa4E+yJGA@mail.gmail.com>
 <20130129173641.GA17935@quad.lixom.net>
 <CACRpkdaVOV4d9xeuKnMyfGgM+Su3M6dmo2pyeEQE9Qb2sErzzA@mail.gmail.com>
 <20130131232015.GA3314@quad.lixom.net>
Date: Fri, 1 Feb 2013 09:42:01 +0100
Message-ID: <CACRpkdYyUeqcST0n20az4otfLfqoFNNibWgk-i7p=AcNCA+Qzw@mail.gmail.com>
Subject: Re: [GIT PULL] Nomadik devicetree and cleanups
From: Linus Walleij <linus.walleij@linaro.org>
To: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, arm@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 1, 2013 at 12:20 AM, Olof Johansson <olof@lixom.net> wrote:
> On Wed, Jan 30, 2013 at 11:21:06PM +0100, Linus Walleij wrote:
>> So as I heard this blew up for selecting OF instead of USE_OF here
>> is yet another pull request, with this oneliner change in the relevant
>> patch ("ARM: nomadik: delete old board files"):
>>
>> - select OF
>> + select USE_OF
>>
>> I have tried to provoke builderrors with the defconfig but couldn't.
>>
>> Here is then yet another pull request, and let's hope it works this
>> time around:
>
> Dropping and replacing branches is awkward, and you rewrote history here. It'd
> be better to just take a fixup patch on top that switches the two selects.

Sure, I'll fix...

Yours,
Linus Walleij
