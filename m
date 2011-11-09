Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RO6vu-0005nE-S2
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2011 12:07:12 +0000
Received: from [192.168.12.102] (156.sub-166-250-3.myvzw.com [166.250.3.156])
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id pA9C741j039311
 (version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Wed, 9 Nov 2011 04:07:05 -0800 (PST)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <4EBA7AC3.4080205@newsguy.com>
Date: Wed, 09 Nov 2011 05:06:11 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] Add the snappy-c compressor to lib
References: <1319978255.2126.33.camel@koala> <1319978545.2126.37.camel@koala>
 <4EBA5F7C.6000506@parrot.com>
In-Reply-To: <4EBA5F7C.6000506@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/09/2011 03:09 AM, Matthieu CASTET wrote:
>> On Sun, 2011-10-30 at 14:37 +0200, Artem Bityutskiy wrote:
>>> This is a C port of the google snappy compressor. It has roughly
>>> comparable compression to LZO, but is significantly faster on many file
>>> types. For example it beats all other compressors on already
>>> compressed data.
>> Sounds cool, thanks Andi! Is any UBIFS user interested to try this out?
>> I think this stuff needs some real users to make it go into mainline
>> smoothly.
>>
> I could be interresting to have benchmarks on arm (or other system where UBIFS
> is used).
>
> snappy use lot's of unaligned access.
> They need to be emulated on pre-armv6 core.


I'm currently testing ubifs on armv5 (xscale).  If you'd like me to collect some
benchmark data, I'd be glad to help if you can provide a little guidance.

Thanks,
Mike
