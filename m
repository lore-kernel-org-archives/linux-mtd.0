Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RTgPG-0001wz-RT
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2011 21:00:32 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [patch] mtd/docg3: fix error handling in docg3_probe()
References: <20111124072117.GC14122@elgon.mountain> <87pqghygbv.fsf@free.fr>
 <20111124103147.GF3195@mwanda>
Date: Thu, 24 Nov 2011 22:00:22 +0100
In-Reply-To: <20111124103147.GF3195@mwanda> (Dan Carpenter's message of "Thu,
 24 Nov 2011 13:31:47 +0300")
Message-ID: <878vn5xml5.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Thu, Nov 24, 2011 at 11:17:56AM +0100, Robert Jarzmik wrote:
>> >  	if (!found)
>> > @@ -1138,9 +1141,11 @@ notfound:
>> >  	ret = -ENODEV;
>> >  	dev_info(dev, "No supported DiskOnChip found\n");
>> >  err_probe:
>> > -	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++)
>> > +	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++) {
>> >  		if (docg3_floors[floor])
>> >  			doc_release_device(docg3_floors[floor]);
>> > +	}
>> > +	kfree(docg3_floors);
>> This is in conflict. Could you drop that hunk and wait for the other patch to go
>> upstream ? Or alternatively use the whole serie in [2] as your base ?
>> I think some patches of the serie didn't make it in the tree you're
>> using.
>> 
>
> I'm on linux-next.  They're all going to hit linux next soon right?
Euh, I don't know, it's Artem decision there, as he's taking my patches.

Cheers.

-- 
Robert
