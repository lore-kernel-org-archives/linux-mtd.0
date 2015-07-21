Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHeKC-00084Z-56
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 20:39:40 +0000
Message-ID: <55AEADF1.2050500@nod.at>
Date: Tue, 21 Jul 2015 22:39:13 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com,
 jack@suse.com
CC: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 12/25] ubifs: introduce quota related mount options
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1437467876-22106-13-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1437467876-22106-13-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Am 21.07.2015 um 10:37 schrieb Dongsheng Yang:
> This commit introduce mount options of quota, noquota,
> usrquota and grpquota. These options are used to make
> ubifs support quota. But with this commit, quota will
> not working on ubifs actually. We just introduce options
> here and will make ubifs support quota later.

Is there a reason why you didn't implement project quotas too?

Thanks,
//richard
