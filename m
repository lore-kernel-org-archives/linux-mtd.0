Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zw4XU-0002U5-Ey
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 08:44:29 +0000
Received: by obdgf3 with SMTP id gf3so159176272obd.3
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2015 00:43:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151110032626.GN12143@google.com>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
 <20151029162908.GA13275@localhost>
 <CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
 <20151030175145.GF13239@google.com>
 <CAL_JsqL2F3p7qBPbOiGytVyzF_aNLWbrCT0mAX1WZo6SxE3JoA@mail.gmail.com>
 <20151110032626.GN12143@google.com>
Date: Tue, 10 Nov 2015 09:43:28 +0100
Message-ID: <CACRpkdYQWaE3+iGA-W+2koo3fZWCWyCLoqJ+FgHor-nkPmgGAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
From: Linus Walleij <linus.walleij@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
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

On Tue, Nov 10, 2015 at 4:26 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Fri, Nov 06, 2015 at 08:13:13AM -0600, Rob Herring wrote:
>> Since we now have partitions contained in a sub node, how about using
>> compatible for that sub node instead.
>
> That seems like a pretty good idea to me.

Hm! That's a clever idea. I'll take a spin on that.

Yours,
Linus Walleij
