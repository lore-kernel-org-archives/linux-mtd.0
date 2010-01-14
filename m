Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NVZ64-00010n-Fi
	for linux-mtd@lists.infradead.org; Thu, 14 Jan 2010 23:27:29 +0000
Received: by fg-out-1718.google.com with SMTP id 16so12887fgg.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Jan 2010 15:27:22 -0800 (PST)
Subject: Re: RFC: [PATCH V3 0/9 Integration of SmartMedia/xD into mtd subsystem
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
In-Reply-To: <1263324518.6236.18.camel@maxim-laptop>
References: <1263324518.6236.18.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Jan 2010 01:27:17 +0200
Message-ID: <1263511637.4780.4.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-01-12 at 21:28 +0200, Maxim Levitsky wrote: 
> This is third version of my patches.
> 
> Changes since V2:
> 
> * Resolved write speed problem, now write speed is around 1 MB/s
> more that twice the speed of windows driver.
> 
> * Made the FTL less dependent on mtd driver.
> It now uses standard mtd functions for bad block handling.
> Also made initial device scan be safer against damaged media.
> 
> * FTL doesn't depend on common module any more.
> This makes Kconfig much cleaner, and makes it possible to use the FTl
> without enabling the nand support.
> Common module is cleaned up a lot.
> 
> Now, everything works, everything is fast (except maybe initial zone
> scan which takes around 2 seconds...)
> 
> Still bear in mind that FTL can destroy data, especially if your flash
> card is worn out.
> 
> I consider this version to be merge worthy.
> 
> Best regards,
> Maxim Levitsky


Now that everything works fine, what shall I do next to get that merged?

Best regards,
Maxim Levitsky
