Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bnPGy-0001Lw-9q
 for linux-mtd@lists.infradead.org; Fri, 23 Sep 2016 12:08:09 +0000
Subject: Re: [PATCH] ubifs: fix host xattr_len when changing xattr
To: Pascal Eberhard <pascal.eberhard@gmail.com>
References: <1474495050-13529-1-git-send-email-pascal.eberhard@gmail.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <a3d81d8e-869f-7aea-154a-2b8e80c01bba@nod.at>
Date: Fri, 23 Sep 2016 14:06:52 +0200
MIME-Version: 1.0
In-Reply-To: <1474495050-13529-1-git-send-email-pascal.eberhard@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pascal,

On 21.09.2016 23:57, Pascal Eberhard wrote:
> When an extended attribute is changed, xattr_len of host inode is
> recalculated. ui->data_len is updated before computation and result
> is wrong. This patch adds a temporary variable to fix computation.

good catch!

Thanks,
//richard
