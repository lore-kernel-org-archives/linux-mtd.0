Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf769-0004tR-1U
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 08:39:33 +0000
Received: by fxm19 with SMTP id 19so6919760fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 00:39:25 -0800 (PST)
Subject: Re: [PATCH] New tuneubifs command to adjust tunable filesystem
	parameters on ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: stefani@seibold.net
In-Reply-To: <1295339326-1720-1-git-send-email-stefani@seibold.net>
References: <1295339326-1720-1-git-send-email-stefani@seibold.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 10:39:20 +0200
Message-ID: <1295339960.2470.70.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Artem.Bityutskiy@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-01-18 at 09:28 +0100, stefani@seibold.net wrote:
> From: Stefani Seibold <stefani@seibold.net>
> 
> ChangeLog:
> 31.12.2010 first proposal
> 18.01.2011 fixes suggested by Artem:
>            - fix help message
> 	   - rename the tool into tuneubifs
> 	   - rename mkfs.ubifs" directory into "ubifs-utils"
> 	   - move the tool to ubifs-utils/tuneubifs
> 	   - code cleanup
> 
> tuneubifs allows the system administrator to adjust various tunable filesystem
> parameters on Linux ubifs filesystems. The current values of these parameters
> can be displayed by using the -v or calling without any option.
> 
> Currently the tuneubifs supports the following parameters:
> 
> -x, --compr=<none|lzo|zlib>    compression type
> -R, --reserved=SIZE            how much space should be reserved for super-user
> 
> Maybe it will be nice to adjust also the uid and gid of the reserved owner,
> or the increase the max. size of the ubi filesystem. This will be very
> simple to implement.
> 
> Signed-off-by: Stefani Seibold <stefani@seibold.net>

Stefani, I'm sorry for bothering you with small things, but it is really
bead idea to combine the re-naming and the new utility in one patch.
These are really 2 separate steps: 1 - prepare things by re-naming, 2 -
add new utility.

Please, make it 2 separate patches, not one patch.

Also, it is very helpful when people add v2 v3 etc to the subject. This
is just another "friendly hacker's practice".

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
