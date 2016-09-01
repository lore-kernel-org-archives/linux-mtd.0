Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfO4f-0000OC-GF
 for linux-mtd@lists.infradead.org; Thu, 01 Sep 2016 09:14:20 +0000
Subject: Re: issue with ubi_wl_put_peb
To: Nikhilesh Reddy <reddyn@codeaurora.org>
References: <57BC9C1D.4010402@codeaurora.org>
 <19dc6d1c-30fb-737e-7d7e-da503a25e9f4@nod.at>
 <57C5C835.6080900@codeaurora.org>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <839efbc5-fdfa-a4c9-a3ee-bdfd41511f56@nod.at>
Date: Thu, 1 Sep 2016 11:13:25 +0200
MIME-Version: 1.0
In-Reply-To: <57C5C835.6080900@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nikhilesh Reddy,

On 30.08.2016 19:53, Nikhilesh Reddy wrote:
> Hi
> Actually  FASTMAP was not involved.

So, CONFIG_MTD_UBI_FASTMAP=n?

> This issue is pretty hard to reproduce ... just had reports of one instance where this occured.
> If i see it again i will try to get all the logs.

Always collect logs. :-)
At least the kernel trace/oops.

Thanks,
//richard
