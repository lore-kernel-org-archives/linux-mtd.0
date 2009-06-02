Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBTLx-0002TA-Q3
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 12:44:39 +0000
Subject: Re: UBIFS ubimkvol issue and some others...
From: Artem Bityutskiy <dedekind@infradead.org>
To: Stanislav Popov <s.popov@rsc.bg>
In-Reply-To: <4A1E8740.9050208@rsc.bg>
References: <4A1E8740.9050208@rsc.bg>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Jun 2009 15:44:05 +0300
Message-Id: <1243946645.5847.29.camel@localhost.localdomain>
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

On Thu, 2009-05-28 at 15:44 +0300, Stanislav Popov wrote:
> I have problems with some of the coomands:
> ------------------------------------------------------
> # /mtdinfo
> Count of MTD devices:           6
> Present MTD devices:
> mtdinfo: error!: libmtd failed get MTD device 0 information
>          error 2 (No such file or directory)
> ------------------------------------------------------
> The following is one of the main issues:
> # /ubiformat /dev//mtd5
> ubiformat: error!: cannot get information about "/dev//mtd5"
>            error 2 (No such file or directory)
> ------------------------------------------------------

This issue has to be solved in the current mtd-utils, I've just
pushed a fix. Please, verify it.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
