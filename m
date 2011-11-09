Received: from smtp.newsguy.com ([74.209.136.69])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RNwOz-0002zU-62
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2011 00:52:29 +0000
Message-ID: <4EB9DCA2.8000009@newsguy.com>
Date: Tue, 08 Nov 2011 17:51:30 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubi on MLC nand flash
References: <4EB6A6A8.7010703@newsguy.com> <1320787925.17770.31.camel@koala>
In-Reply-To: <1320787925.17770.31.camel@koala>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem, thanks for having a look.

On 11/08/2011 01:32 PM, Artem Bityutskiy wrote:
> On Sun, 2011-11-06 at 07:24 -0800, Mike Dunn wrote:
>
>> What I find is that, after a few minutes, enough PEBs are marked as bad to
>> exhaust the reserve PEB pool
> I guess you can make it larger, the default 1% is just something which
> was good enough for our super-robust OneNAND flash.


This device only has 512 erase blocks (256K each), and typically fewer usable
for a filesystem, so I hate to expend more for overhead.


> Also, for MLC you probably want a smaller WL threshold, I heard that
> modern MLCs have ereaseblock liftimes smaller than 10000 erase-cycles.
> So the default 4096 might be too big.


Thanks.  Did see the comment in ubi/Kconfig.


>> , UBI switches to r/o mode, and the test fails.  The
>> reason is that - on this device at least - bit flips seem to be persistent;
>> i.e., you will get e.g. 1 bit flip every time you read a certain page. 
>> Consequently, when the bit flip occurs and the PEB gets scrubbed, the torture
>> test fails because the bit flip reoccurs, and the PEB is marked bad.
> A quick hack you can do to go further in your investigations without
> being block by this issue is to hack your driver and make it to just not
> return -EUCLEAN in case of 1 bit flip or may be even 2. Then you can see
> ahead what else happens to UBI.


Already done as a temporary work-around.  But -EUCLEAN is actually returned from
nand_base.c

Mike
