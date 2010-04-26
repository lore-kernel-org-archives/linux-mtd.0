Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6NyF-0002ui-VF
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2010 13:03:32 +0000
Subject: Re: Obtaining start/end address of an MTD partition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: matt@bubblegen.co.uk
In-Reply-To: <afe027b8af6429f1eaf61baae36235d3.squirrel@webmail.plus.net>
References: <afe027b8af6429f1eaf61baae36235d3.squirrel@webmail.plus.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Apr 2010 15:59:27 +0300
Message-ID: <1272286767.17386.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-04-26 at 12:05 +0100, Matthew Lear wrote:
> Hello all,
> 
> Is it possible to obtain an MTD partition's starting address through usage
> of the MTD ioctls? I've had a very quick look and from what I can tell,
> this doesn't seem to be possible.
> 
> To be clear, I'd like to obtain the addresses below (displayed by Linux
> when it detects the MTD partitions on boot).
> 
> Creating 6 MTD partitions on "physmap-flash.0":
> 0x00000000-0x00120000 : "RedBoot"
> 0x00120000-0x01000000 : "foo"
> 0x01000000-0x01400000 : "bar"

Did you try 'cat /proc/mtd' ?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
