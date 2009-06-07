Subject: Re: [PATCH v2.1 10/17] JFFS2: do not manipulate s_dirt directly
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1244273108.3751.1029.camel@macbook.infradead.org>
References: <1244207155-2092-1-git-send-email-dedekind@infradead.org>
	<1244207155-2092-11-git-send-email-dedekind@infradead.org>
	<1244273108.3751.1029.camel@macbook.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 07 Jun 2009 12:21:57 +0300
Message-Id: <1244366517.5847.318.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	linux-mtd@lists.infradead.org, Al Viro <viro@ZenIV.linux.org.uk>,
	linux-fsdevel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-06-06 at 08:25 +0100, David Woodhouse wrote:
> On Fri, 2009-06-05 at 16:05 +0300, Artem Bityutskiy wrote:
> > From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > 
> > ... use new VFS helpers instead.
> > 
> > Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: linux-mtd@lists.infradead.org
> 
> Presumably this is intended for Al's tree rather than mine? I could
> massage it and apply it here, but then someone would just have to
> massage it back when they eventually get merged.
> 
> Acked-by: David Woodhouse <David.Woodhouse@intel.com>

Thanks. Sure, this is for Al, I've just CCed FS maintainers to show them
the change.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
