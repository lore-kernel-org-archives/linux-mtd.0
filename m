Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6b60-0004Kf-4n
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2004 20:05:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Eric Hammerle <ehammerle@spectracomcorp.com>
In-Reply-To: <029e01c412a0$daaf5ed0$c4c80a0a@CoOp4>
References: 
	<OF6499D9FD.A5006680-ON85256E62.00682789-85256E62.0068A11B@ca-chq.celestica.com>
	<029e01c412a0$daaf5ed0$c4c80a0a@CoOp4>
Content-Type: text/plain
Message-Id: <1080245072.3643.52.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 25 Mar 2004 20:04:32 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Unable to handle kernel paging request at
	virtualaddress80000013
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-25 at 14:39 -0500, Eric Hammerle wrote:
> 
> I suppose a diff would look something like this:
> 
> - unsigned char name[0];
> + unsigned char name[0] __attribute__ ((align(4)));
> 
> I'm not sure if this is the recommended fix for the alignment issues, but it
> worked for me.

That'll work but at a cost of taking up extra RAM. If you're going to
try that, make sure you also include the latest patch I committed to
v1.98 of file.c. That eliminates another unaligned write.

You might do better to use get_unaligned() in the flash chip driver when
reading from the buffer though.

-- 
dwmw2
