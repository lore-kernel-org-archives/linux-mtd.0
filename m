Date: Fri, 30 Oct 2015 10:51:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree-spec@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
Message-ID: <20151030175145.GF13239@google.com>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
 <20151029162908.GA13275@localhost>
 <CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 30, 2015 at 03:00:57PM +0100, Linus Walleij wrote:
> On Thu, Oct 29, 2015 at 5:29 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> 
> >> +Required properties:
> >> +- partition-type : the type of partition. Only one type can be specified.
> >
> > You're supporting this as a list property (for future expansion,
> > presumably), so I can only assume the "only one type" is referring to
> > the number of different parsers available currently, not the behavior of
> > the property itself?
> 
> I was thinking that it would not be a list actually.
> 
> The reason being that if you're anyways going to the trouble of
> specifying exactly what partition type is going to be used, you're
> not really interested in specifying a few different ones, you know
> exactly what type it is going to be.

OK, that makes sense. I think it's still *possible* that a board might
have the option of more than one partition parser, and so they might
just include both in the DTS, but that seems unlikely and so it makes
sense not to (over)engineer for it before it's needed. Anyway, your
binding can easily be expanded in the future if needed.

> But if you think it needs to be a list, I'll specify that, no big
> deal. I'll also try to get the Linux code to handle a list then.

No, I think your proposal is OK then. It's possible there is some room
for clarification in the binding, since I was confused, but that could
mostly be attributed to my pre-existing assumptions, not a fault of the
text.

> > Also, this patch will conflict with [1]. I'll probably take [1] soon, so
> > one of us will have to rebase this.
> 
> Sure I'll rebase on whatever you say.

OK, I'll let you know.

Brian
