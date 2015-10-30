Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsAF4-0003Dm-Rm
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 14:01:19 +0000
Received: by obbwb3 with SMTP id wb3so44820768obb.0
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 07:00:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151029162908.GA13275@localhost>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
 <20151029162908.GA13275@localhost>
Date: Fri, 30 Oct 2015 15:00:57 +0100
Message-ID: <CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
From: Linus Walleij <linus.walleij@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: devicetree-spec@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 29, 2015 at 5:29 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

>> +Required properties:
>> +- partition-type : the type of partition. Only one type can be specified.
>
> You're supporting this as a list property (for future expansion,
> presumably), so I can only assume the "only one type" is referring to
> the number of different parsers available currently, not the behavior of
> the property itself?

I was thinking that it would not be a list actually.

The reason being that if you're anyways going to the trouble of
specifying exactly what partition type is going to be used, you're
not really interested in specifying a few different ones, you know
exactly what type it is going to be.

But if you think it needs to be a list, I'll specify that, no big
deal. I'll also try to get the Linux code to handle a list then.

> Also, this patch will conflict with [1]. I'll probably take [1] soon, so
> one of us will have to rebase this.

Sure I'll rebase on whatever you say.

Yours,
Linus Walleij
