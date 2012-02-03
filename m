Received: from mail.grid-net.com ([97.65.115.2])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtSL6-0002oX-Es
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 23:14:46 +0000
Message-ID: <4F2C6A58.6060500@grid-net.com>
Date: Fri, 03 Feb 2012 15:14:32 -0800
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Comparing UBI volumes to generate patch for upgrades
References: <4F298507.5010600@grid-net.com>
 <1328260703.13362.3.camel@sauron.fi.intel.com>
In-Reply-To: <1328260703.13362.3.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/03/2012 01:18 AM, Artem Bityutskiy wrote:
> On Wed, 2012-02-01 at 10:31 -0800, Subodh Nijsure wrote:
>> one option is  use VCDIFF/bsdif or variation there-of and generate a
>> binary diff package.
>>
>> option 2 is write a tool that compares UBI volume layout for revision 1
>> and UBI volume layout for revision 2 and then send that difference,
>> along the lines of what is outlined in the paper @
>> http://www.icmu.org/icmu2010/Papers/3-1.pdf
> I guess you can do this for R/O volumes, but not R/W.
Yes we would do this 'upgrade' on read-only volume.
>
> Depending on how much extra flash you have, you may do the actual update
> in a power-off-tolerant manner or not.
Actually we do have to do this upgrade in power-off-tolerant manner, but 
hardware does give us few seconds of "battery backed" power, and 
indicates to software that shutdown is imminent.
>> We are just getting started writing a tool to compare UBI volumes, but I
>> want to send out querry to UBI experts to see if there are some
>> fundamental issues with UBI that would make comparing UBI volumes and
>> applying such a patch would be a non-starter.
> I assume you are not planning to do this stuff in kernel space, right?
Not planning to this in kernel space.
