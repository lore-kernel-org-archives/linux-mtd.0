Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tvox0-00079O-Mk
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 12:52:17 +0000
Message-ID: <50F7F3EB.9080801@hauke-m.de>
Date: Thu, 17 Jan 2013 13:51:55 +0100
From: Hauke Mehrtens <hauke@hauke-m.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2] mtd: bcm47xxpart: simplify size calculation to one
 loop
References: <1357484916-29965-1-git-send-email-zajec5@gmail.com>
 <1358426286.2731.245.camel@sauron.fi.intel.com>
In-Reply-To: <1358426286.2731.245.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01/17/2013 01:38 PM, Artem Bityutskiy wrote:
> On Sun, 2013-01-06 at 16:08 +0100, Rafał Miłecki wrote:
>> Signed-off-by: Rafał Miłecki <zajec5@gmail.com> --- I've checked
>> this patch and got:
>>> Successfully built configuration
>>> "mips-bcm47xx_defconfig,mips,mips-linux-", no issues
> 
> There is some breakage in upstream and aiaia cannot compile the
> bcm47xx configuration. Any idea?
> 
> init/calibrate.c:257:47: warning: no previous prototype for
> 'calibrate_delay_is_known' [-Wmissing-prototypes] In file included
> from arch/mips/bcm47xx/nvram.c:17:0: 
> include/linux/ssb/ssb.h:440:19: error: field 'gpio' has incomplete
> type In file included from include/linux/bcma/bcma.h:7:0, from
> arch/mips/include/asm/mach-bcm47xx/bcm47xx.h:23, from
> arch/mips/bcm47xx/nvram.c:22: 
> include/linux/bcma/bcma_driver_chipcommon.h:582:19: error: field
> 'gpio' has incomplete type make[3]: *** [arch/mips/bcm47xx/nvram.o]
> Error 1

This is a unrelated problem. There is a fix [0] in the mips tree on
its way into linus tree. As a workaround activate CONFIG_GPIOLIB.

Hauke

[0]: https://patchwork.linux-mips.org/patch/4759/
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iQIcBAEBAgAGBQJQ9/PmAAoJEIZ0px9YPRMy1zoP/Ajkm1OL0gsuLkQ0GAoUIHkA
oVrST3hb3Nj1XRjiwst0AZBe6qm6Nc0lO2AXDKf9lxGTr7runNkrOi/ygeIL7x2S
sYqJQrGATLPv+6IWfI0INRCAvwDRTX8apAnf0hhUNDv72fIdby1M5OCGwePLCnC/
UJBLgPGOIDny5OSwj5idByoKbLrZUvmWIPNihj9Yqwneb3jOzklxbGnzf6rocU3v
rQkxVuI4nyOu8vEtpZqMiQBFfvlGMr2UmCOlKpxaRvXYm5R4LWJvErKVF3ADMqe5
UCLn6ZQHcnHnh1yOEpxxigAblYMSHxdsFzYmqzBHc8jdKW/PhnOoSxirSL5NGINc
oQFJ0hlsXe7trcRRPNUMpUiWFCfMUgxGnkoq56eNLxAFBYaR/oBBJDIX0nHlzjA1
MfdwGMfAprI8jiFPgEyFvBUUewCeCAnHOkKX06a7Fn3aoWEqVV2+2qmlzUrnpx4f
Hb0X9pNAJ5fkvwtzx6fDhPRNKKFpgiAdLpiGisndiSf5e2JIhO2hQU3ed9PWgGUN
Vx93EyVQbWkhg7ZY2Tlh157cUHcjzNA2X8v1fWC/atimoKGrl3ECBksmWnazXiHb
HqXPhk1oxgGz1wjtz/AkDEpfQvIK3y+Oixd4YQBar+askFyLHLK02Ab5CLves3E+
ZPZYXHPoAOg5uLkbO83c
=RL+q
-----END PGP SIGNATURE-----
