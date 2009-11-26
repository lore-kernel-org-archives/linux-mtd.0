Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDaqf-00088Z-IW
	for linux-mtd@lists.infradead.org; Thu, 26 Nov 2009 09:41:18 +0000
Subject: Re: Ubiformat --erase-counter not always used
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910DF852EF3@SJEXCHCCR01.corp.ad.broadcom.com>
References: <200911172245.nAHMjnss001994@imap1.linux-foundation.org>
	<1258989544.18407.48.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910DF852EF3@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Nov 2009 11:41:04 +0200
Message-Id: <1259228464.29118.60.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-11-23 at 10:57 -0800, Darwin Rambo wrote:
> Hello Artem, 
> 
> This is not a bug report, just an observation on ubiformat. It only seems to take the --erase-counter parameter in certain situations. If you have alien data it seems to take it. If the blocks are FF erased or previously formatted correctly it seems to ignore the --erase-counter argument, even though it says it is using it (see below).
> 
> Should we add something in the online help or documentation to explain this better and maybe say in the ubiformat tool itself when the switch is getting used or ignored and why?

Should be fixed in the mtd-utils repository now, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
