Received: from mga02.intel.com ([134.134.136.20] helo=orsmga101-1.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FM0Xd-0005rS-12
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 05:26:59 -0500
Message-ID: <4421263A.7010900@intel.com>
Date: Wed, 22 Mar 2006 13:26:02 +0300
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>	
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<44211B5F.2030200@intel.com> <44211E6E.7070406@yandex.ru>
In-Reply-To: <44211E6E.7070406@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Artem B. Bityutskiy wrote:
> But still, for example, if I want to use mtdram device, it is named 
> "mtdram test device", and using this name as a parameter of 
> mtdstripe.ko  looks insane.

True. Of course, it is possible to add mtd device number support for 
insmod configuration. I believe it is not the main issue.

>
>> Suggested algorithm supports striping for devices with different 
>> erasesize. In that (quite uncommon) case erasesize of superdevice is 
>> not just erasesize of subdevice multiplied by number of subdevices.
>
> Oh, this is interesting. You didn't mention this in the first mail, 
> right? You said that flashes must be the same...

It was said that flashes must be of the same type. We can't stripe NOR 
and NAND, but only NOR and NOR or NAND and NAND. Flashes of the same 
type can differ in erasesize and total size. Important thing that 
striping two devices with essentially different write/erase speed will 
not give significant performance increase since striped device will work 
with the speed of the slowest subdevice.

>
> So, If I have 2 flash chips, with eraseblock size X and Y, X < Y, I 
> still can stripe them? Well, fair enough. Am I right that you just 
> merge eraseblocks of the second chip to make the resulting "merged" 
> eraseblock not less then Y? E.g., you use N eraseblock of chip 2 for 
> each eraseblock of chip 1, where N = [X/Y] + 1, right?
>

Oh, it seems you meant N=[Y/X]+1 as X < Y. Anyway it is not right in 
general case. But you got the main idea - the virtual "merging" of 
subdevice eraseblocks.

Erasesize of superdevice is (erasesize_lcm * subdevice_number), where 
erasesize_lcm is least common multiple of subdevices erasesizes, and 
subdevice_number is a number of subdevices to be striped.

Thanks,
Alexander Belyakov
