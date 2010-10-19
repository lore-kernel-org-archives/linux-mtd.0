Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P84V5-00009Y-5g
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2010 05:12:39 +0000
Received: by bwz7 with SMTP id 7so1544582bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Oct 2010 22:12:37 -0700 (PDT)
Subject: Re: Expanding UBI fs to maxavailable size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karsten Jeppesen <karsten@jeppesens.com>
In-Reply-To: <4CBCBA9D.4040202@jeppesens.com>
References: <4CBCBA9D.4040202@jeppesens.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Oct 2010 08:12:34 +0300
Message-ID: <1287465154.1911.2.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-10-18 at 23:22 +0200, Karsten Jeppesen wrote:
> Hi there,
> ....I think I found an error :-)
> 
> I have an ARM platform with either 32 or 64MB FLASH, and I want to make 
> an image that I can burn more or less directly (ie: not tar) into the 
> flash regardless if its the 32 or the 64MB edition.
> So I assumed that is what the autoresize flag is about, but maybe I am 
> wrong here.
> I can get ubiformat to burn the image to the flash, but subsequently the 
> filesystem doesn't expand to occupy the max available area.
> What am I doing wrong - and how is it supposed to be achieved? Or is 
> this an error or a missing feature?

What do you see in dmesg from UBI/UBIFS?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
