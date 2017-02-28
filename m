Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cieqY-0001Wi-Sq
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 10:17:32 +0000
Message-ID: <1488277025.3583.2.camel@gmail.com>
Subject: Re: [PATCH 0/3] ubifs: add lz4hc compression
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Hyunchul Lee <hyc.lee@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Hyunchul Lee <cheol.lee@lge.com>
Date: Tue, 28 Feb 2017 12:17:05 +0200
In-Reply-To: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
References: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
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

On Tue, 2017-02-28 at 14:16 +0900, Hyunchul Lee wrote:
> Another compression type cannot be added any more in respect that
> type of
> ubifs_inode's compr_type is "unsigned:2" and there are 4 compression
> types.  There may be overflow in assignment to compr_type, and
> prevision 
> version of ubifs is trying to decompress file with wrong compression
> type.

But this is just an in-memory inode structure, and you can change it,
just increase the size of 'compr_type'.
