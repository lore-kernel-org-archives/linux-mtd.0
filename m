Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRJvR-0000Mn-2W
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 05:54:41 +0000
Message-ID: <4A5EC0BA.30203@nokia.com>
Date: Thu, 16 Jul 2009 08:55:06 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "jfraser@broadcom.com" <jfraser@broadcom.com>
Subject: Re: open command fails in UBIFS when pass O_DIRECT Flag
References: <9bde694e0907140725t66f5361dlc10c511081462eb2@mail.gmail.com>
	<4A5D8DE5.2070900@nokia.com>
	<1247686043.26784.99.camel@chaos.ne.broadcom.com>
In-Reply-To: <1247686043.26784.99.camel@chaos.ne.broadcom.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>,
	naveen yadav <yad.naveen@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jon Fraser wrote:
> Is this planned for the future?

Not at the moment.

> Is there any technical reason that prevents implementing direct IO?

Not that I can think of.  But memory mapping is probably better and
that is supported.

> 
> Jon Fraser
> Broadcom
> 
> On Wed, 2009-07-15 at 01:05 -0700, Adrian Hunter wrote:
>> naveen yadav wrote:
>>> I am using UBIFS file system, and i am able to read/write.
>>> But when i use O_DIRECT flag it fails in open command. will you pls
>>> let me know is it issue with UBIFS.
>> UBIFS does not support direct I/O, sorry.
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
> 
> 
> 
