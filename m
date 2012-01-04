Received: from smtp3.newsguy.com ([74.209.136.66] helo=smtp.newsguy.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiGvK-0003p1-So
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 02:49:56 +0000
Message-ID: <4F03BE34.6020003@newsguy.com>
Date: Tue, 03 Jan 2012 18:49:24 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
 <201201040150.39285.marek.vasut@gmail.com>
In-Reply-To: <201201040150.39285.marek.vasut@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: robert.jarzmik@free.fr, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/03/2012 04:50 PM, Marek Vasut wrote:
>> This patch adds a driver for the M-Sys / Sandisk diskonchip G4 nand flash
>> found in various smartphones and PDAs, among them the Palm Treo680, HTC
>> Prophet and Wizard, Toshiba Portege G900, Asus P526, and O2 XDA Zinc.  It
>> was tested on the Treo 680, but should work generically.
>>
>> Since v3, this patch adds power management functions, a scan of the factory
>> bad block table during initialization, several fixes, and more extensive
>> testing. Also, the platform data header file, which only contained
>> partitioning information, was removed.  Command-line partitioning can be
>> used, at least until an mtd parser is written for the saftl format with
>> which these chips are shipped.
> Hey, please run it through ./scripts/checkpatch.pl, it'll likely reveal a few 
> mistakes. Thanks for the code.
>
> M
>


I did.  0 errors, 0 warnings.

Thanks,
Mike
