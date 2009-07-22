Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTdEq-0003Jz-PC
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 14:56:18 +0000
Message-ID: <4A6727DE.4020005@gmail.com>
Date: Wed, 22 Jul 2009 17:53:18 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Canella Matteo <Matteo.Canella@mta.it>
Subject: Re: LEB size configuration
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>	<4A66B547.6020207@nokia.com>	<BD9F3F3F5A6CCF4BA032B9FED4DD312E5D09531F0B@mta-digimail.MTA.INT>	<4A66D988.4050503@nokia.com>
	<BD9F3F3F5A6CCF4BA032B9FED4DD312E5D09531F36@mta-digimail.MTA.INT>
In-Reply-To: <BD9F3F3F5A6CCF4BA032B9FED4DD312E5D09531F36@mta-digimail.MTA.INT>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/22/2009 05:32 PM, Canella Matteo wrote:
> Hi Adrian, thank you for your reply,
>
>> The possibility exists to double the eraseblock size by treating 2
>> eraseblocks as
>> though it was 1.  That should halve the UBI load time to 3 seconds but
>> it would
>> use a bit more memory in UBIFS.  Of course you could double again, with
>> yet
>> more memory required by UBIFS.
>
> I'm a little bit jammed...  I surfed all the docs and faqs but I can't find the answers.
> I'm trying to double the logical erase block size.
> I've a 1Gb NAND flash.
>
> Here's my steps:
>
> Looking to the old dmesg of the flash mounting I see:
> [    6.705712] UBI: logical eraseblock size:    126976 bytes
>
> First question: Why LEB size needs to be smaller than PEB size? PEB size is 128KiB = 131072 byte. Is it mandatory to have LEB size smaller than PEB size? How much smaller?

You cannot improve your UBI attach time without doing coding,
unfortunately. If you are ready to do coding, you should really
go through UBI documentation. It answers your question.

> Whatever, I try to double this value:
> mkfs.ubifs  -m 2048 -e 253952 -c 4096 -o ubifs.img

Sorry, but you really should spend more time reading docs if you want to
improve UBI/UBIFS. From what I see you do not really distinguish between
UBI and UBIFS.

> the "-e" option is the LEB size (126976 * 2 = 253952)
> "-c" option is the max LEB count, so I guess 4096 for 1 Gigabyte is the right number.

The suggested change should be done either on MTD level, or on UBI level.
The FAQ entry I wrote for you briefly explains how one could do this on
UBI level.

...
> Here I've got an error and the logical eraseblock size that isn't what I expected (126976 instead of 253952).

Yes, you have created UBIFS image for larger LEB, but UBI does not support
it, so you see errors because of that disagreement.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
