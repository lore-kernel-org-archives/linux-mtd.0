From: David Woodhouse <dwmw2@infradead.org>
To: Luke Fimmerzane <lukefimmerzane@hotmail.com>
In-Reply-To: <BAY10-F13brzvsTDWWc00016884@hotmail.com>
References: <BAY10-F13brzvsTDWWc00016884@hotmail.com>
Content-Type: text/plain
Message-Id: <1080652507.24117.175.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 30 Mar 2004 14:15:07 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Mapping driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-03-26 at 13:51 +0000, Luke Fimmerzane wrote:
> Hi,
> I'm new to MTD an jffs2.

And to email.... your lines are too long and your 'reply' is lacking
References: which connect it to this email. Please don't do that again
-- working round the automatic filter doesn't make it nice :)

> I have some very basic questions...
> My target is ARM sc32410. It contains AMD 1Mbyte and Strata flash 32 Mb
> I've looked at the directory drivers/mtd/maps and there is no mapping 
> driver.  My kernel is configured to take mtdparts command line informat
> My question is do I still need a mapping driver or does using mtdparts 
> provide the same functionality.

> physmap flash device: 2000000 at 8000000
> Using buffer write method
> mtd: Giving out device 0 to Physically mapped flash

> mtd0: 02000000 00040000 "Physically mapped flash"

Looks like it's found the StrataFlash and registered it whole as MTD
device number 0.

> when I do a ls -al I get ..
> # ls -al /dev/mtd/0
> /dev/mtd/0      /dev/mtd/0ro
> 
> I presume ro is read only but why would it be so? 

It's a device which you can use if you want only read-only access. You
can ignore it. 

> Whats the difference between the two entries?

You can't open the latter for write.

>  I've seen /dev/mtd0 and /dev/mtd/0. Which is correct?

Both. One's what you get without devfs, the other with devfs. 

> What messages should the kernel emit if everything MTD related is going

The above looks reasonable. Did you expect the AMD flash to also be
detected? You omitted the command line from your original mail, so I
can't tell why the command line partitioning isn't working -- but the
'mtd-id' you provide has to be that used in the 'name' by the physmap
device, which is "Physically mapped flash".

I'm not actually convinced there's a way of passing a mtd-id with spaces
in it. You may need to change physmap.c

> Sorry if my questions are very basic! I'm 'slavishly' following a book 
> Karim Yaghmor called " Building Embedded Linux systems" . I'm also slow
> working my way back through the mtd archives for a similar problem. Is 
> an easier way of searching the archives than by going through them year
> year?

google site:lists.infradead.org ?

-- 
dwmw2
