Subject: [PATCH 0/3] amend sysfs mtd sysfs interface
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Apr 2009 12:28:21 +0300
Message-Id: <1240306101.19218.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Brownell <david-b@pacbell.net>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, this patch series improves MTD sysfs interface.
It adds a couple of new useful files which I'm going
to use in UBI utilites. It also removes the 'flags'
file because I believe it is a bad idea to expose
it to userspace via sysfs, just bad API.

David, if you are fine with these, please, make it
go upstream now, because we have just added sysfs
and it is not too late to amend it.

Thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
