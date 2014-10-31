Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk7Hn-00087s-6d
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 08:10:20 +0000
Message-ID: <545343CA.7080507@nod.at>
Date: Fri, 31 Oct 2014 09:09:46 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>, dedekind1@gmail.com
Subject: Re: [PATCH] UBI: vtbl: Use ubi_eba_atomic_leb_change()
References: <1414259021-5691-1-git-send-email-richard@nod.at>
 <1414659349.23185.27.camel@sauron.fi.intel.com> <54530A29.9070208@huawei.com>
In-Reply-To: <54530A29.9070208@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hujianyang,

Am 31.10.2014 um 05:03 schrieb hujianyang:
> Hi Artem and Richard,
> 
> We are using atomic operation, leb_change(), for master_node
> in ubifs-level. We use two lebs for master_node even if they
> are changed with atomic operation.
> 
> I think volume_table and master_node play similar roles. Do
> you think changing VTBL record into one peb is OK? I just
> what to know if I missed something. Could you please take
> some time to explain that?

I'm not sure if I correctly understand your question.

If we use only one PEB for the VTBL existing UBI implementations
would break as they assume we have two.

Thanks,
//richard
