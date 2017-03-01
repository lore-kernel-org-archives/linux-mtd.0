Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cj1c2-0001Sw-SK
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 10:36:07 +0000
Message-ID: <1488364538.3583.6.camel@gmail.com>
Subject: Re: [PATCH 0/3] ubifs: add lz4hc compression
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Hyunchul Lee <cheol.lee@lge.com>, kernel-team@lge.com
Date: Wed, 01 Mar 2017 12:35:38 +0200
In-Reply-To: <20170301011224.GC15972@Hyeoncheol-PC00>
References: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
 <1488277025.3583.2.camel@gmail.com>
 <20170301011224.GC15972@Hyeoncheol-PC00>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2017-03-01 at 10:12 +0900, Hyunchul Lee wrote:
> yes, it is an in-memory inode. but i think that there can be problem
> of 
> backward compatibility. for example, if ubifs_ino_node's compr_type
> is
> 4 in flash, the previous version of ubifs could misinterpret it as 0,
> because ubifs_inode's compr_type(2-bit) is assigned
> ubifs_ino_nodes' compr_type at ubifs_iget.

Good point. I guess changing the in-memory compr_type to something
wider right away would be a good idea, even if no new compressors are
added.
