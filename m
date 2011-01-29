Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PjDZv-00047C-Aw
	for linux-mtd@lists.infradead.org; Sat, 29 Jan 2011 16:23:13 +0000
Received: by mail-fx0-f49.google.com with SMTP id 19so4965266fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Jan 2011 08:23:11 -0800 (PST)
Subject: Re: [PATCH] mtd: adapt writebufsize calculation for concat
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Holger Brunck <holger.brunck@keymile.com>
In-Reply-To: <1295887542-22785-1-git-send-email-holger.brunck@keymile.com>
References: <1295887542-22785-1-git-send-email-holger.brunck@keymile.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 29 Jan 2011 18:22:27 +0200
Message-ID: <1296318147.2400.4.camel@localhost>
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

On Mon, 2011-01-24 at 17:45 +0100, Holger Brunck wrote:
> If different chips with different writebufsize are concatenated,
> the writebufsize from the concat device has to be taken from
> the device with the largest writebuffer. This writebufsize
> is used later on in the UBI layer for the min I/O size.
> 
> Signed-off-by: Holger Brunck <holger.brunck@keymile.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
