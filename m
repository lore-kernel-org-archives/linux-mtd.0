Received: from mail.sysgo.com ([62.8.134.5])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHcgl-0005Bm-GW
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 03:37:24 -0400
Date: Tue, 20 Sep 2005 09:37:12 +0200 (CEST)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: "David A. Braun" <braunster@gmail.com>
In-Reply-To: <432F0884.2020409@gmail.com>
Message-ID: <Pine.LNX.4.63.0509200934300.10905@mag.sysgo.com>
References: <432C2E6C.6050400@gmail.com>
	<20050919093300.GB21380@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509191622500.3180@mag.sysgo.com>
	<20050919153217.GA26968@wohnheim.fh-wedel.de>
	<432F0884.2020409@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: Command line parsing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 Sep 2005, David A. Braun wrote:

> If the name in master->name doesn't match any of the partitions 
> mentioned on the kernel command line then *pparts->offset is not 
> initialized. The result is that all the partitions start at 0. Also 
> the length of the "SIZE_REMAINING" partition is never initialized. 
> Also the return value is -EINVAL instead of the number of 
> partitions. This results in none of the partitions being pass to the 
> driver. The only partition that appears in /proc/partitions is one 
> for the whole device.

Thanks for digging so deeply in to the code. I suggest it would be 
best if you prepare a patch and send it to the list.

Regards,
Marius

-- 
Marius Groeger <mgroeger@sysgo.com>
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.pikeos.com
