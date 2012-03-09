Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5w9K-00016B-Ji
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 09:30:11 +0000
Message-ID: <1331285548.22872.39.camel@sauron.fi.intel.com>
Subject: Re: Error when mounting ubi image
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Patrick <kpa_info@yahoo.fr>
Date: Fri, 09 Mar 2012 11:32:28 +0200
In-Reply-To: <4F4B9F2D.80709@yahoo.fr>
References: <4F4B6673.7030509@yahoo.fr> <4F4B9F2D.80709@yahoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
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

On Mon, 2012-02-27 at 16:20 +0100, Patrick wrote:
> UBI: data offset:                2048
> UBI error: ubi_io_read: error -74 (ECC error) while reading 64 bytes 
> from PEB 605:0, read 64 bytes
> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes 
> from PEB 605:512, read 512 bytes

I think your MTD driver is buggy - it fails to do sub-page I/O but
reports that it supports sub-pages. Either fix sub-pages support or do
not use them. You can find a lot if info about sub-pages in the MTD web
site. Also, it is a good idea to run the MTD tests, just like it is
suggested here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy
