Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk9u6-0001Wu-7D
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 10:58:03 +0000
Message-ID: <54536B22.4000807@nod.at>
Date: Fri, 31 Oct 2014 11:57:38 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>
Subject: Re: [PATCH] UBI: vtbl: Use ubi_eba_atomic_leb_change()
References: <1414259021-5691-1-git-send-email-richard@nod.at>
 <1414659349.23185.27.camel@sauron.fi.intel.com> <54530A29.9070208@huawei.com>
 <545343CA.7080507@nod.at> <54536834.1020005@huawei.com>
In-Reply-To: <54536834.1020005@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 31.10.2014 um 11:45 schrieb hujianyang:
> This question is basing on your comment for this patch:
> 
> """
> we can guarantee that the first VTBL record is always
> correct and we don't really need the second one anymore.
> """
> 
> I think that means one PEB is enough in your considering.
> So I want to know if you are sure about this. Because
> we use two leb for master_node in ubifs-level. So maybe
> VTBL is like super_node, not master_node, right?

Yes, technically one PEB is enough if atomic leb change is used.
But existing UBI implementations want a second one
and a backup VTBL PEB is good for robustness.
i.e. if the PEB turns bad we have a backup and do not lose
all volume meta information.

Thanks,
//richard
