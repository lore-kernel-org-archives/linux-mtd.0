Received: from mail-gx0-f210.google.com ([209.85.217.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mwffd-0006Pi-OZ
	for linux-mtd@lists.infradead.org; Sat, 10 Oct 2009 17:24:00 +0000
Received: by gxk2 with SMTP id 2so2586205gxk.4
	for <linux-mtd@lists.infradead.org>;
	Sat, 10 Oct 2009 10:23:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0910101815260.3182@mercury.infradead.org>
References: <a5d587fb0910100756i1ed21291u2aea66ba06247844@mail.gmail.com>
	<8bd0f97a0910100842o43956200w6bc644346d7c3eb9@mail.gmail.com>
	<alpine.LFD.2.00.0910101718530.3182@mercury.infradead.org>
	<8bd0f97a0910100956x2051971dme272b1d25ee21a30@mail.gmail.com>
	<alpine.LFD.2.00.0910101815260.3182@mercury.infradead.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 10 Oct 2009 13:23:33 -0400
Message-ID: <8bd0f97a0910101023p5fd9e627j343e42b34f89f9ad@mail.gmail.com>
Subject: Re: broken dependency of drivers/mtd/maps/gpio-addr-flash.o
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Michal Suchanek <hramrach@centrum.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 10, 2009 at 13:18, David Woodhouse wrote:
> On Sat, 10 Oct 2009, Mike Frysinger wrote:
>> On Sat, Oct 10, 2009 at 12:19, David Woodhouse wrote:
>>> On Sat, 10 Oct 2009, Mike Frysinger wrote:
>>>> On Sat, Oct 10, 2009 at 10:56, Michal Suchanek wrote:
>>>>> It tried building the 2.6.32-rc3 kernel for i386.
>>>>>
>>>>> This file fails to compile if gpiolib is not configured but it is
>>>>> possible to select compilation of that file without selecting gpiolib.
>>>>>
>>>>> I guess I do not need this file because I do not have gpio and it
>>>>> really depends on it but drivers in the MTD section seemed to be
>>>>> mostly enabled in distribution config and this was a new driver since
>>>>> 2.6.30.
>>>>
>>>> patches have already been posted for the issue
>>>
>>> Have they? I thought the x86 gpio implementation was still broken?
>>
>> i'm talking about the gpio driver adding depend lines for gpio
>
> Not in front of a real computer right now but I think you added a dep on
> GENERIC_GPIO || GPIOLIB, but it fails on x86 when the former is enabled
> (which it always has) but not the latter (which is optional).
> x86 needs _both_ defined.

yes, the issue you raised in the original thread has not been
addressed, but until the gpio-addr-flash Kconfig itself is fixed, it's
hard to filter out problems people are having between x86-is-broken
and gpio-addr-flash-is-broken.  i'm addressing the latter and then we
can move on to complaining to the x86 people to fix their side.
-mike
