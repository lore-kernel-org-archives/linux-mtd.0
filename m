Received: from gv-out-0910.google.com ([216.239.58.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWTqq-0007TC-PJ
	for linux-mtd@lists.infradead.org; Tue, 04 Mar 2008 09:54:25 +0000
Received: by gv-out-0910.google.com with SMTP id e6so430749gvc.5
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 Mar 2008 01:54:23 -0800 (PST)
Message-ID: <bae050c10803040154t2f635dfewe1221c18255f7bda@mail.gmail.com>
Date: Tue, 4 Mar 2008 17:54:22 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] [UBI] add block device layer on top of UBI
In-Reply-To: <1204623622.23706.22.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10803030317j49cfce3ds7a6af593d16d3736@mail.gmail.com>
	<bae050c10803040140q2d4801d5m4271cadcaa55579@mail.gmail.com>
	<1204623622.23706.22.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> could you please send patches inline? It is what people normally do
> and it is easier to reply and comment the patches this way.

   OK, next time I will try.

> Also, I do not think we need this common "blktrans" module for UBI at
> all, it just does not seem to make much sense.

   How gonna you do to support VFAT ? In embended system world, this
function is  very important.

--
Best wishes,
Nancy
