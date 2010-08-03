Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OgAYf-0002kC-O4
	for linux-mtd@lists.infradead.org; Tue, 03 Aug 2010 06:01:03 +0000
Subject: Re: [PATCH] UBIFS memleak
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4C569186.4080404@parrot.com>
References: <4C569186.4080404@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Aug 2010 09:00:00 +0300
Message-ID: <1280815200.2542.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-02 at 11:36 +0200, Matthieu CASTET wrote:
> In mount_ubifs, in case of ubifs_leb_unmap error, free allocated resources.
> 
> 
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>

Pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
