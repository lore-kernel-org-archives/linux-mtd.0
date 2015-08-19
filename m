Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSAEr-00076S-QF
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 20:45:38 +0000
Subject: Re: [RFC PATCH 00/27] Introduce ubifs_dump in ubifs-utils
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com,
 computersforpeace@gmail.com
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55D4EADA.70408@nod.at>
Date: Wed, 19 Aug 2015 22:45:14 +0200
MIME-Version: 1.0
In-Reply-To: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dongsheng,

Am 19.08.2015 um 10:39 schrieb Dongsheng Yang:
> Hi Atem, Richard and Brian,
> 	This patchset introduce a userspace tool named ubifs_dump
> to dump data from a ubi media.
> 	It will dump the areas in ubifs, such as super block,
> master, log, lpt and main.
> 	That's helpful for us to see what exactly written in
> media.
> 	the [1/patch] is a RESEND patch, it restructures the mtd-utils.
> Please Brian help to take a look at it. thanx a lot. :)
> 
> NOTE:
> 	This patch set depends on a patch I sent out [ubifs: correct the size of nnode in memset]
> But you can get a full code at:
> https://github.com/yangdongsheng/mtd-utils.git ubifs_dump_v1
> 
> Please help to review or test it.

thanks a lot for your patches, I'll happily test and review them.
But I'll be on vacation till 14th of September.
So, it has to wait a bit. :-)

Thanks,
//richard
