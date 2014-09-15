Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTSLC-0006CS-7H
 for linux-mtd@lists.infradead.org; Mon, 15 Sep 2014 09:12:59 +0000
Message-ID: <5416AD82.5070206@nod.at>
Date: Mon, 15 Sep 2014 11:12:34 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: fstests@vger.kernel.org
Subject: Re: [PATCH] Add UBIFS support
References: <1410772280-9771-1-git-send-email-richard@nod.at>
In-Reply-To: <1410772280-9771-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 15.09.2014 11:11, schrieb Richard Weinberger:
> UBIFS needs some extra care, the device node is of type character and
> it has no fsck tool.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  README        |  1 +
>  check         |  2 ++
>  common/config |  4 ++--
>  common/rc     | 18 ++++++++++++++++++
>  4 files changed, 23 insertions(+), 2 deletions(-)

To avoid confusion, this patch is for xfstests. :-)

Thanks,
//richard
