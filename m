Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REdEI-0000Zl-N5
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 08:34:59 +0000
Received: by wwg9 with SMTP id 9so535227wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 01:34:56 -0700 (PDT)
Subject: Re: [PATCH] mtd: mark block device queue as non-rotational
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan McGee <dpmcgee@gmail.com>
Date: Fri, 14 Oct 2011 11:34:26 +0300
In-Reply-To: <1317187302-13380-1-git-send-email-dpmcgee@gmail.com>
References: <1317187302-13380-1-git-send-email-dpmcgee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318581273.12351.64.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
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

On Wed, 2011-09-28 at 00:21 -0500, Dan McGee wrote:
> This is similar to what the nbd driver does, among others.
> 
> Signed-off-by: Dan McGee <dpmcgee@gmail.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
