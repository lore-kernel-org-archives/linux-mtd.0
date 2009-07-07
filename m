Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOBoT-0007Kc-8G
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 14:38:36 +0000
Subject: Re: ubiattach problem
From: Artem Bityutskiy <dedekind@infradead.org>
To: Oren <oren_s3@VERIFONE.com>
In-Reply-To: <1246975692.2208.7.camel@tlvorens3lnx>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
	<1246962761.1775.7.camel@tlvorens3lnx>
	<1246963327.20721.306.camel@localhost.localdomain>
	<1246968515.2208.4.camel@tlvorens3lnx>
	<1246971115.20721.308.camel@localhost.localdomain>
	<1246972892.2208.5.camel@tlvorens3lnx>
	<1246973292.20721.313.camel@localhost.localdomain>
	<1246975692.2208.7.camel@tlvorens3lnx>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jul 2009 17:38:06 +0300
Message-Id: <1246977486.20721.315.camel@localhost.localdomain>
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

On Tue, 2009-07-07 at 17:08 +0300, Oren wrote:
> I already have these option on.
> 
> #
> # UBI - Unsorted block images
> #
> CONFIG_MTD_UBI=y
> CONFIG_MTD_UBI_WL_THRESHOLD=4096
> CONFIG_MTD_UBI_BEB_RESERVE=1
> # CONFIG_MTD_UBI_GLUEBI is not set
> 
> #
> # UBI debugging options
> #
> CONFIG_MTD_UBI_DEBUG=y
> CONFIG_MTD_UBI_DEBUG_MSG=y
> CONFIG_MTD_UBI_DEBUG_PARANOID=y
> CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y
> CONFIG_MTD_UBI_DEBUG_USERSPACE_IO=y
> # CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS is not set
> # CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES is not set
> # CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES is not set
> 
> #
> # Additional UBI debugging messages
> #
> CONFIG_MTD_UBI_DEBUG_MSG_BLD=y
> CONFIG_MTD_UBI_DEBUG_MSG_EBA=y
> CONFIG_MTD_UBI_DEBUG_MSG_WL=y
> CONFIG_MTD_UBI_DEBUG_MSG_IO=y
> 

Note, I need only CONFIG_MTD_UBI_DEBUG_MSG_BLD messages at this

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
