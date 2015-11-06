MIME-Version: 1.0
In-Reply-To: <20151030175145.GF13239@google.com>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
 <20151029162908.GA13275@localhost>
 <CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
 <20151030175145.GF13239@google.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 6 Nov 2015 08:13:13 -0600
Message-ID: <CAL_JsqL2F3p7qBPbOiGytVyzF_aNLWbrCT0mAX1WZo6SxE3JoA@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
To: Brian Norris <computersforpeace@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
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

On Fri, Oct 30, 2015 at 12:51 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Fri, Oct 30, 2015 at 03:00:57PM +0100, Linus Walleij wrote:
>> On Thu, Oct 29, 2015 at 5:29 PM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>>
>> >> +Required properties:
>> >> +- partition-type : the type of partition. Only one type can be specified.
>> >
>> > You're supporting this as a list property (for future expansion,
>> > presumably), so I can only assume the "only one type" is referring to
>> > the number of different parsers available currently, not the behavior of
>> > the property itself?
>>
>> I was thinking that it would not be a list actually.
>>
>> The reason being that if you're anyways going to the trouble of
>> specifying exactly what partition type is going to be used, you're
>> not really interested in specifying a few different ones, you know
>> exactly what type it is going to be.
>
> OK, that makes sense. I think it's still *possible* that a board might
> have the option of more than one partition parser, and so they might
> just include both in the DTS, but that seems unlikely and so it makes
> sense not to (over)engineer for it before it's needed. Anyway, your
> binding can easily be expanded in the future if needed.

Since we now have partitions contained in a sub node, how about using
compatible for that sub node instead.

Rob
