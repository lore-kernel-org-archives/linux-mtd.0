Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175Ojy-0005sj-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 11:32:10 +0100
Message-Id: <200205081032.g48AW8w25484@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: Robert Schwebel <robert@schwebel.de>
Subject: Re: 2.4.18-howto?
Date: Wed, 8 May 2002 12:33:29 +0200
References: <81D0D3538E3CD411AE3C00D0B7474C31C8EE37@jadran.hermes.si> <200205071614.g47GElw06345@dagobert.svc.sysgo.de> <20020507193430.D15258@schwebel.de>
In-Reply-To: <20020507193430.D15258@schwebel.de>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Am Dienstag, 7. Mai 2002 19:34 schrieben Sie:
> Hi Robert,
>
> On Tue, May 07, 2002 at 06:16:10PM +0200, Robert Kaiser wrote:
> > > I need the ADNP concaternation layer stuff...
> >
> > Does this part cause any specific trouble ? (if so, which ?)
>
> Yes, it doesn't work yet :-)
>
> # cat /proc/mtd
> dev:    size   erasesize  name
> #
>
> This is also interesting, during boot:
> DIL/Net ADNP flash: 0x400000 at 0x2000000
> FLASH virtual address: 0xc180d000
> CFI: Found no ADNP Flash Bank device at location zero


It appears you got the chip settings wrong (the (A)DNP mapping driver only 
provides the mappings for the flash chip(s), but doesn't directly deal with 
the flash. Therefore, you must also make the proper selections in the chip 
drivers section. It's been a while since I last did this, but I believe for 
an (A)DNP, you need the following:

CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y


Cheers

Rob


-- 
----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
