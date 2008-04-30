Received: from 206-248-137-77.dsl.teksavvy.com ([206.248.137.77]
	helo=mail.isoar.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JrJLn-00080v-CZ
	for linux-mtd@lists.infradead.org; Wed, 30 Apr 2008 20:56:28 +0000
Received: from [10.0.200.99] (vpn02.rossvideo.com [209.5.118.98])
	by mail.isoar.ca (8.14.1/8.13.8) with ESMTP id m3UKtJwL004152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2008 16:55:21 -0400
Message-ID: <4818DCB6.3020004@isoar.ca>
Date: Wed, 30 Apr 2008 16:55:18 -0400
From: "Andrew E. Mileski" <andrewm@isoar.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] nand_wait_ready() timeout scaling
References: <1209583375-11136-1-git-send-email-andrewm@isoar.ca>
	<4818CC89.2010106@isoar.ca>
	<Pine.LNX.4.64.0804301318110.32329@t2.domain.actdsltmp>
In-Reply-To: <Pine.LNX.4.64.0804301318110.32329@t2.domain.actdsltmp>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trent Piepho wrote:
> Andrew E. Mileski wrote:
>> Just realized that 100 Hz systems would have a problem with this patch
>> since (100 * 8) / 1000 = 0.  Guess the simple solution is to make the
>> timeout 10 ms.
> 
> msecs_to_jiffies() is what you want to use.

Thanks.  Guess all similar calculations in nand_base.c file should be 
changed to that too.

-- 
Andrew E. Mileski
