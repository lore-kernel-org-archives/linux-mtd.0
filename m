Received: from mail.de.keymile.com ([195.8.104.1])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PkeWA-0008C5-Og
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 15:21:16 +0000
Message-ID: <4D497663.3070806@keymile.com>
Date: Wed, 02 Feb 2011 16:21:07 +0100
From: Holger Brunck <holger.brunck@keymile.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 0/7] UBIFS: fix recovery on CFI NOR
References: <1296634917-19335-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1296634917-19335-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain;
	charset=ISO-8859-1
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

Hi Artem,

Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> Hi,
> 
> here is the patch-set against the latest Linux kernel (e.g. 2.6.38-rc3)
> which should fix CFI NOR flash recovery.
> 
> The previous attempt was not entirely successful - it broke backward
> compatibility and was reverted:
> 
> http://marc.info/?l=linux-kernel&m=129631939419818&w=2
> 
> This patch-set goes the following way:
> 1. Incorporates the notion of 'writebufsize' into UBI and UBIFS as
>    'max_write_size', because using term write-buffer would be confusing, as
>    UBIFS has its own write-buffers.
> 2. Changes UBIFS write-buffer and makes it of 'max_write_size', instead of
>    'min_io_size'. This presumably leads to better performance because we
>    accumulate more data and write them in larger chunks and faster.
>    And we do not waste space when synchronizing UBIFS write-buffers because we
>    write only the used amount of bytes aligned to 'min_io_size'. So this is an
>    improvement.
> 3. Tweak UBIFS recovery and make it aware of the fact that we can write in
>    chunks larger than 'min_io_size'. Namely, we can write in 'max_write_size'
>    chunks.
> 
> Could you guys please test this WRT power cuts and let me know if it solves the
> issues?
> 

I have tested this patches on an ppc82xx and ppc83xx boards with different NOR
flashes with different writebuffers (64 and 1024 bytes) and check wether I am
able to mount previous created UBIFS partitions and this works without any
problems. So the incompatbility seems to be solved. Additionaly I tried it on a
NAND based system and this runs also without problems.

But I am not able to check for power cut problems. We see some problems in the
combination with UBI and NOR flashes with large writebuffers (1024). But
currently we suspect some CFI driver problems see ML entry from an colleague:
http://lists.infradead.org/pipermail/linux-mtd/2011-February/033849.html

Another question related to the writebuffer adaptions for UBI. What should be
done during creation of ubi images on a host system with ubinize if your patches
find their way in the "standard" UBI/UBIFS code. In the past we had "only" NOR
flashes with a writebuffer of 64 bytes and we create our ubi images without the
-m parameter during executing ubinize for the esw image. Now we got a new flash
with writebuffer = 1024. Whats the way forward in the future? Is it ok to omit
the "-m" parameter or do we have to create the images with "-m 64" or "-m 1024"?

Best regards
Holger
