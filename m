Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKUaM-0001ei-9j
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 12:01:46 +0000
Received: by ewy3 with SMTP id 3so473211ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 05:01:40 -0700 (PDT)
Subject: Re: ubi_io_read error after ubiattach
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Mauri <fabio.mauri@bticino.it>
In-Reply-To: <20110511083729.GA6803@BT22268.eu.dir.grpleg.com>
References: <20110511083729.GA6803@BT22268.eu.dir.grpleg.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 14:58:18 +0300
Message-ID: <1305201498.2713.103.camel@localhost>
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

On Wed, 2011-05-11 at 10:37 +0200, Fabio Mauri wrote:
> UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 32:512, read 512 bytes
> UBI error: ubi_io_read: error -74 while reading 512 bytes from PEB 2:512, read 512 bytes

Please, run mtd tests on your device and validate your flash:
http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
