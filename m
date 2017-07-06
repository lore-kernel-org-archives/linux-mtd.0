Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT0a7-00026g-0u
 for linux-mtd@lists.infradead.org; Thu, 06 Jul 2017 06:48:08 +0000
Message-ID: <1499323662.18035.45.camel@gmail.com>
Subject: Re: ubifs error after power-cut
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, zhouwarcraft@sina.com
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Date: Thu, 06 Jul 2017 09:47:42 +0300
In-Reply-To: <febf67f4-7e1d-3aa8-5003-0b4283a8cb4a@nod.at>
References: <20170704061551.B6D4481000E5@webmail.sinamail.sina.com.cn>
 <febf67f4-7e1d-3aa8-5003-0b4283a8cb4a@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2017-07-04 at 08:56 +0200, Richard Weinberger wrote:
> > what  you think about this problem? Is it a hardware problem?
> 
> It could be a hardware issues, yes. But also a misconfiguration
> of your flash chip.
> Maybe you give your flash not enough time to write data and after a
> power-cut
> already written data corrupts.

Do the MTD tests still work? Makes sense to run them.
