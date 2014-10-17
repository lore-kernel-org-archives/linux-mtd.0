Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xf9rP-0000oE-FF
 for linux-mtd@lists.infradead.org; Fri, 17 Oct 2014 15:54:36 +0000
Received: from eiche.ahsoftware (p4FC36386.dip0.t-ipconnect.de [79.195.99.134])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 27D6D2C9C3BC
 for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2014 17:54:10 +0200 (CEST)
Message-ID: <54413B9B.9030702@ahsoftware.de>
Date: Fri, 17 Oct 2014 17:54:03 +0200
From: Alexander Holler <holler@ahsoftware.de>
MIME-Version: 1.0
To: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH 00/27] Fix common bug in most nand drivers not showing
 a device in sysfs
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>	<543F678E.1030401@ahsoftware.de>
 <CAH6sp9O=36FTGg4FTCywsNzdJi4PjUmiiT6_EHr=i166+NA2ng@mail.gmail.com>
In-Reply-To: <CAH6sp9O=36FTGg4FTCywsNzdJi4PjUmiiT6_EHr=i166+NA2ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.10.2014 um 12:53 schrieb Frans Klaver:
> On Thu, Oct 16, 2014 at 8:37 AM, Alexander Holler <holler@ahsoftware.de> wrote:
>>
>> I wonder if anyone else will fix this in a maintainer-approved style which
>> doesn't use these evil leftovers from C666 called functions.
>
> I'll pick this up then.

Thanks.

>
> Still interested in following progress?

As you wish. It's such a simple patch, that I think every word about it
is almost a waste of time. I assume the result will be just 21
one-line-patches anyway, missing the chance to avoid similiar silly
patch series in the future by creating a common function (which even
reduces code size over all).

I've originally just did it because I've assumed any maintainer would
just wave it through not seeing a chance for big discussions.

So, if you like, just add my Signed-off-by too, there isn't really much
one could do wrong. ;)

Thanks again,

Alexander Holler
