Received: from mail.windriver.com ([147.11.1.11])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RNS5Q-000176-IC
 for linux-mtd@lists.infradead.org; Mon, 07 Nov 2011 16:30:17 +0000
Message-ID: <4EB80788.9080305@windriver.com>
Date: Mon, 7 Nov 2011 11:30:00 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
MIME-Version: 1.0
To: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH] MTD: MAPS: bcm963xx-flash.c: explicitly include module.h
References: <1320580651-4860-1-git-send-email-jonas.gorski@gmail.com>
 <20111107012643.GG30282@windriver.com>
 <CAOiHx=mmLrfqtp3Nm4WgUT9Vu8pYnVht7tBvwguGMN91bj0Dig@mail.gmail.com>
In-Reply-To: <CAOiHx=mmLrfqtp3Nm4WgUT9Vu8pYnVht7tBvwguGMN91bj0Dig@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11-11-07 05:12 AM, Jonas Gorski wrote:
> HI Paul,
> 
> On 7 November 2011 02:26, Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
>> On 06/11/2011 (Sun 12:57) Jonas Gorski wrote:
>>> This patch is based on next-20111104 and probably should go through Paul's module.h cleanup tree.
>>
>> I can put it in the module.h tree, but for files that are using module.h
>> stuff, they can simply add it via the normal maintainer flow, since
>> files that use modular stuff should include module.h regardless and
>> there are no dependencies on the module.h content for things like this.
> 
> I'm fine with either (though going through the MTD-tree will probably
> warrant a resubmission with a shortened changelog as it doesn't break
> there (yet)).

OK, I'll grab it and put it in the small post-merge queue that I'll be
sending in a couple of hours.

P.

> 
> @David, any preference there? Should I resubmit?
> 
> Regards
> Jonas
