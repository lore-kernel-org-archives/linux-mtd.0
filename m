Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Otcu1-000246-Vg
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2010 08:54:42 +0000
Received: by bwz13 with SMTP id 13so1204541bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Sep 2010 01:54:40 -0700 (PDT)
Subject: Re: =?UTF-8?Q?=E7=AD=94=E5=A4=8D=3A?= Partition size limit of UBIFS?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xing Qianqian <xingqq@21com.com>
In-Reply-To: <00eb01cb4ffb$6b537bd0$41fa7370$@com>
References: <000001cb4f6c$d2f90af0$78eb20d0$@com>
	<1283968283.7370.5.camel@brekeke> <00eb01cb4ffb$6b537bd0$41fa7370$@com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Sep 2010 11:53:12 +0300
Message-ID: <1284022392.2979.75.camel@localhost>
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

On Thu, 2010-09-09 at 16:45 +0800, Xing Qianqian wrote:
> Which version of kernel imported the 64bit support for MTD? I'm using 2.6.28.10.

2.6.28 is ancient. I do not remember the veriosn, try 'git log
drivers/mtd'

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
