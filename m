Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jocf5-000792-VS
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 10:57:16 +0000
Received: by wf-out-1314.google.com with SMTP id 29so2010940wff.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 03:57:14 -0700 (PDT)
Message-ID: <bae050c10804230357y2d2f5e8cucb0fdeba6137435c@mail.gmail.com>
Date: Wed, 23 Apr 2008 18:57:14 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: [RFC] slight UBI scan time improvement
In-Reply-To: <bae050c10804230351s699a851bmb950a18b22ae8e54@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1208882552.11721.13.camel@sauron>
	<bae050c10804230015r50b7747apef8b1d8cab302c9a@mail.gmail.com>
	<1208935971.11721.20.camel@sauron>
	<bae050c10804230101m64bc2558icf9a5ad7efb8c824@mail.gmail.com>
	<1208938571.11721.38.camel@sauron>
	<bae050c10804230207s79902591l8a977881d89e48c3@mail.gmail.com>
	<1208942023.11721.48.camel@sauron>
	<bae050c10804230351s699a851bmb950a18b22ae8e54@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does volume size must be aligned to LEB size?
If I pass a unaligned LEB size to ubimkvol -s, then it will
automatically make it aligned or what?

-- 
Best wishes,
Nancy
