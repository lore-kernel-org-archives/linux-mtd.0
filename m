Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MiP37-0003sd-Oh
	for linux-mtd@lists.infradead.org; Tue, 01 Sep 2009 08:49:14 +0000
Message-ID: <4A9CDFE0.4080306@gmail.com>
Date: Tue, 01 Sep 2009 11:48:32 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: massimo cirillo <maxcir@gmail.com>
Subject: Re: [PATCH] [MTD] JFFS2: Missing verify buffer
	allocation/deallocation.
References: <62cbdcd90908270144v2e52e3ceg36c31abad3fced61@mail.gmail.com>
In-Reply-To: <62cbdcd90908270144v2e52e3ceg36c31abad3fced61@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/27/2009 11:44 AM, massimo cirillo wrote:
> From: Massimo Cirillo<maxcir@gmail.com>
>
> The function jffs2_nor_wbuf_flash_setup() doesn't allocate the verify buffer
> if CONFIG_JFFS2_FS_WBUF_VERIFY is defined, so causing a kernel panic when
> that macro is enabled and the verify function is called. Similarly the
> jffs2_nor_wbuf_flash_cleanup() must free the buffer if
> CONFIG_JFFS2_FS_WBUF_VERIFY is enabled.
> The following patch fixes the problem.
> The following patch applies to 2.6.30 kernel.

Applied to l2-mtd-2.6.git. But please, do not send line-wrapped
patches.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
