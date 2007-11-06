Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1IpSyD-0001cz-Nn
	for linux-mtd@lists.infradead.org; Tue, 06 Nov 2007 13:16:19 -0500
Date: Tue, 6 Nov 2007 19:11:22 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Matt Reimer <mattjreimer@gmail.com>
Subject: Re: [PATCH] MTD: fix s3c2410 error correction
Message-ID: <20071106181121.GH25953@lazybastard.org>
References: <1192755764-26269-1-git-send-email-mattjreimer@gmail.com>
	<f383264b0710251116v8847c64i871ba7675106e04f@mail.gmail.com>
	<f383264b0711060909r43cd9d38t2653785cb79e3a65@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f383264b0711060909r43cd9d38t2653785cb79e3a65@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 6 November 2007 09:09:00 -0800, Matt Reimer wrote:
> 
> ping

Ben doesn't seem to comment on this, so I will.  And I must say, I don't
like the function either before or after your patch.

1. In principle this is just the bog-standard 1-bit error correction
   code everyone and his dog is using.
2. The original version of this function is subtly different from
   nand_correct_data().  12 of the constants are off-by-one.  But no
   explanation why.
3. After your patch the bit-position constants are back to original, the
   0x54 remains 0x55, half the byte-position constants are back to
   original and the other half that were identical are off-by-one now.
   Still no explanation why.

So my first question is not whether your patch is correct or not, but
what makes s3c2410 so different from all the other bog-standard ecc
schemes?


Side note:
The last conditional in both functions,
	if ((diff0 & ~(1<<fls(diff0))) == 0)
can be replaced by is_power_of_2().

Jörn

-- 
Happiness isn't having what you want, it's wanting what you have.
-- unknown
