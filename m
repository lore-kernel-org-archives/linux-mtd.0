Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FM01v-0004pw-RY
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 04:54:05 -0500
Message-ID: <44211E6E.7070406@yandex.ru>
Date: Wed, 22 Mar 2006 12:52:46 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Alexander Belyakov <alexander.belyakov@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>	
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<44211B5F.2030200@intel.com>
In-Reply-To: <44211B5F.2030200@intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Alexander Belyakov wrote:
> At the stage of writing CONFIG_CMDLINE (mtdpart and mtdstripe parts) 
> user generally do not know what mtd device number will be assigned to 
> each partition. Using names IMO is a better solution if mtdstripe is a 
> built-in module since user gives and uses partition names by himself.
> 
> Using /proc/mtd and stripe mtd device by number (your suggestion) can be 
> quite good for loadable from command line mtdstripe.ko module. But using 
> two different configuration methods for built-in and loadable module can 
> be quite confusing for user.
But still, for example, if I want to use mtdram device, it is named 
"mtdram test device", and using this name as a parameter of mtdstripe.ko 
  looks insane.

> Suggested algorithm supports striping for devices with different 
> erasesize. In that (quite uncommon) case erasesize of superdevice is not 
> just erasesize of subdevice multiplied by number of subdevices.

Oh, this is interesting. You didn't mention this in the first mail, 
right? You said that flashes must be the same...

So, If I have 2 flash chips, with eraseblock size X and Y, X < Y, I 
still can stripe them? Well, fair enough. Am I right that you just merge 
eraseblocks of the second chip to make the resulting "merged" eraseblock 
not less then Y? E.g., you use N eraseblock of chip 2 for each 
eraseblock of chip 1, where N = [X/Y] + 1, right?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
