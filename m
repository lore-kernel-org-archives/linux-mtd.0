Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0chm-0004wi-J5
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 16:06:59 +0000
Message-ID: <4CA2129D.3070703@parrot.com>
Date: Tue, 28 Sep 2010 18:06:53 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: RE : UBI/UBIFS interrupted write page handling
References: <4C88DDD5.4060507@parrot.com>	 <1284054669.11335.21.camel@brekeke>
	<1285006478.1762.1.camel@brekeke>	 <4C9B7CD8.4070806@parrot.com>,
	<1285266914.1766.1.camel@brekeke>	
	<F5C24FC168F95048BB6B9E0B13EB33152BA6F5304E@DIAMANT.xi-lite.lan>	
	<1285523911.1776.9.camel@brekeke>
	<1285657088.2437.23.camel@localhost>	 <4CA19DAE.7030402@parrot.com>
	<1285660934.2437.44.camel@localhost>
In-Reply-To: <1285660934.2437.44.camel@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Tue, 2010-09-28 at 09:47 +0200, Matthieu CASTET wrote:
>> Artem Bityutskiy a écrit :
>>> On Sun, 2010-09-26 at 20:58 +0300, Artem Bityutskiy wrote:
>> That's better : interrupt erased page are not put anymore in corrupted list.
>> But I have problem with interrupt write :
>> this night the test crashed [1].
> 
> Yeah, this should be fixed by forcing LEB refresh for the last LEBs of
> journal heads. This problem exists long time. I'll work on this and send
> you patches.
ok
> 
> Then I'll push the patches to the linux-next. This means I'll re-base
> once again the master branch - will you survive such frequent
> re-basing :-) ?
I should. I rebased my bsp commit on top of linux-merge. So a git reset 
--hard bsp_commit_top; git pull should handle it.

> 
> We also have the outstanding gc_lnum problem - did you see it in new
> ubifs?
No, but the scenario/hardware is a bit different. I will try to 
reproduce it this night.

> 
> Also I wanted to add re-try logic to UBI read path, so that we could try
> to read several times if there is an ECC errors, because as you pointed,
> re-trying sometimes helps. However, this also needs a fix in mtd, which
> is currently in my l2 tree:
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/755e723d39ac6975e6488298e129284e30d74823
> 
So this one need a manual merge ? Can't you include in ubi-2.6 ?

Matthieu
