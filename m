Received: from mail-bw0-f12.google.com ([209.85.218.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LJqeI-0002VF-6Z
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 14:41:46 +0000
Received: by bwz5 with SMTP id 5so16371301bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jan 2009 06:41:45 -0800 (PST)
Message-ID: <71cd59b00901050639p25f2572au392c706c3dc5b2a3@mail.gmail.com>
Date: Mon, 5 Jan 2009 15:39:11 +0100
From: "Corentin Chary" <corentin.chary@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH 0/3] Export UBI map/unmap/is_mapped in userspace
In-Reply-To: <1231165452.6608.15.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200901051458.17322.corentin.chary@gmail.com>
	<1231165452.6608.15.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> In your patches I do not see why these ioctl's are enabled only if the
> CONFIG_MTD_UBI_DEBUG_USERSPACE_IO configuration option is switched on.
> It looks like the ioctl's are always enabled.
>
Look the litle "#endif" at the end, it's the one for "#ifdef
CONFIG_MTD_UBI_DEBUG_USERSPACE_IO" used for UBI_IOCEBER

We make these using CONFIG_MTD_UBI_DEBUG_USERSPACE_IO only because
direct write and erase use that too.
But if you make it non-debugging, it'll be easier for us.

-- 
Corentin Chary
http://xf.iksaif.net
