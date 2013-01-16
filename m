Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TvTyt-0002IQ-Bt
 for linux-mtd@lists.infradead.org; Wed, 16 Jan 2013 14:28:44 +0000
Message-ID: <50F6B90F.8080905@gmail.com>
Date: Wed, 16 Jan 2013 15:28:31 +0100
From: Stefan Roese <stefan.roese@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: Support Persistent Protection
 Bits (PPB) locking
References: <1355387350-14002-1-git-send-email-sr@denx.de>
 <1358241038.2731.118.camel@sauron.fi.intel.com>
In-Reply-To: <1358241038.2731.118.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/15/2013 10:10 AM, Artem Bityutskiy wrote:
> On Thu, 2012-12-13 at 09:29 +0100, Stefan Roese wrote:
>> Currently cfi_cmdset_0002.c does not support PPB locking of sectors. This
>> patch adds support for this locking/unlocking mechanism. It is needed on
>> some platforms, since newer U-Boot versions do support this PPB locking
>> and protect for example their environment sector(s) this way.
> 
> Some "#ifdef CONFIG_OF"s are missing:
> 
> drivers/mtd/chips/cfi_cmdset_0002.c: In function ‘cfi_cmdset_0002’:
> drivers/mtd/chips/cfi_cmdset_0002.c:579:4: error: implicit declaration of function ‘of_property_read_bool’ [-Werror=implicit-function-declaration]

Okay. Will add in next version.

> drivers/mtd/chips/cfi_cmdset_0002.c: In function ‘do_read_secsi_onechip’:
> drivers/mtd/chips/cfi_cmdset_0002.c:1146:16: warning: variable ‘timeo’ set but not used [-Wunused-but-set-variable]
> cc1: some warnings being treated as errors
> make[4]: *** [drivers/mtd/chips/cfi_cmdset_0002.o] Error 1
> 
> Please, check allso the timeo warning.

Hmmm. I didn't touch do_read_secsi_onechip() with this patch. And I'm
not able to reproduce this warning. Are you sure this warning is
introduced by this PPB locking patch?

Thanks,
Stefan
