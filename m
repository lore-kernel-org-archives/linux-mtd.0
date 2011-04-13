Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9vUQ-0000Ic-0L
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 08:31:54 +0000
Received: by fxm14 with SMTP id 14so381452fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2011 01:31:51 -0700 (PDT)
Subject: Re: [PATCH v2] Fix gcc-4.5.2 "statement with no effect" warnings
	in UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: maksim.rayskiy@gmail.com
In-Reply-To: <1302683190.2768.11.camel@localhost>
References: <1302646496-32261-1-git-send-email-maksim.rayskiy@gmail.com>
	<1302683190.2768.11.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Apr 2011 11:29:01 +0300
Message-ID: <1302683341.2768.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-13 at 11:26 +0300, Artem Bityutskiy wrote:
> On Tue, 2011-04-12 at 15:14 -0700, maksim.rayskiy@gmail.com wrote:
> > From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
> > 
> > When compiling UBIFS with CONFIG_UBIFS_FS_DEBUG not set,
> > gcc-4.5.2 generates a slew of "warning: statement with no effect"
> > on references to non-void functions defined as 0.
> > To avoid these warnings, replace #defines with dummy inline functions.
> > 
> > Signed-off-by: Maksim Rayskiy <maksim.rayskiy@gmail.com>
> 
> This patch does not compile and does not apply to the current tree. I'll
> need to do a lot of massage as well because I dislike the "tabs as
> dynamic spaces" style which you use, and the whole UBIFS code does not
> use this approach, so I would like to maintain consistency.

Sorry, it does compile with older UBIFS, but not with the current one.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
