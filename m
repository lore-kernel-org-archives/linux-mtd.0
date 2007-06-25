Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I2n5X-0003ng-5Z
	for linux-mtd@lists.infradead.org; Mon, 25 Jun 2007 07:50:37 -0400
Received: by ug-out-1314.google.com with SMTP id t39so1254514ugd
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Jun 2007 04:50:33 -0700 (PDT)
Message-ID: <4dde4acb0706250450s24525303ibdc73c40e19ecbbe@mail.gmail.com>
Date: Mon, 25 Jun 2007 17:20:33 +0530
From: "Midhun Agnihotram" <agnimidhun@gmail.com>
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: /proc/mtd file does not show partitions
In-Reply-To: <4dde4acb0706250235g121e3e8ch8bd457d4fd604907@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4dde4acb0706192320n7ca4157q1219adfb68e50ce1@mail.gmail.com>
	<46791199.7020402@cetrtapot.si>
	<4dde4acb0706202201y7369cc33kc438f15f7091c18c@mail.gmail.com>
	<467A3861.2050801@cetrtapot.si>
	<4dde4acb0706242336v5569a147l6a38bb146d417187@mail.gmail.com>
	<4dde4acb0706250235g121e3e8ch8bd457d4fd604907@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> # mkdir midhun
> Write of 68 bytes at 0x000e482c failed. returned -30, retlen 3270162828
> Write of 68 bytes at 0x000e4870 failed. returned -30, retlen 3270162828
> mkdir: cannot create directory 'midhun': Read-only file system
>

   My file system is now writable. The change required was to mark the
.mask_flags = 0 instead of .mask_flags = MTD_WRITEABLE for my
partition.

Midhun.
