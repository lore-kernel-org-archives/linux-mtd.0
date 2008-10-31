Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kvp16-0004dn-To
	for linux-mtd@lists.infradead.org; Fri, 31 Oct 2008 08:06:01 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2282306rvf.42
	for <linux-mtd@lists.infradead.org>;
	Fri, 31 Oct 2008 01:05:59 -0700 (PDT)
Message-ID: <8f6e22a70810310105h7710de4ds93c32d3ec5ae2814@mail.gmail.com>
Date: Fri, 31 Oct 2008 16:05:59 +0800
From: "zheng shi" <neversetsun@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [mtd-util][nandwrite] does nandwrite support MLC flash?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
It seems that nandwrite doesn't support writing image with oob area
into MLC flash.
In current design, nandwrite.c use ioctl(.., MEMWRITEOOB, ...) and
pwrite separately to write image with oob area.
But partial-write is forbidden for MLC flash.

I suggest maybe new mtd ioctl command be proposed to make
mtd->write_oob visible for user space tools like nandwrite.

-- 
Regards, neversetsun
