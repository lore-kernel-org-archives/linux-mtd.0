Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzBZ5-0007yb-I8
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 22:51:02 +0000
Received: by wmww144 with SMTP id w144so216863432wmw.1
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2015 14:50:37 -0800 (PST)
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
To: Mark Brown <broonie@kernel.org>
References: <564CEB61.2000601@gmail.com> <20151118215755.GL31303@sirena.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <564D0098.4030107@gmail.com>
Date: Wed, 18 Nov 2015 23:50:00 +0100
MIME-Version: 1.0
In-Reply-To: <20151118215755.GL31303@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 18.11.2015 um 22:57 schrieb Mark Brown:
> On Wed, Nov 18, 2015 at 10:19:29PM +0100, Heiner Kallweit wrote:
>> There have been few discussions in the past about how to handle SPI controller
>> limitations like max message length. However they don't seem to have resulted
>> in accepted patches yet.
> 
> No, they've resulted in people writing code.  We've got a bunch of
> things in the spi_master struct like the limits on speeds and bits per
> word.
> 
Sure, I'm aware of this. To you it might sound obvious to handle such
limitations in the SPI core, however there have been several attempts
to deal with such limitations in controller or protocol drivers.

>> Maybe a better approach would be to introduce a new member of spi_master
>> dealing with controller limitations.
> 
> That's what we've been doing...
> 
Primary addressees of my comment were users of the SPI core trying to deal
in their own code with things which might be better dealt with in the core.
Again, for you it's obvious ..
Just one more comment:
In case there should be more need to reflect such limitations in spi_master
it might be good to encapsulate them in a separate struct instead of adding
more such members to spi_master directly.

>> I also add an example how a protocol driver could use this extension.
>> Appreciate any comment.
>>
>>
>> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
>> index 269e8af..8a27c66 100644
> 
> Please don't send patches without a signoff, see SubmittingPatches.
> 
It wasn't meant to be actual patches, therefore I omitted some stuff
and didn't use [PATCH] in the subject.
It was meant just to be code snippets providing a little more detail.

Thanks for the comment anyway.
