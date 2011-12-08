Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYljj-00068V-Rl
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2011 21:42:40 +0000
Received: by laam7 with SMTP id m7so544350laa.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2011 13:42:36 -0800 (PST)
Subject: Re: UBIFS Corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Reginald Perrin <reggyperrin@yahoo.com>
Date: Thu, 08 Dec 2011 23:42:32 +0200
In-Reply-To: <1323278383.39855.YahooMailNeo@web114617.mail.gq1.yahoo.com>
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
 <1310988807.20738.44.camel@sauron>
 <1311707851.83484.YahooMailRC@web114602.mail.gq1.yahoo.com>
 <1313411391.2583.22.camel@sauron>
 <1322510657.7380.YahooMailNeo@web114602.mail.gq1.yahoo.com>
 <1323278383.39855.YahooMailNeo@web114617.mail.gq1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323380555.2074.3.camel@koala>
Mime-Version: 1.0
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2011-12-07 at 09:19 -0800, Reginald Perrin wrote:
> Booting shows:
> [    4.860000] UBI: background thread "ubi_bgt1d" started, PID 355
> UBI device number 1, total 749 LEBs (96638976 bytes, 92.2 MiB), available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)
> [    5.004000] UBIFS: recovery needed
> [    5.580000] UBIFS error (pid 357): ubifs_recover_leb: garbage
> [    5.584000] UBIFS error (pid 357): ubifs_scanned_corruption: corruption at LEB 498:81920
> [    5.588000] UBIFS error (pid 357): ubifs_scanned_corruption: first 8192 bytes from LEB 498:81920
> [    5.616000] UBIFS error (pid 357): ubifs_recover_leb: LEB 498 scanning failed

Sorry, but I believe I sent you the solution - make the logbuffer larger
and add the ignore debuglevel option. Citing myself:

"log_buf_len=64M

Also add

ignore_loglevel"

IOW, add "log_buf_len=64M ignore_loglevel" options to you kernel boot
options.

Artem.

What is your flash exactly?

Artem.
