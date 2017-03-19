Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cphcX-0000zZ-2h
 for linux-mtd@lists.infradead.org; Sun, 19 Mar 2017 20:40:12 +0000
Subject: Re: [PATCH 1/3] ubifs: remove filename from debug messages in
 ubifs_readdir
To: Hyunchul Lee <cheol.lee@lge.com>
References: <1489541465-25663-1-git-send-email-cheol.lee@lge.com>
Cc: kernel-team@lge.com, Artem Bityutskiy <dedekind1@gmail.com>,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Hyunchul Lee <hyc.lee@gmail.com>, David Gstir <david@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <69fe9fb0-6df1-bcb4-68d4-5dc81965b073@nod.at>
Date: Sun, 19 Mar 2017 21:39:43 +0100
MIME-Version: 1.0
In-Reply-To: <1489541465-25663-1-git-send-email-cheol.lee@lge.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hyunchul,

Am 15.03.2017 um 02:31 schrieb Hyunchul Lee:
> if filename is encrypted, filename could have no printable characters.
> so remove it.

thanks for cleaning this up!
All three patches look good to me.

Thanks,
//richard
