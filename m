Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JobAI-00041W-D0
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 09:21:22 +0000
Message-ID: <480EFF8F.40204@parrot.com>
Date: Wed, 23 Apr 2008 11:21:19 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [RFC] slight UBI scan time improvement
References: <1208882552.11721.13.camel@sauron>	
	<20080423073840.GA9472@cloud.net.au> <480EEFAB.7010304@parrot.com>
	<1208938864.11721.44.camel@sauron>
In-Reply-To: <1208938864.11721.44.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Nancy <nancydreaming@gmail.com>, linux-mtd@lists.infradead.org,
	Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> Hi,
>>>
>>> Hamish
>> Do you know when the bad block scanning finish and the ubi scan start ?
> 
> Good point Matthieu. Indeed, _at least_ 1.23 sec is spend in the driver
> for scanning against bad eraseblocks to build in-memory bad block table
> (BBT). And it is probably more than 1.23 sec. If you start using
> on-flash bad block table, this should go away. I never used on-flash
> BBT, but I know MTD supports this and for example OLPC has on-flash BBT.
> 
May be UBI should print a message at startup.


Matthieu
