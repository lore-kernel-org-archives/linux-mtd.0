Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xwujd-0005pV-M6
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 15:23:58 +0000
Message-ID: <5481CDF4.3060706@nod.at>
Date: Fri, 05 Dec 2014 16:23:32 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 4/4] UBI: Fastmap: Optimize anchor PEB search
References: <1417350157-9373-1-git-send-email-richard@nod.at>
 <1417350157-9373-5-git-send-email-richard@nod.at>
In-Reply-To: <1417350157-9373-5-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.11.2014 um 13:22 schrieb Richard Weinberger:
> The UBI RB trees are sorted by the PEB number, hence
> we don't have to traverse the whole tree because ubi_rb_for_each_entry()
> walks the tree in sort order.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Please ignore this patch. It is horrible wrong.

*facepalm*,
//richard
