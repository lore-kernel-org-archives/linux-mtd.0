Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNHhJ-0005E0-2b
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 09:42:49 +0000
Subject: Re: [RFC PATCH 2/2] mtd: nand: use nand_check_erased_ecc_chunk in
 default ECC read functions
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <mailman.4457.1438277726.1758.linux-mtd@lists.infradead.org>
 <mailman.4457.1438277726.1758.linux-mtd.{07a3baba-0e8a-469e-82e1-92b4ef074f4f}.0@lists.infradead.org>
 <1438277694-23763-3-git-send-email-boris.brezillon@free-electrons.com>
 <55BB48D9.6050508@dave-tech.it> <20150731123221.34cf601e@bbrezillon>
 <55BB7ABD.7040008@dave-tech.it> <20150731161032.2b155ccb@bbrezillon>
 <55BBA012.4080600@dave-tech.it> <20150731182709.14c345df@bbrezillon>
 <55BF4D72.8090000@dave-tech.it> <20150803144253.66fc6941@bbrezillon>
 <55BF6F09.9000001@dave-tech.it> <55BFC1DA.3090108@nod.at>
 <55C06379.5090705@dave-tech.it> <55C067F7.3000309@nod.at>
 <20150806111901.3d2d5494@bbrezillon>
Cc: Andrea Scian <rnd4@dave-tech.it>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org,
 Han Xu <b45815@freescale.com>, Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C32BFF.6020802@nod.at>
Date: Thu, 6 Aug 2015 11:42:23 +0200
MIME-Version: 1.0
In-Reply-To: <20150806111901.3d2d5494@bbrezillon>
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



Am 06.08.2015 um 11:19 schrieb Boris Brezillon:
>> I think this needs more discussion.
>>
>> Boris, Brian, will you be at Embedded Linux Conference Europe in Dublin?
>> Maybe we can discuss these issues (data retention, ff-checks, etc...) in person and figure out where to address them.
>> I really want to avoid ad-hoc solutions. :)
> 
> I'll be at ELCE and I'd be happy to discuss all these NAND/MTD/UBI
> related issues with you, though I think we should keep discussing
> those problems on the ML too.

Sure, I did not recommend a secret meeting. ;-)
But often a face to face conversation is better for brain storming.

Thanks,
//richard
