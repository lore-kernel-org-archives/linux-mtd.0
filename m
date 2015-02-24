Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQAta-0008OC-BZ
 for linux-mtd@lists.infradead.org; Tue, 24 Feb 2015 08:31:11 +0000
Message-ID: <54EC369D.7090108@openwrt.org>
Date: Tue, 24 Feb 2015 21:30:21 +1300
From: Felix Fietkau <nbd@openwrt.org>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 3/3] mtd: block2mtd: Removes PAGE_MASK as a index to
 partition size
References: <1444809468.34812041.1410206680931.JavaMail.zimbra@redhat.com>
 <20140909170231.GA14429@logfs.org>
 <1807144344.40128259.1410985683342.JavaMail.zimbra@redhat.com>
 <20141105202303.GN23619@ld-irv-0074>
 <2086372266.7454667.1415535533979.JavaMail.zimbra@redhat.com>
 <1874445287.7454806.1415535792984.JavaMail.zimbra@redhat.com>
 <20141126072147.GO3212@norris-Latitude-E6410>
 <1417070032.4547583.1417007972343.JavaMail.zimbra@redhat.com>
 <20150224080752.GF24441@norris-Latitude-E6410> <54EC344F.3050709@openwrt.org>
 <20150224082725.GG24441@norris-Latitude-E6410>
In-Reply-To: <20150224082725.GG24441@norris-Latitude-E6410>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: =?windows-1252?Q?J=F6rn_Engel?= <joern@logfs.org>,
 Herton Krzesinski <hkrzesin@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Rodrigo Freire <rfreire@redhat.com>,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015-02-24 21:27, Brian Norris wrote:
> On Tue, Feb 24, 2015 at 09:20:31PM +1300, Felix Fietkau wrote:
>> On 2015-02-24 21:07, Brian Norris wrote:
>> > On Wed, Nov 26, 2014 at 08:19:32AM -0500, Rodrigo Freire wrote:
>> >> From: "Brian Norris" <computersforpeace@gmail.com>
>> >> Sent: Wednesday, November 26, 2014 5:21:47 AM
>> >> Subject: Re: [PATCH v3 3/3] mtd: block2mtd: Removes PAGE_MASK as a index to
>> >> partition size
>> >> 
>> >> > On Sun, Nov 09, 2014 at 07:23:12AM -0500, Rodrigo Freire wrote:
>> >> > > - dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
>> >> > > + dev->mtd.size = dev->blkdev->bd_inode->i_size & ~(erase_size - 1);
>> >> 
>> >> > You never guaranteed that erase_size is a power of two, so this doesn't
>> >> > necessarily mask the way you'd like...
>> >> 
>> >> > But also, why is this even necessary? I see that we should already have
>> >> > errored out if this was actually significant, since we have above:
>> >> 
>> >> > if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
>> >> > pr_err("erasesize must be a divisor of device size\n");
>> >> > goto err_free_block2mtd;
>> >> > }
>> >> 
>> >> Hello Brian, and thanks for the review.
>> >> 
>> >> Honestly, I'd leave that untouched, but Jörn pointed that it could be a issue at https://lkml.org/lkml/2014/9/9/680
>> >> 
>> >> I'd happily let it go without this patch 3, unless Jörg wants to state otherwise.
>> > 
>> > OK let's drop this patch from the series. At best, we could just do
>> > something like this instead:
>> > 
>> > -	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
>> > +	dev->mtd.size = dev->blkdev->bd_inode->i_size;
>> > 
>> > But that's really just an unnecessary change.
>> If I remember correctly, it was problematic to have a dev->mtd.size
>> value which is not a multiple of the erase size. I think that was the
>> reason for patch 3.
> 
> The what's this for?
> 
> 	if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
> 		pr_err("erasesize must be a divisor of device size\n");
> 		goto err_free_block2mtd;
> 	}
I think we should just trim the mtd size to a multiple of erase size and
remove this check. It is a bit impractical for many cases.

- Felix
