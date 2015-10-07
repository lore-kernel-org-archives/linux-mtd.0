Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjvXX-0006M7-Cu
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2015 20:42:20 +0000
Subject: Re: [PATCH 10/27] ubifs: introduce list.h
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com,
 computersforpeace@gmail.com
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439973572-12489-11-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5615838E.5090908@nod.at>
Date: Wed, 7 Oct 2015 22:41:50 +0200
MIME-Version: 1.0
In-Reply-To: <1439973572-12489-11-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Am 19.08.2015 um 10:39 schrieb Dongsheng Yang:
> Copy the list.h from kernel to ubifs-utils/
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  ubifs-utils/include/list.h | 484 +++++++++++++++++++++++++++++++++++++++++++++

This belongs to common mtd-utils code as it is not UBIFS specific.
And why didn't you copy the whole list.h file? I'm missing
list_last_entry() for example.

Thanks,
//richard
