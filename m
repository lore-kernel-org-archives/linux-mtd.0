Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ElDD8-00026q-Em
	for linux-mtd@lists.infradead.org; Sat, 10 Dec 2005 17:29:03 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Sun, 11 Dec 2005 11:28:34 +1300
References: <439821F4.7010403@yandex.ru>
In-Reply-To: <439821F4.7010403@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200512111128.34835.manningc2@actrix.gen.nz>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: NAND simulator
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 09 December 2005 01:07, Artem B. Bityutskiy wrote:
> Hello,
>
> I'm going to rework NAND simulator (nandsim, drivers/mtd/nand/nandsim.c)
> to add the following functionality:
>
> 1. Emulation of devices larger then 128MB
Yes please.
> 2. Possibility to manually specify any page size/eraseblock size/flash
> size.
Double yes please! The current way of doing things is very hard to use 
effectively and you need to hack quite a few places to make a useful 
simulation. 

The current approach of simulating a physical device is probably good for 
testing nand.c, but it is not so great for testing file systems. If I want to 
test, for example, a file system on an arrangement of say 350MB then I have 
to go through some crazy steps like making up a fake device id and fake the 
chip id to give what I want. I think a more direct approach of just inserting 
a set of size parameters is far better.

>
> I am going to remove flash delays emulation as it appears to be
> unusable. No objections?

Yup, I don't see much point in trying to simulate the timing. In reality 
nandsim is only really there for algorithmic testing and not time 
simulations.

>
> If there are some additional offers, please, provide.

I assume you mean requests :-). If so, I have a question/request.

Can nandsim simulate storage larger than physical RAM (just swapping out) or 
would this need special support (eg. add some block device support? We're 
getting people in YAFFSland who are working with 8Gbytes of flash (and it 
will only get bigger!) and I expect you'd want large emulations to stress 
JFFS3. Being able to simulate areas up to, say, 16Gbytes for now would be a 
nice thing.

A way of simulating a failure (bit flip, write error) would also be handy for 
testing fs and ecc error handling.


Tell me if you need a guinea pig.

-- Charles
