Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZccM3-0001rr-4k
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 16:48:16 +0000
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
To: Boris Brezillon <boris.brezillon@free-electrons.com>, dedekind1@gmail.com
References: <20150917152240.757c9e90@bbrezillon>
 <1442503239.19983.18.camel@gmail.com> <20150917174642.0c983136@bbrezillon>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Andrea Scian
 <rnd4@dave-tech.it>, =?UTF-8?B?UWkgV2FuZyDnjovotbcgIihxaXdhbmcpIg==?=
 <qiwang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55FAEEB1.50401@nod.at>
Date: Thu, 17 Sep 2015 18:47:45 +0200
MIME-Version: 1.0
In-Reply-To: <20150917174642.0c983136@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

Am 17.09.2015 um 17:46 schrieb Boris Brezillon:
>> I'd
>> also write a good UBI power-cut test application.
> 
> Not sure what you mean by a UBI power-cut application?

UBI has a mechanism so emulate a power-cut. Userspace
can trigger it. I assume Artem meant that we could extend the mechanism
to emulate paired page related issues in UBI.

>> And then I'd start
>> playing with various implementation approaches.
> 
> Yep, that was the plan, I was hoping you could help me exclude some of
> them, but I guess testing all of them is the only way to find the
> best one :-/.
> 
>> I'd use the test-driven
>> approach.
> 
> Hm, yep I guess that's the only way to test as much cases as possible,
> but even with that I doubt I'll be able to think of all the cases that
> could happen in real world.

Yeah, the crucial point is that we have to emulate paired pages very good.
Testing using emulation is nice but we need bare metal tests too.
I have one board with MLC NAND, I'll happily wear it do death. B-)

Thanks,
//richard
