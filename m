Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXd3Z-0001yE-OO
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 18:14:26 +0000
Message-ID: <4EDD09E1.8070207@newsguy.com>
Date: Mon, 05 Dec 2011 10:13:53 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <1323066236.2316.16.camel@koala>
In-Reply-To: <1323066236.2316.16.camel@koala>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vimal Singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/04/2011 10:23 PM, Artem Bityutskiy wrote:
> On Sat, 2011-12-03 at 12:20 -0800, Mike Dunn wrote:
>> Hi,
>>
>> This patch proposes a change to the mtd API for the purpose of returning to
>> the caller information on the number of bit errors corrected by the ecc
>> facilities of the device during read operations.  The affected functions are
>> read() and read_oob().
> Mike,
>
> this is quite big patch, and I've realized that it is difficult to
> review it because of the size. I know I suggested one big patch, but now
> I think we should try to split it, if we can. This way it will also be
> easier to pass through dwmw2 because at the end he is the MTD
> maintainer.
>
> I can see the following parts in your patch:
>
> 1. Mechanical part - no much brains needed, just change prototypes, add
> few comments, add NULL arguments everywhere. This is the biggest part. 
>
> 2. Implementation part - should be much smaller - implements
> max_bitflips support in MTD.
>
> Part 2 is interesting to reveiw, and currently part 1 adds so much noise
> that the review becomes difficult. Can you split your patches like that?


OK.  But you may still be underestimating the quantity of code that warrants
review.  Since we're going back to multiple patches anyway, how about four patches:

1. api change to mtd.h (a few lines just to put the rest in context)
2. nand, onenand
3. mtd infrastructructure: mtdblock, mtdchar, mtdpart, mtdconcat, ...
4. rote changes

Patch 4 will contain nothing beyond function definition changes, and the addition of

if(max_bitflips != NULL)
    *max_bitflips = 0;

to the top of the read function.  Anything beyond that will go into patch 3. 
Patch 4 will include all drivers that are not nand or onenand, since these don't
have ecc (two exceptions being devices/docg3.c and nand/alauda.c, which are are
nand drivers that do not use the nand interface).

Please let me know if that sounds reasonable.


> I apologize for not suggesting this from the very beginning.


No problem.  I expected this would be an iterative process and resigned myself
to a lot of tedium :)


>
> P.S. As a side note, I am thinking that with your patch the -EUCLEAN
> return code may go away. It has always been a bit ugly interface anyway.
> What do you think? 


I agree.  And with the max_bitflips change, it become cruft.  The patch required
to accomplish this would not be very large, either.



> My thinking is that we can do this separately later.
> But you need to add assertions like:
>
> 	WARN_ON(err == -EUCLEAN && max_bitflips == 0);
>
> in interesting places.


OK, I'll include this with the next patch set.

Thanks,
Mike
