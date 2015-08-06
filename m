Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNCno-0003A6-Pk
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 04:29:14 +0000
Subject: Re: [RFC PATCH 2/2] mtd: nand: use nand_check_erased_ecc_chunk in
 default ECC read functions
To: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <mailman.4457.1438277726.1758.linux-mtd@lists.infradead.org>
 <mailman.4457.1438277726.1758.linux-mtd.{07a3baba-0e8a-469e-82e1-92b4ef074f4f}.0@lists.infradead.org>
 <1438277694-23763-3-git-send-email-boris.brezillon@free-electrons.com>
 <55BB48D9.6050508@dave-tech.it> <20150731123221.34cf601e@bbrezillon>
 <55BB7ABD.7040008@dave-tech.it> <20150731161032.2b155ccb@bbrezillon>
 <55BBA012.4080600@dave-tech.it> <20150731182709.14c345df@bbrezillon>
 <55BF4D72.8090000@dave-tech.it> <20150803144253.66fc6941@bbrezillon>
 <55BF6F09.9000001@dave-tech.it> <55BFC1DA.3090108@nod.at>
 <55C06379.5090705@dave-tech.it> <55C067F7.3000309@nod.at>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org,
 Han Xu <b45815@freescale.com>, Artem Bityutskiy <dedekind1@gmail.com>
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <55C2E27D.3030406@dave-tech.it>
Date: Thu, 6 Aug 2015 06:28:45 +0200
MIME-Version: 1.0
In-Reply-To: <55C067F7.3000309@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Il 04/08/2015 09:21, Richard Weinberger ha scritto:
> Andrea,
>
> Am 04.08.2015 um 09:02 schrieb Andrea Scian:
>>> I'm not sure whether introducing a read-before-write check is the best solution.
>>> At least we need hard numbers for slow/old SLC NANDs too.
>>
>> We can enable the feature only for MLC, AFAIK it has not been required for old SLC ;-)
>
> I think this needs more discussion.
>
> Boris, Brian, will you be at Embedded Linux Conference Europe in Dublin?
> Maybe we can discuss these issues (data retention, ff-checks, etc...) in person and
 > figure out where to address them.
> I really want to avoid ad-hoc solutions. :)

Maybe I'll be at ELCE this year too
I'll be glad to meet all of you in person and participate to this 
discussion. :)

It will be nice if also some silicon vendor would like to participate. I 
know that someone from micron is actively following us on this ML, but I 
don't really know if there's someone here in Europe. :)

>
>> Thanks.
>> In your opinion, enabling chk_io is correct to rough estimate the overhead
 >> or does it enable too much checks?
>
> You mean the other checks bedside of self_check_write()? You can comment them out
 > for your tests.
>
> Thanks,
> //richard
>

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems
