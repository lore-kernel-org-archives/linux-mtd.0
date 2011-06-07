Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTpwM-0002k4-PE
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 06:39:03 +0000
Received: by ewy3 with SMTP id 3so1959567ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 23:38:59 -0700 (PDT)
Subject: Re: [PATCH 1/6] jffs2: make lzo optional at build time
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 09:34:42 +0300
Message-ID: <1307428482.11104.38.camel@localhost>
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

On Tue, 2011-06-07 at 02:19 -0400, Mike Frysinger wrote:
> The external lzo dep can be a pain to deal with when cross-compiling,
> so make it optional for jffs2.  This is useful if people aren't even
> using the functionality, or for quicker development.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

How about mkfs.ubifs - it requires lzo as well. And then mkfs.jffs2
wants libacl which might be the same PITA.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
