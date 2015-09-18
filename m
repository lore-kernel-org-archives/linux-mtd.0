Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcpvH-0005r8-FS
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 07:17:32 +0000
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
To: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, dedekind1@gmail.com
References: <20150917152240.757c9e90@bbrezillon>
 <1442503239.19983.18.camel@gmail.com> <20150917174642.0c983136@bbrezillon>
 <55FAEEB1.50401@nod.at>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?UWkgV2FuZyDnjovotbcgIihxaXdhbmcpIg==?= <qiwang@micron.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <55FBBA6E.9070203@dave-tech.it>
Date: Fri, 18 Sep 2015 09:17:02 +0200
MIME-Version: 1.0
In-Reply-To: <55FAEEB1.50401@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear all,

Il 17/09/2015 18:47, Richard Weinberger ha scritto:
> Boris,
>
> Am 17.09.2015 um 17:46 schrieb Boris Brezillon:
>>> I'd
>>> also write a good UBI power-cut test application.
>> Not sure what you mean by a UBI power-cut application?
> UBI has a mechanism so emulate a power-cut. Userspace
> can trigger it. I assume Artem meant that we could extend the mechanism
> to emulate paired page related issues in UBI.
>
>>> And then I'd start
>>> playing with various implementation approaches.
>> Yep, that was the plan, I was hoping you could help me exclude some of
>> them, but I guess testing all of them is the only way to find the
>> best one :-/.
>>
>>> I'd use the test-driven
>>> approach.
>> Hm, yep I guess that's the only way to test as much cases as possible,
>> but even with that I doubt I'll be able to think of all the cases that
>> could happen in real world.
> Yeah, the crucial point is that we have to emulate paired pages very good.
> Testing using emulation is nice but we need bare metal tests too.
> I have one board with MLC NAND, I'll happily wear it do death. B-)

I think Boris has the same board somewhere ;-)

I perfectly understand the reason why using nandsim (and powercut 
simulator in general) but, AFAIK, the powercut problem is hard to 
"simulate" because the main issue is when the device see a loss of power 
in the middle of an operation (page write or block erase)

I think that the best approach for bare metal test is something like the 
following:
- connect a real powercut device (a simple relais that cut the main 
power supply driven by a GPIO)
- drive this device inside the MTD code (probably with random delay 
after issuing a NAND command)

I think that I (as DAVE) can provide this kind of hardware, with an easy 
plug-in connector on our hostboard (if those are the one that Richard 
speak about).
Please let me know if you're interesting in it, if so I'll forward this 
request to our hardware guys and give you an official confirm.

While running this kind  of test, I would also increase CPU load, to 
reduce bypass capacitor intrusion (which may lead to wrong result in a 
generic case)

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems
