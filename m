Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NeozG-0001Gr-RP
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 12:14:43 +0000
Subject: Re: [patch for 2.6.33? 1/1] mtd/nand: fix build failure caused by typo
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <201002022212.o12MC2HT017477@imap1.linux-foundation.org>
References: <201002022212.o12MC2HT017477@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Feb 2010 14:13:09 +0200
Message-ID: <1265717589.2006.147.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hsweeten@visionengravers.com, peterhuewe@gmx.de, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-02-02 at 14:12 -0800, akpm@linux-foundation.org wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
> 
> Fix a build failure introduced by the patch
> 
>     mtd: orion_nand.c: add error handling and use resource_size()
> 
> The patch assigns something to a undeclared variable 'err', whereas the
> rest of the code uses 'ret' for this task.

Andrew,

I think you should send this fix to Linus, since this is a build fix.
dwmw2 seem to bu unavailable now.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
