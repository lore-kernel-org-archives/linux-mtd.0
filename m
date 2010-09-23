Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyoRJ-0002R5-AL
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 16:14:29 +0000
Message-ID: <4C9B7CD8.4070806@parrot.com>
Date: Thu, 23 Sep 2010 18:14:16 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: UBI/UBIFS interrupted write page handling
References: <4C88DDD5.4060507@parrot.com>	 <1284054669.11335.21.camel@brekeke>
	<1285006478.1762.1.camel@brekeke>
In-Reply-To: <1285006478.1762.1.camel@brekeke>
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

Hi Artem,

Artem Bityutskiy a écrit :
> On Thu, 2010-09-09 at 20:51 +0300, Artem Bityutskiy wrote:
>>> On one of our test, we are in case 3. Ubifs find a valid interrupt page 
>>> on mount and trust it. Latter the page become corrupted [1] because it 
>>> is unstable.
>> OK, I see.
>>
>>> To identify a interrupted write page we :
>>> - could use interrupted flags for static volume
>>> - handle with care data move (copy flags) : if sqnum of the copy is the 
>>> biggest, we should ignore it/copy it.
>>> - use upper layer for dynamic volume. For ubifs this could be a journal.
>> Actually, for UBIFS things are rather simple. In UBIFS every writes go
>> to the journal. Even GC writes to the journal. So when we are mounting
>> after an unclean reboot, we can simply refresh the last LEBs of all
>> journal heads using the 'ubi_leb_change()' call. This should handle all
>> the three cases you describe.
>>
>> I do not think it is very difficult to do.
> 
> Matthieu, I can try to do to make some patches for you, but when you
> come back on-line and start actively testing :-) I do want to help you
> and improve UBIFS, but I'm not very motivated to do this unless this is
> really needed. I think we have few other pending issues, and the ball is
> on your side. :-)
> 
Ok.

I will run some tests this weekend.

What I have to test ?

- 
http://git.infradead.org/users/dedekind/ubifs-v2.6.28.git/commit/7240a7396fa4b1998d0463123c6d1d192935f969
- UBI reliability improvements patch
- c->gc_lnum is -1 patch

thanks,

Matthieu
