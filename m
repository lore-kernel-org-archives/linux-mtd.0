Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9iIl-0005QQ-ML
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2005 06:27:32 -0500
Date: Fri, 11 Mar 2005 12:27:30 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050311112730.GC11203@synertronixx3>
References: <20050311104457.GB11203@synertronixx3> <42317DD7.3090205@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42317DD7.3090205@yandex.ru>
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-11 14:15 +0300 schrieb Artem B. Bityuckiy:
> Konstantin Kletschke wrote:
> > The "Name CRC failed on node at ..." is away. I populated the root-fs
> Good.

But is moving the memcpy function a valid fix? There must be something
really wrong which should be fixed :/ DCache corruption i.e. missing
invalidating at the right time?

> 
> > root-fs. No problems. But mounting takes ages :)
> How much time does "ages" mean ?
> Do you stand that it was faster before?

Sorry, my apologies! CONFIG_MTD_DEBUG_VERBOSE was on 2, on 0 I get
reasonable mount time again, I am very sorry for misleading you!

> How large is your flash?

16MB, the root-fs is 5MB...

> Do you have directories with huge files number in it (say, ~ 10000)?

No.

> A: This means that flash_eraseall ought to write special node called 
> cleanmarker at the beginning of each block.

> If you are sure that the problem is not your slow flash driver, you 
> might try Ferenc's "summary" patch.

But if I understood correct the not created-cleanmarkers-by-bootloader
problem is "solved" on second boot? I see this here also, the 1st mount
takes ages, the following are fast.

Regards, sorry, Konstantin

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
