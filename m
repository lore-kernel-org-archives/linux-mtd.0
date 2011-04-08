Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8Boi-0000JP-Nu
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 13:33:41 +0000
Received: by eyh6 with SMTP id 6so1184952eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 06:33:38 -0700 (PDT)
Subject: Re: [PATCH] flashcp: improve speed & some clean ups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
In-Reply-To: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1302188641-30514-1-git-send-email-fransmeulenbroeks@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Apr 2011 16:30:50 +0300
Message-ID: <1302269450.2834.20.camel@localhost>
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

On Thu, 2011-04-07 at 17:04 +0200, Frans Meulenbroeks wrote:
> the speed of the program is improved by:
> - checking if a block needs to be erased before actually erasing it
> - only writing blocks that are not modified
> 
> In order to implement this, the main loop of the program has
> been reworked. I have tried to stay in the style of the
> original author
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Frans,

any work to improve mtd-utils is appreciated. But the changes should be
sent by small reviewable pieces. I know the feeling when you can't
resist the temptation to re-write whole piece of crap, but we should not
do this.

Please, send separate small patches which do one thing at a time. Do not
hesitate to do even small or massive clean-ups, as long as they are done
in one-type-per-patch. Feel free to change functionality, as long as you
split your work on several nice patches, which can be easily reviewed.
Normal way is to do preparation patches, and then functionality changes.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
