Received: from mika.eatserver.nl ([195.20.9.75])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pfvzp-0000wL-70
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2011 15:00:21 +0000
Message-ID: <4D384DE7.10602@aimvalley.nl>
Date: Thu, 20 Jan 2011 15:59:51 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Holger Brunck <holger.brunck@keymile.com>
Subject: Re: MTD concat support for linux and UBI
References: <4D3845AE.2040002@keymile.com>
In-Reply-To: <4D3845AE.2040002@keymile.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org,
	"agust@denx.de" <agust@denx.de>, Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/20/11 15:24, Holger Brunck wrote:
> Hi all,
> I have got a general question to the MTD concat feature in Linux. Is it allowed
> to concatenate NOR flashes with different writebuffersizes? Currently the code
> allows this.
> If so I see a problem for different sizes when dealing with UBI volumes
> comprehending such flashes. Some days ago some patches were added to adjust the
> min I/O size for UBI to the writebuffersize of the flash. If now two flashes
> with different writebuffersizes are concatenated whats the way forward? I see
> two solutions:
> 1) Using the writebuffersize from the flash with the largest writebuffer for min
> I/O size in UBI.
> 2) Adapting the concat feature in Linux to forbid concatenating flashes with
> different writebuffersizes.
>

You're right.

MTD concat already checks for incompatibilites between the
subdevices and I guess it should take into account writebuffer
size too.

---
N. van Bolhuis.
