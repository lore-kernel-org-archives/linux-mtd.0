Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTqH5-00039Y-Tb
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 07:00:28 +0000
Received: by wwb39 with SMTP id 39so3591346wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 00:00:25 -0700 (PDT)
Subject: Re: [PATCH 4/6] libmtd: add helper funcs for getting fds,
	regioninfo, and locked info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307429436.11104.43.camel@localhost>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-4-git-send-email-vapier@gentoo.org>
	<1307429436.11104.43.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 09:56:09 +0300
Message-ID: <1307429769.11104.47.camel@localhost>
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

On Tue, 2011-06-07 at 09:50 +0300, Artem Bityutskiy wrote:
> We indeed have -m option in mtdutils which opens a device by its number.
> But I think it was a mistake. Generally, MTD devices can have any name,
> it is up to udev configuration. So I'd rather deprecate and would
> require a list of device node names.

Sorry, I was not clear. I wanted to say that supports -m and does
hard-code the mtd device name. But this was a mistake because it gives a
bad example, and adding more hard-coded names is bad.

So I think this option can be deprecated and removed, and we should only
accept full device node names.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
