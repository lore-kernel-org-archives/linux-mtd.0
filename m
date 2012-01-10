Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkfnc-0000Vh-PZ
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 17:47:54 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
 <1326143297.4463.5.camel@koala>
Date: Tue, 10 Jan 2012 18:47:40 +0100
In-Reply-To: <1326143297.4463.5.camel@koala> (Artem Bityutskiy's message of
 "Mon, 09 Jan 2012 23:08:16 +0200")
Message-ID: <87ipkj8n5v.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Tue, 2012-01-03 at 16:05 -0800, Mike Dunn wrote:
>> This patch adds a driver for the M-Sys / Sandisk diskonchip G4 nand flash found
>> in various smartphones and PDAs, among them the Palm Treo680, HTC Prophet and
>> Wizard, Toshiba Portege G900, Asus P526, and O2 XDA Zinc.  It was tested on the
>> Treo 680, but should work generically.
>> 
>> Since v3, this patch adds power management functions, a scan of the factory bad
>> block table during initialization, several fixes, and more extensive testing.
>> Also, the platform data header file, which only contained partitioning
>> information, was removed.  Command-line partitioning can be used, at least until
>> an mtd parser is written for the saftl format with which these chips are
>> shipped.
>> 
>> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
>
> Hopefully this gets some review, Reobert, may be? You have been in the
> same boat lately (delays because of lack of review).
Yes, I will review.
Somewhere during this week, Sunday if my work overwhelms me.

Cheers.

-- 
Robert
