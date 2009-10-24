Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N1kET-0004hQ-B5
	for linux-mtd@lists.infradead.org; Sat, 24 Oct 2009 17:16:53 +0000
Subject: Re: [PATCH] Fix crosscompilation for mkfs.ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthias Fuchs <matthias.fuchs@esd.eu>
In-Reply-To: <200910231805.04917.matthias.fuchs@esd.eu>
References: <200910231805.04917.matthias.fuchs@esd.eu>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 24 Oct 2009 20:16:38 +0300
Message-Id: <1256404598.29885.359.camel@localhost>
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

On Fri, 2009-10-23 at 18:05 +0200, Matthias Fuchs wrote:
> This patch adds support for passing the location of the lzo
> library and headers.
> 
> Also BUILDDIR must be referenced to find the libubi.a archive.
> 
> Signed-off-by: Matthias Fuchs <matthias.fuchs@esd.eu>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
