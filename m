Received: from rcsinet10.oracle.com ([148.87.113.121])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaD9w-0002aY-Jp
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 20:39:25 +0000
Message-ID: <4E04F5D0.9090900@oracle.com>
Date: Fri, 24 Jun 2011 13:38:40 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: linux-next: Tree for June 24 (mtd + of)
References: <20110624155822.cb8cf6eb.sfr@canb.auug.org.au>	
	<20110624090456.191f1fda.randy.dunlap@oracle.com>
	<1308947172.13493.37.camel@koala>
In-Reply-To: <1308947172.13493.37.camel@koala>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Vitaly Wool <vwool@ru.mvista.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/24/11 13:26, Artem Bityutskiy wrote:
> On Fri, 2011-06-24 at 09:04 -0700, Randy Dunlap wrote:
>> On Fri, 24 Jun 2011 15:58:22 +1000 Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> Changes since 20110623:
>>>
>>> My fixes tree includes:
>>> 	(as an experiment) the early part of mmotm-2011-06-22-13-05
>>> 	STAGING: Comedi: Build only on arches providing PAGE_KERNEL_NOCACHE
>>
>>
>> When CONFIG_MTD=m, CONFIG_MTD_OF_PARTS=y:
>>
>> drivers/mtd/ofpart.o: In function `init_module':
>> ofpart.c:(.init.text+0x0): multiple definition of `init_module'
>> drivers/mtd/mtdcore.o:(.init.text+0x43): first defined here
> 
> I guess this is some old issue? I do not think ofpart can be compiled-in
> if the mtd core is a module...

[adding driver author, Vitaly]

No, it's a current issue.

config MTD_OF_PARTS
	def_bool y
	depends on OF

and (implicitly) depends on MTD.  MTD=m, so boolean => y.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
