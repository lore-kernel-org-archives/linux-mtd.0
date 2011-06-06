Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTYz6-0003nl-1Q
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 12:32:44 +0000
Received: by fxm14 with SMTP id 14so3493933fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 05:32:42 -0700 (PDT)
Subject: Re: [PATCH 5/5] flash_{lock, unlock}: fix off-by-one error for
	"entire device" length
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307333354-26583-5-git-send-email-vapier@gentoo.org>
References: <1307333354-26583-1-git-send-email-vapier@gentoo.org>
	<1307333354-26583-5-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 15:28:26 +0300
Message-ID: <1307363306.3112.52.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vimal Singh <vimal.newwork@gmail.com>, Vimal Singh <vimalsingh@ti.com>,
	linux-mtd@lists.infradead.org, Steven Miao <realmz6@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 00:09 -0400, Mike Frysinger wrote:
> From: Steven Miao <realmz6@gmail.com>
> 
> This basically reverts commit 43feb39f35a9ee0ed3 which changed the full
> length calculation to be one less than one sector.  I don't understand
> the logic in the commit message where it states that the length should
> be one sector smaller as this results in misbehavior at runtime.

Pushed as well, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
