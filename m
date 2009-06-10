Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEQJs-0007TH-4E
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 16:06:39 +0000
Subject: Re: [PATCH 1/3] [MTD-UTILS] Unified reading from standard input
	and from file
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jehan Bing <jehan@orb.com>
In-Reply-To: <1244649814.5847.404.camel@localhost.localdomain>
References: <h0k3il$ij6$1@ger.gmane.org>
	<1244551983.5847.388.camel@localhost.localdomain>
	<4A2E98BD.30704@orb.com> <h0mppp$7v2$1@ger.gmane.org>
	<1244649814.5847.404.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Jun 2009 19:05:43 +0300
Message-Id: <1244649943.5847.405.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-06-10 at 19:03 +0300, Artem Bityutskiy wrote:
> Err, is it normal C do do stuff like
> {
> 	readlen = meminfo.writesize;
> 	int tinycnt += cnt;

Sorry, I meant
{
	readlen = meminfo.writesize;
	int tinycnt = 0;

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
