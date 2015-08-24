Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTv5w-000571-CD
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 16:59:40 +0000
Received: by pdbfa8 with SMTP id fa8so55616489pdb.1
 for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2015 09:59:19 -0700 (PDT)
Date: Mon, 24 Aug 2015 09:59:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubi: do not re-read the data already read out in retry
Message-ID: <20150824165916.GG81844@google.com>
References: <1440143981-20826-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55D6ECC4.5070503@nod.at> <55DA6DC8.9010308@cn.fujitsu.com>
 <55DABDBB.4080404@nod.at> <55DAC1E2.2040700@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55DAC1E2.2040700@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 24, 2015 at 03:04:02PM +0800, Dongsheng Yang wrote:
> TBH, my customer send me this requirement and I cooked this patch
> to them.

Ah, so it's highly likely the driver is just terrible! In that case, I'd
suggest a nice NAK, until we find a legitimate use case.

Regards,
Brian
