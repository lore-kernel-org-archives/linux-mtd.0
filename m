Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcBXu-0003hV-Rp
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 07:20:19 +0000
Received: by iwn35 with SMTP id 35so2100525iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 00:20:17 -0700 (PDT)
Subject: Re: [PATCH] mtd: OneNAND: samsung: Write DMA support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyungmin Park <kmpark@infradead.org>
Date: Thu, 30 Jun 2011 10:21:09 +0300
In-Reply-To: <BANLkTi=MMEzE-neUzRqBYqvsGsup_s+VMw@mail.gmail.com>
References: <20110608101804.GA5527@july>
	<BANLkTi=MMEzE-neUzRqBYqvsGsup_s+VMw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309418473.23597.143.camel@sauron>
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-29 at 16:22 +0900, Kyungmin Park wrote:
> Hi Artem,
> 
> There's missing patch, can you add l2-mtd tree?
> 
Sorry, I missed this. I have few minor comments which will come shortly,
and also I'd ask to re-send this patch with the arm mailing list in CC -
you use DMA API which I am not very good at, and I'd like others to
validate this.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
