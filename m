Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqdVT-0007pG-Rk
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 08:19:40 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 03/10] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Fri, 08 May 2015 10:19:06 +0200
Message-ID: <5461819.J0QLFmC4Wg@wuerfel>
In-Reply-To: <20150508020113.GY32500@ld-irv-0074>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <2668469.V5VmYNtzFN@wuerfel> <20150508020113.GY32500@ld-irv-0074>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>, linux-mtd@lists.infradead.org,
 Gregory Fong <gregory.0xf0@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Anatol Pomazao <anatol@google.com>, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 07 May 2015 19:01:13 Brian Norris wrote:
> 
> Would this satisfy you?
> 
> From: Brian Norris <computersforpeace@gmail.com>
> Date: Tue, 5 May 2015 17:46:42 -0700
> Subject: [PATCH] mtd: brcmstb_nand: fixup endianness assumptions
> 
> All users of this controller (MIPS or ARM) have previously used native
> I/O (__raw{read,write}l()) to access registers. This is normal for the
> MIPS case, where BMIPS chips often have a boot-strap that configures not
> only the CPU, but also all the busing, to use a given endianness.
> However, newer ARM cores support switching to big endian mode at
> runtime, which would leave us with different bus and CPU endianness. For
> these cases, we should use the endian-switching accessors, so we
> continue to access the NAND core in little endian mode.
> 
> Suggested by Arnd.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> 

Yes, looks good, thanks!

	Arnd
