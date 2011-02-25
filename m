Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsvHq-0002uq-3v
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 10:52:38 +0000
Received: by wyf23 with SMTP id 23so1521985wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 02:52:36 -0800 (PST)
Subject: Re: [PATCH] fs/jffs2/xattr: Fix coding style
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tracey Dent <tdent48227@gmail.com>
In-Reply-To: <20110221093902.GA4759@linux-rdzc.hsd1.mi.comcast.net>
References: <20110221093902.GA4759@linux-rdzc.hsd1.mi.comcast.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 12:51:14 +0200
Message-ID: <1298631074.2798.51.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-02-21 at 04:39 -0500, Tracey Dent wrote:
> Remove the trailing white space and get rid of the
> unnessary {} on certain statements.
> 
> Signed-off-by: Tracey Dent <tdent48227@gmail.com>

Could you please do one change per patch?

Make first patch to only fix the trailing white-space issue. I'd take it
to my tree immediately. You can make the second patch which removes
unnecessary {}, but this patch would be arguable, I'm not sure I'd take
it.

In any case, now I should reject whole patch, but in the "one patch per
logical change" case I'd take at least part of your work.

Thanks a lot!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
