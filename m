Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYx1z-00041e-9l
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 14:36:41 +0000
Subject: Re: [PATCH] ubi: Fix early logging
To: Joe Perches <joe@perches.com>, linux-mtd <linux-mtd@lists.infradead.org>
References: <E1aYvh4-0006C7-QZ@feisty.vs19.net>
 <1456406652.10763.48.camel@perches.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56CF115C.6010001@nod.at>
Date: Thu, 25 Feb 2016 15:36:12 +0100
MIME-Version: 1.0
In-Reply-To: <1456406652.10763.48.camel@perches.com>
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

Am 25.02.2016 um 14:24 schrieb Joe Perches:
> From:	Richard Weinberger <richard@nod.at>
> []
>> We must not use ubi_* log functions before the ubi_device
>> struct is initialized.
>> And while we are here, define a sane pr_fmt and add new lines to
>> existing pr_* calls.
> 
> I think it'd be better to use and extend the patch I sent
> for this problem.
> 
> https://patchwork.ozlabs.org/patch/587057/
> 
> Add a state check of the ubi pointer in the ubi_<level>
> functions and do the right thing there.

Please send such a patch for UBI. :-)

Thanks,
//richard
