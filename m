Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKUZp-0001df-Lm
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 12:01:13 +0000
Received: by eyh6 with SMTP id 6so472549eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 05:01:07 -0700 (PDT)
Subject: Re: inappropriate ioctl when attaching
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
In-Reply-To: <4DCAB697.90906@free-electrons.com>
References: <4DCAB697.90906@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 14:57:44 +0300
Message-ID: <1305201464.2713.102.camel@localhost>
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

On Wed, 2011-05-11 at 18:17 +0200, David Wagner wrote:
> Hi,
> 
> I put a ubi image on a sheevaplug but got those errors:
> uncorrectable error :
> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
> from PEB 39:512, read 512 bytes

Please, run mtd tests on your device and validate your flash first:
http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
