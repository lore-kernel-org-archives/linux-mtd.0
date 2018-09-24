Received: from mail-he1eur04on071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::71d]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4L2b-0006Y6-M6
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 07:12:23 +0000
In-Reply-To: 
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Peter Rosin <peda@axentia.se>
Subject: Re: [GIT PULL] UBIFS fixes for 4.19-rc4
Message-ID: <2bdd37c6-17af-e216-d865-fad2c6ff6dae@axentia.se>
Date: Mon, 24 Sep 2018 09:11:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I fredags, den 21 september 2018, 15:53:42 CEST skrev Greg KH:
> On Fri, Sep 21, 2018 at 11:33:15AM +0200, Richard Weinberger wrote:
>> Greg,
>> 
>> The following changes since commit ae596de1a0c8c2c924dc99d23c026259372ab234:
>> 
>>   Compiler Attributes: naked can be shared (2018-09-20 15:23:58 +0200)
> 
> Wow, bold move, new patches with less than 24 hours in your tree.  That
> means linux-next didn't see them :(
> 
>> are available in the Git repository at:
>> 
>>   git://git.infradead.org/linux-ubifs.git tags/upstream-4.19-rc4
> 
> Now pulled, but really, don't you think that they should at least go
> through 0-day first?  Maybe no one runs ubifs on mainline kernels...

FWIW, we do...

Cheers,
Peter
