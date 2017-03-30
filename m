Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cthdX-0005Fh-Pe
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 21:29:45 +0000
Subject: Re: [RFC][PATCH] UBI: Make MTD_UBI_FASTMAP non-experimental
To: Jesper Nilsson <jesper.nilsson@axis.com>,
 Marek Vasut <marek.vasut@gmail.com>
References: <20170329153836.GB29118@axis.com>
 <434195d8-d638-240d-8d63-50d033ea453a@nod.at>
 <3f8d0417-5e7d-b7c8-ba83-9a87e774f97f@gmail.com>
 <20170330173944.GJ29118@axis.com>
Cc: Jesper Nilsson <jespern@axis.com>, Artem Bityutskiy
 <dedekind1@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <a85d3308-e9c9-b292-b2ad-0005a55d2e6d@nod.at>
Date: Thu, 30 Mar 2017 23:29:15 +0200
MIME-Version: 1.0
In-Reply-To: <20170330173944.GJ29118@axis.com>
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

Am 30.03.2017 um 19:39 schrieb Jesper Nilsson:
>> So we should document this with a big fat warning and set fastmap to
>> default=n ?
> 
> Does this sound reasonable?
> 
> Note that this feature makes UBI less robust, since Fastmap does not scan
> the full flash, which might lead to problems on misbehaving NAND chips.
> Only enable this if the speedup in attach is really important and

I'm not a native English speaker, but shouldn't this be
"...if speedup of the attach time is important ..."

> you can be sure that the NAND works as expected.

Looks fine!

Thanks,
//richard
