Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKiqs-0003nN-5E
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 08:06:07 +0000
Subject: Re: [PATCH] ubifs: make ubifs_[get|set]xattr atomic
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com
References: <1438234650-21289-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55B9DAD2.4060803@nod.at>
Date: Thu, 30 Jul 2015 10:05:38 +0200
MIME-Version: 1.0
In-Reply-To: <1438234650-21289-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Am 30.07.2015 um 07:37 schrieb Dongsheng Yang:
> This commit make the ubifs_[get|set]xattr protected by ui_mutex,
> making xfstests/generic/037 passed.

Making a test pass is not a good patch description.
Please describe what needs protection and why. :-)

Thanks,
//richard
