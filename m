Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zg6z6-0002SQ-D6
 for linux-mtd@lists.infradead.org; Sun, 27 Sep 2015 08:07:01 +0000
Subject: Re: [PATCH] UBIFS: Add freeze support in ubifs
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com
References: <1443321561-20581-1-git-send-email-yangds.fnst@cn.fujitsu.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5607A387.9050703@nod.at>
Date: Sun, 27 Sep 2015 10:06:31 +0200
MIME-Version: 1.0
In-Reply-To: <1443321561-20581-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yang,

Am 27.09.2015 um 04:39 schrieb Dongsheng Yang:
> We need to do nothing in ubifs, as all is already done in vfs.

Please more details. :-)
The current changelog reads like every filesystem should implement
it as nop. Which is obviously not the case.

fs/super.c checks whether ->freeze_fs() is implemented, so
a nop-implementation does not make sense here.

I bet you hit this in fs/ioctl.c:
        /* If filesystem doesn't support freeze feature, return. */
        if (sb->s_op->freeze_fs == NULL && sb->s_op->freeze_super == NULL)
                return -EOPNOTSUPP;

Correct?

And the most important detail is missing, why is UBIFS allowed
to have a nop-implementation?

Thanks,
//richard
