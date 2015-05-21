Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvNWq-0005Pk-Sq
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 10:16:42 +0000
Message-ID: <555DB062.5070701@nod.at>
Date: Thu, 21 May 2015 12:16:02 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>
Subject: Re: [RFC PATCH 4/4] UBI: Fastmap: Do not add vol if it already exists
References: <1432202165-22351-1-git-send-email-shengyong1@huawei.com>
 <1432202165-22351-5-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1432202165-22351-5-git-send-email-shengyong1@huawei.com>
Content-Type: text/plain; charset=iso-8859-15
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

Am 21.05.2015 um 11:56 schrieb Sheng Yong:
> When writing fastmap, there is no guarantee that two same vol ID are
> written to flash by mistake. Although this unlikely happens, we still
> should check it when attaching.

Not sure if I understand the error scenario.
How can this happen?

Did you hit that care or is this theoretical?

Thanks,
//richard
