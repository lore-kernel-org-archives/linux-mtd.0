Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh1EV-0002hH-Vh
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 13:43:32 +0000
Subject: Re: [PATCH] mtd-utils: add option to not force largefile support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
In-Reply-To: <1265188726-23746-1-git-send-email-jacmet@sunsite.dk>
References: <1265188726-23746-1-git-send-email-jacmet@sunsite.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 15 Feb 2010 15:42:22 +0200
Message-ID: <1266241342.11659.91.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-02-03 at 10:18 +0100, Peter Korsgaard wrote:
> Not all systems have largefile support (E.G. uClibc depending on config),
> so unconditionally enforcing largefile breaks the build.
> 
> Work around it by adding a WITHOUT_LARGEFILE flag, similar to the existing
> WITHOUT_XATTR.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Pushed to mtd-utils.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
