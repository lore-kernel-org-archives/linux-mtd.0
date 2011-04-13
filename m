Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1qb-0003fp-Fw
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:19:14 +0000
Received: by bwz1 with SMTP id 1so847662bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2011 08:19:11 -0700 (PDT)
Subject: Re: [PATCH 00/27] mtd-utils: make integck test independent
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
In-Reply-To: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
References: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Apr 2011 18:16:20 +0300
Message-ID: <1302707780.2768.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-13 at 18:18 +0300, Artem Bityutskiy wrote:
> Hi, here is a patch-set which makes the integck test independent on the
> common code which tests in tests/fs-tests/ directory share. You may be
> wondering why the hack you need this :-) The explanation is rather long.

Note, I realize that some patches are not ideal and contain unrelated
changes, that's because I tried to save time - after all, there are may
be a couple of guys who use integck and care about it.

Also, forgot to mention that there are just random clean-ups and
improvements in the series. For the same time saving reasons I did not
bother to separate them out. Simply because I do not think anyway really
cares and would benefit from this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
