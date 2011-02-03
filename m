Received: from mail.de.keymile.com ([195.8.104.1])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pkv4q-0006k7-5S
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2011 09:02:09 +0000
Message-ID: <4D4A6F05.30401@keymile.com>
Date: Thu, 03 Feb 2011 10:01:57 +0100
From: Holger Brunck <holger.brunck@keymile.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 0/7] UBIFS: fix recovery on CFI NOR
References: <1296634917-19335-1-git-send-email-dedekind1@gmail.com>
	<4D497663.3070806@keymile.com> <1296666971.30461.8.camel@localhost>
In-Reply-To: <1296666971.30461.8.camel@localhost>
Content-Type: text/plain;
	charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Anatolij Gustschin <agust@denx.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 02/02/2011 06:16 PM, Artem Bityutskiy wrote:
> Hi,
> 
> On Wed, 2011-02-02 at 16:21 +0100, Holger Brunck wrote:
>> I have tested this patches on an ppc82xx and ppc83xx boards with different NOR
>> flashes with different writebuffers (64 and 1024 bytes) and check wether I am
>> able to mount previous created UBIFS partitions and this works without any
>> problems. So the incompatbility seems to be solved. Additionaly I tried it on a
>> NAND based system and this runs also without problems.
> 
> OK, thanks!
> 
>> Another question related to the writebuffer adaptions for UBI. What should be
>> done during creation of ubi images on a host system with ubinize if your patches
>> find their way in the "standard" UBI/UBIFS code. 
> 
> Nothing, when creating images you specify min. I/O size, which is 1 in
> case of NOR.
> 
>> In the past we had "only" NOR
>> flashes with a writebuffer of 64 bytes and we create our ubi images without the
>> -m parameter during executing ubinize for the esw image.
> 
> No, you always specify 1. Your flash still allows writing 1 byte at a
> time, and this is the minimum, so you set -m 1.
> 
> 64 is the internal detail, the "optimal" write size. UBIFS will
> automatically pick it up and will try to write in 64-byte chunks at a
> time, but not always, only when it is possible.
> 
>>  Now we got a new flash
>> with writebuffer = 1024. Whats the way forward in the future? Is it ok to omit
>> the "-m" parameter or do we have to create the images with "-m 64" or "-m 1024"?
> 
> Similarly, just use -m 1
> 

ah ok. This was exactly what I figure out from the UBI/UBIFS documentation, but
due to the discussions and patches for the min I/O sizes adaptions I was a
little bit unsure what to do. Thanks for the clarification.

Regards
Holger
