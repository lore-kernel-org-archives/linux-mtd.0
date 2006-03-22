Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FM0wJ-0006ku-8R
	for linux-mtd@lists.infradead.org; Wed, 22 Mar 2006 05:51:50 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Alexander Belyakov <alexander.belyakov@intel.com>
In-Reply-To: <4421263A.7010900@intel.com>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
	<1142953764.13740.0.camel@sauron.oktetlabs.ru>
	<442041BE.9070407@intel.com>
	<1142967444.13740.9.camel@sauron.oktetlabs.ru>
	<44211B5F.2030200@intel.com>
	<44211E6E.7070406@yandex.ru> <4421263A.7010900@intel.com>
Content-Type: text/plain
Date: Wed, 22 Mar 2006 13:51:10 +0300
Message-Id: <1143024670.13740.40.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-03-22 at 13:26 +0300, Alexander Belyakov wrote:
> True. Of course, it is possible to add mtd device number support for 
> insmod configuration. I believe it is not the main issue.
It's not the main, sure, just a thing you could not consider. I haven't
looked at the code at all yet.

> It was said that flashes must be of the same type. We can't stripe NOR 
> and NAND, but only NOR and NOR or NAND and NAND. Flashes of the same 
> type can differ in erasesize and total size. Important thing that 
> striping two devices with essentially different write/erase speed will 
> not give significant performance increase since striped device will work 
> with the speed of the slowest subdevice.
Ok, this only confirms that you should compose a small and nice
documentation file.

> Oh, it seems you meant N=[Y/X]+1 as X < Y. Anyway it is not right in 
> general case. But you got the main idea - the virtual "merging" of 
> subdevice eraseblocks.
Yes, sure, I should have re-read what wrote.

> Erasesize of superdevice is (erasesize_lcm * subdevice_number), where 
> erasesize_lcm is least common multiple of subdevices erasesizes, and 
> subdevice_number is a number of subdevices to be striped.

A question arises, does this make sense to stripe flashes with different
erasesize at all? Flashes should be of particular size in order not to
waste space. Any real need to make the striping layer more complex? 

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
