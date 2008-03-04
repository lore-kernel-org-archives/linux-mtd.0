Received: from el-out-1112.google.com ([209.85.162.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWU3o-00039f-C4
	for linux-mtd@lists.infradead.org; Tue, 04 Mar 2008 10:07:51 +0000
Received: by el-out-1112.google.com with SMTP id o28so902746ele.3
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 Mar 2008 02:07:47 -0800 (PST)
Message-ID: <bae050c10803040207odbaebe5vd85b619b370a16cd@mail.gmail.com>
Date: Tue, 4 Mar 2008 18:07:46 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] [UBI] add block device layer on top of UBI
In-Reply-To: <1204624414.23706.26.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10803030317j49cfce3ds7a6af593d16d3736@mail.gmail.com>
	<bae050c10803040140q2d4801d5m4271cadcaa55579@mail.gmail.com>
	<1204623622.23706.22.camel@sauron>
	<bae050c10803040154t2f635dfewe1221c18255f7bda@mail.gmail.com>
	<1204624414.23706.26.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I do not mean the block translation layer is unneeded. It is ok and cool
> to create it. I mean we do not need any generic layer where you can
> register "block translation drivers", like mtd_blktrans.

Sounds like you need a special layer to create. In fact, I don't quite
understand what is that. Are you creating it now ?  Would you mind I
take apart in?

It's time to go home. See you later!

--
Best wishes,
Nancy
