Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZufgZ-0001D9-QH
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 12:00:05 +0000
Message-ID: <1446811178.20949.111.camel@gmail.com>
Subject: Re: [PATCH 3/5] UBI: Expose the bitrot interface
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co
Date: Fri, 06 Nov 2015 13:59:38 +0200
In-Reply-To: <1446764217-15021-4-git-send-email-richard@nod.at>
References: <1446764217-15021-1-git-send-email-richard@nod.at>
 <1446764217-15021-4-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-11-05 at 23:56 +0100, Richard Weinberger wrote:
> +#define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
> +#define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)

Could you please, add short comments telling what are these ioctls
about.
