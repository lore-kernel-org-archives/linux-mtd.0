Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QC7nk-0003zC-44
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 10:04:56 +0000
Received: by wyb28 with SMTP id 28so5942286wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Apr 2011 03:04:54 -0700 (PDT)
Subject: Re: [PATCH] ubifs: Use empty_iops and empty_fops consistently
From: Artem Bityutskiy <dedekind1@gmail.com>
To: sedat.dilek@gmail.com
In-Reply-To: <BANLkTinysw90tiWhFRmQH_0LWx7o+sD1-A@mail.gmail.com>
References: <1301874939-2630-1-git-send-email-sedat.dilek@gmail.com>
	<1301900656.2760.6.camel@localhost>
	<BANLkTi=WTWa4yj+ysta8jiHs9r4MX5Gf_g@mail.gmail.com>
	<1301911604.2760.52.camel@localhost>
	<BANLkTi=DHTjL7M9bzYY-t5MJS2s1WScBCQ@mail.gmail.com>
	<BANLkTinysw90tiWhFRmQH_0LWx7o+sD1-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Apr 2011 13:02:00 +0300
Message-ID: <1303207320.2779.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jens Axboe <jaxboe@fusionio.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-19 at 11:50 +0200, Sedat Dilek wrote:
> can you take this patch into your UBIFS tree?
> Thanks in advance.

Sorry, forgot about this patch. Pushed to ubifs-2.6.git tree, but I
re-wrote the commit message because I found yours a bit confusing. Is
this OK?

http://git.infradead.org/ubifs-2.6.git/commit/8c355ad269c9da635fad8367e9a6d52bf3fe08c8

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
