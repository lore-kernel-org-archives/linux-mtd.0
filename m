Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEPMa-0003AS-KJ
 for linux-mtd@lists.infradead.org; Sat, 27 May 2017 00:13:50 +0000
Received: by mail-pf0-x230.google.com with SMTP id n23so23827395pfb.2
 for <linux-mtd@lists.infradead.org>; Fri, 26 May 2017 17:13:27 -0700 (PDT)
Date: Fri, 26 May 2017 17:13:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Martin Habets <mhabets@solarflare.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtdcore: Infrastructure for the device release API
Message-ID: <20170527001323.GF114788@google.com>
References: <20170518092248.23934.15034.stgit@mh-desktop.uk.solarflarecom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170518092248.23934.15034.stgit@mh-desktop.uk.solarflarecom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 18, 2017 at 10:23:11AM +0100, Martin Habets wrote:
> This API adds a cleanup callback for the user of an MTD device.
> Normally they will have allocated the mtd_info structure, and using
> this callback they can free that memory when the last reference is
> dropped.

Can you provide an example user? This callback is meaningless (and won't
be merged) if it has no users.

> CONFIG_DEBUG_KOBJECT_RELEASE can be used to detect users that free
> the memory too early.

Are there any such users?

> The information contained in this message is confidential and is
> intended for the addressee(s) only. If you have received this message
> in error, please notify the sender immediately and delete the message.
> Unless you are an addressee (or authorized to receive for an
> addressee), you may not use, copy or disclose to anyone this message
> or any information contained in this message. The unauthorized use,
> disclosure, copying or alteration of this message is strictly
> prohibited.

Nice.

Brian
