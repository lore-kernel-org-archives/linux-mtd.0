Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6gii-0000pe-Jb
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 10:09:17 +0000
Received: by wwb39 with SMTP id 39so4591411wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 03:09:14 -0700 (PDT)
Subject: Re: [PATCH] ubifs: Use empty_iops and empty_fops consistently
From: Artem Bityutskiy <dedekind1@gmail.com>
To: sedat.dilek@gmail.com
In-Reply-To: <BANLkTi=WTWa4yj+ysta8jiHs9r4MX5Gf_g@mail.gmail.com>
References: <1301874939-2630-1-git-send-email-sedat.dilek@gmail.com>
	<1301900656.2760.6.camel@localhost>
	<BANLkTi=WTWa4yj+ysta8jiHs9r4MX5Gf_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 13:06:44 +0300
Message-ID: <1301911604.2760.52.camel@localhost>
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

On Mon, 2011-04-04 at 11:38 +0200, Sedat Dilek wrote:
> Sorry for having flooded your inbox.

That's ok! :-) I think I did not look carefully enough. Your patch is
just an additional clean-up which makes the names to be consistent. I
can pick it, but probably it is better if it goes in with the
'empty_aops' changes? Whatever you prefer.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
