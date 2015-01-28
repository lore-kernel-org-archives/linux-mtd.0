Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGIe2-0005UG-M6
 for linux-mtd@lists.infradead.org; Wed, 28 Jan 2015 02:46:19 +0000
Message-ID: <54C84CC2.6060708@huawei.com>
Date: Wed, 28 Jan 2015 10:43:14 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <artem.bityutskiy@linux.intel.com>
Subject: Current linux-next status of UBI/UBIFS? Re: new UBI co-maintainer
References: <1421918762.8637.162.camel@sauron.fi.intel.com>
In-Reply-To: <1421918762.8637.162.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, Li Zefan <lizefan@huawei.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Sheng Yong <shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/1/22 17:26, Artem Bityutskiy wrote:
> Hi,
> 
> I'd like to give Richard Weinberger UBI tree push rights, so that he
> could help us improving the QoS.
> 
> If no one objects, lets make it effective.
> 

Hi Artem,

First, thank Richard for his contributions to UBI/UBIFS.


I regret to say the updating of UBI/UBIFS was blocked about 2 months.
So Richard could help us maintaining the improvement of UBIFS next?

I've sent some patches to MTD list these days, what's the opinion of
you and Richard about these pacthes?

   [PATCH] UBI: add ubi_err() to report the failure of leb read
   [PATCH RFC 1/2] UBIFS: fix empty log leb error
   [PATCH] UBI: fix soft lockup in ubi_check_volume()

   and ubidump v6

The patch "UBI: fix soft lockup in ubi_check_volume()" solves a really
important problem, I wish it could be merged into stable soon.

I've discussed with Richard about the recovery of an corrupted UBIFS
image, for example, ECC error. And actually my colleagues and I had
worked out some features to improve the reliability of UBIFS. We are
happy to share our design and greatly aspire the help from community.

Also, I think we could start to add more functions to my ubidump to
make it a useful tool.

I think the updating of UBI/UBIFS will re-start soon, am I right?

BR,
Hu
