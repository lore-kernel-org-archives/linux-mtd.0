Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d80ts-0008Vb-5r
 for linux-mtd@lists.infradead.org; Tue, 09 May 2017 08:53:46 +0000
Subject: Re: [RFC][PATCH] UBI: Make MTD_UBI_FASTMAP non-experimental
To: Jesper Nilsson <jesper.nilsson@axis.com>
References: <20170329153836.GB29118@axis.com>
 <434195d8-d638-240d-8d63-50d033ea453a@nod.at>
 <3f8d0417-5e7d-b7c8-ba83-9a87e774f97f@gmail.com>
 <20170330173944.GJ29118@axis.com>
 <a85d3308-e9c9-b292-b2ad-0005a55d2e6d@nod.at>
 <20170403111735.GV29118@axis.com> <20170509074657.GY10068@axis.com>
Cc: Jesper Nilsson <jespern@axis.com>, Marek Vasut <marek.vasut@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <41df86d7-a9a3-cada-8f41-3afde22b2e5f@nod.at>
Date: Tue, 9 May 2017 10:53:16 +0200
MIME-Version: 1.0
In-Reply-To: <20170509074657.GY10068@axis.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jesper,

Am 09.05.2017 um 09:46 schrieb Jesper Nilsson:
> Hi Richard,
> 
> I'm still worried about this failure case, do we really
> believe that the flash could fail in such a way that the
> fastmap is corrupted in an undetectable way?
> 
> If we do detect corruption we should be no worse off
> than earlier since we should ignore the fastmap, IIRC.

In a perfect world, yes.

> Could you please elaborate on the problem you were
> thinking about?

e.g.
commit 74f2c6e9a47cf4e508198c8594626cc82906a13d
Author: Richard Weinberger <richard@nod.at>
Date:   Tue Jun 14 10:12:17 2016 +0200

    ubi: Be more paranoid while seaching for the most recent Fastmap

    Since PEB erasure is asynchornous it can happen that there is
    more than one Fastmap on the MTD. This is fine because the attach logic
    will pick the Fastmap data structure with the highest sequence number.

    On a not so well configured MTD stack spurious ECC errors are common.
    Causes can be different, bad hardware, wrong operating modes, etc...
    If the most current Fastmap renders bad due to ECC errors UBI might
    pick an older Fastmap to attach from.
    While this can only happen on an anyway broken setup it will show
    completely different sympthoms and makes finding the root cause much
    more difficult.
    So, be debug friendly and fall back to scanning mode of we're facing
    an ECC error while scanning for Fastmap.

    Cc: <stable@vger.kernel.org>
    Signed-off-by: Richard Weinberger <richard@nod.at>

> Right now I'm hesitant to use fastmap in any production code,
> even if it works with my current hardware, since there is no
> guarantee that the flash chips won't get replaced with a
> second source option down the line...

Fastmap is an aggressive optimization and makes finding issues much
harder.

Thanks,
//richard
