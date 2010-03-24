Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NuSfA-0004VK-MZ
	for linux-mtd@lists.infradead.org; Wed, 24 Mar 2010 15:38:37 +0000
In-Reply-To: <4BAA11DF.3060306@algotrim.com>
References: <4BAA11DF.3060306@algotrim.com>
Subject: Re: Enabling D-cache for OneNAND bufferram
To: Leo Barnes <leo.barnes@algotrim.com>
Message-ID: <OF34D80617.67587BAB-ONC12576F0.00554519-C12576F0.005583EF@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 24 Mar 2010 16:34:03 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
> Hello!
>
> I am currently writing a piece of software that takes advantage of the
> fact that OneNAND supports read-while-loading. What I am doing is trying
> to achieve higher efficiency when decoding data from the OneNAND by
> decoding data that is available in the OneNAND bufferram directly
> instead of copying it to normal RAM and decoding there. So far, I have
> gotten quite poor results due to the fact that the bufferrams are not
> cached (for good reason since it is Device memory). My software will be
> used on ARM devices of different types, with my testrigs being a Nokia
> N810 and a N900.
>
> I have exclusive access to the OneNAND chip, and as such know exactly
> what information is stored in the bufferrams at all times. If I could
> only enable the D-cache for the bufferrams, I could therefore make sure
> to invalidate the cache whenever I reprogram the OneNAND chip.
>
>  From what I have read so far, it seems that the only way to enable
> cacheing of the bufferrams would be to somehow change how the memory
> attributes for the memory region in the MMU. I have however not found
> any easy way of doing this. Any tips? I dont really have very much
> experience when it comes to how the MMU works.

Have a look at ioremap_cached(). Seems to be availabe on ARM
Basically you need to create a second virtual address mapping of the devices
RAM which is cached.

    Jocke
