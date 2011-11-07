Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RNMBj-0001tH-81
 for linux-mtd@lists.infradead.org; Mon, 07 Nov 2011 10:12:24 +0000
Received: by faaq17 with SMTP id q17so6327244faa.36
 for <linux-mtd@lists.infradead.org>; Mon, 07 Nov 2011 02:12:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20111107012643.GG30282@windriver.com>
References: <1320580651-4860-1-git-send-email-jonas.gorski@gmail.com>
 <20111107012643.GG30282@windriver.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 7 Nov 2011 11:12:00 +0100
Message-ID: <CAOiHx=mmLrfqtp3Nm4WgUT9Vu8pYnVht7tBvwguGMN91bj0Dig@mail.gmail.com>
Subject: Re: [PATCH] MTD: MAPS: bcm963xx-flash.c: explicitly include module.h
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Content-Type: text/plain; charset=UTF-8
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

HI Paul,

On 7 November 2011 02:26, Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
>On 06/11/2011 (Sun 12:57) Jonas Gorski wrote:
>> This patch is based on next-20111104 and probably should go through Paul's module.h cleanup tree.
>
> I can put it in the module.h tree, but for files that are using module.h
> stuff, they can simply add it via the normal maintainer flow, since
> files that use modular stuff should include module.h regardless and
> there are no dependencies on the module.h content for things like this.

I'm fine with either (though going through the MTD-tree will probably
warrant a resubmission with a shortened changelog as it doesn't break
there (yet)).

@David, any preference there? Should I resubmit?

Regards
Jonas
