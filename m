Received: from yw-out-1718.google.com ([74.125.46.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MCBfu-0003BV-7U
	for linux-mtd@lists.infradead.org; Thu, 04 Jun 2009 12:04:09 +0000
Received: by yw-out-1718.google.com with SMTP id 9so402726ywk.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Jun 2009 05:04:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <9bde694e0906020308r60e7627akcc01ed54bf63914c@mail.gmail.com>
References: <9bde694e0906020308r60e7627akcc01ed54bf63914c@mail.gmail.com>
Date: Thu, 4 Jun 2009 17:34:00 +0530
Message-ID: <9bde694e0906040504l4742b818p8fd3223dda719f31@mail.gmail.com>
Subject: UBIFS porting on onenand and on kernel 2.6.18
From: naveen yadav <yad.naveen@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Hi all,

i want to port UBIFS to my target board which is running on Linux

2.6.18. and having samsung onenand.I want to check the performance of
UBIFS. I need some idea.

shall i take UBI and UBIFS code from latest kernel source tree i.e
2.6.29. or shall i use GIT backward patch 2.6.24
so which way is easy and best.

Regards
Naveen
