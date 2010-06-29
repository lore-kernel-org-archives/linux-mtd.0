Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OTUNQ-0003aX-GR
	for linux-mtd@lists.infradead.org; Tue, 29 Jun 2010 06:33:06 +0000
Subject: Re: [RFC/PATCH] doc2000: Fix uninitialized variable in
	doc_ecc_decode()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark Ware <mware@elphinstone.net>
In-Reply-To: <4BFDCEC3.7070601@elphinstone.net>
References: <4BFDCEC3.7070601@elphinstone.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Jun 2010 09:29:46 +0300
Message-ID: <1277792986.1041.959.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-27 at 11:45 +1000, Mark Ware wrote:
> The variable 'syn' was being used uninitialized.  Also
> fixed incorrect use of syn[] vs s[].
> 
> Tested on powerpc board with 64MB DOC2000.
> ---
> 
> I am porting from a 2.4.18 kernel to 2.6.32, and I saw random media header
> mismatches causing a failure to detect the DOC device partitions.  Tracing
> through, I saw this variable being used uninitialized and I suspect
> incorrectly also.
> 
> I do not really understand how the ecc/syndrome code works, so I do not
> know if this patch is the correct solution, but it did make my problem
> go away...
> 
> CC: Thomas Gleixner as I believe he may have written this function initially.

Please, always add Signed-off-by for kernel patches. I added it for you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
