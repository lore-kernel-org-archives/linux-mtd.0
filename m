Received: from rproxy.gmail.com ([64.233.170.200])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DDQbn-0000h5-Oh
	for linux-mtd@lists.infradead.org; Mon, 21 Mar 2005 12:22:32 -0500
Received: by rproxy.gmail.com with SMTP id a41so1059541rng
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Mar 2005 09:22:31 -0800 (PST)
Message-ID: <1ffb4b0705032109224f2c7805@mail.gmail.com>
Date: Tue, 22 Mar 2005 01:22:29 +0800
From: Mike Lee <eemike@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: mtd permission denied
Reply-To: Mike Lee <eemike@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all
  i tried to flash_erase and other flash_* tools to my mtd device, the
return value is permission denied, but i am already root login. I have
selected MTD_CHAR and MTD_BLOCK in kernel.  Do i miss somethings?

    My kernel version is 2.6.10, with cvs mtd patched.

Mike,Lee
