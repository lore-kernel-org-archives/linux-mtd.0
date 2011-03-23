Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2NPf-0006zW-Nt
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 12:43:48 +0000
Received: by wyb28 with SMTP id 28so8327235wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Mar 2011 05:43:46 -0700 (PDT)
Subject: Re: [PATCH 1/1] ubifs: debugfs operations may return both ERRs and
	NULLs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Phil Carmody <ext-phil.2.carmody@nokia.com>
In-Reply-To: <1300873889-18336-1-git-send-email-ext-phil.2.carmody@nokia.com>
References: <1300873889-18336-1-git-send-email-ext-phil.2.carmody@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Mar 2011 14:41:56 +0200
Message-ID: <1300884116.2735.45.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-03-23 at 11:51 +0200, Phil Carmody wrote:
> I knew I invented IS_ERR_OR_NULL for something, and this was probably
> it. NULL has lost all information about what the error was, and the most
> appropriate error code is ENODEV. However, that's the only error code
> that the debugfs functions can return. So basically, any error = ENODEV.
> 
> Signed-off-by: Phil Carmody <ext-phil.2.carmody@nokia.com>

The debugfs code may change and gain more error codes, so I do not think
it is good idea to treat any error as ENODEV. I think only NULL should
be translated to ENODEV instead.

I'll try to re-work your patch accordingly and push it unless you send a
new one.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
