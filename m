Received: from xproxy.gmail.com ([66.249.82.196])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EI7yT-00032P-16
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 13:02:43 -0400
Received: by xproxy.gmail.com with SMTP id s13so212984wxc
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Sep 2005 10:01:34 -0700 (PDT)
Message-ID: <43319076.7090005@gmail.com>
Date: Wed, 21 Sep 2005 19:55:18 +0300
From: gxkahn <gxkahn@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: NOR flash and map_info - changed
Reply-To: gxkahn@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

1. what is differ between field buswidth (struct map_info) kernel 2.6.9 and
field called `bankwidth' kernel 2.6.13 ?

2. i have 8 bit NOR chip compatable with Intel StrataFlash. The address
access is paged. is any generic routine in MTD for counting address,
except complex mappings?
