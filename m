Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N885R-0005sj-Fs
	for linux-mtd@lists.infradead.org; Wed, 11 Nov 2009 07:57:58 +0000
Subject: Re: [PATCH] UBI: Ensure index is positive
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4AF0893E.8040101@gmail.com>
References: <4AF0893E.8040101@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Nov 2009 09:57:37 +0200
Message-Id: <1257926257.21596.874.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-03 at 20:49 +0100, Roel Kluin wrote:
> The index is signed, make sure it is not negative
> when we read the array element.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>

This is not UBI, this is mtd. I've amended the subject and pushed this
patch to my l2-mtd-2.6, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
