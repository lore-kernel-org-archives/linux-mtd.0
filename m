Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs8M1-0002Yc-Fv
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 12:00:22 +0000
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
To: dedekind1@gmail.com, Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon> <1446035085.12536.71.camel@gmail.com>
 <20151030091521.439f436b@bbrezillon> <1446196090.6126.48.camel@gmail.com>
 <20151030104537.2196c4a8@bbrezillon> <1446205395.6126.69.camel@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Andrea Scian
 <rnd4@dave-tech.it>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMICIiKGJlYW5odW8pIiI=?= <beanhuo@micron.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56335BB7.1020403@nod.at>
Date: Fri, 30 Oct 2015 12:59:51 +0100
MIME-Version: 1.0
In-Reply-To: <1446205395.6126.69.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.10.2015 um 12:43 schrieb Artem Bityutskiy:
> On Fri, 2015-10-30 at 10:45 +0100, Boris Brezillon wrote:
>> Moreover, the standard GC only takes place when you can't find a free
>> LEB anymore, which will probably happen when you reach something
>> close
>> to half the partition size in case of MLC chips (it may be a bit
>> higher if you managed to occupy more than half of each LEB capacity).
>> This means that your FS will become slower when you reach this limit,
>> though maybe this can be addressed by triggering the GC before we run
>> out of free LEBs.
> 
> Right. I'd call it a detail. But the big picture is - if you have to GC
> all the data you write, you write twice. When exactly you do the second
> write is a detail - sometimes it is deferred, it is in background etc,
> sometimes right away - you have to GC older data before being able to
> write new data.

That is a valid concern.
But to me the idea sounds promising and is worth a try.
We will stress test it and figure how much the actual overhead is.

Thanks,
//richard
