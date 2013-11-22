Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjfvP-0003J8-U8
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2013 01:52:52 +0000
Date: Thu, 21 Nov 2013 22:52:38 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Hans Zhang <zhanghonghui@innofidei.com>
Subject: Re: [PATCH] Make the mtdblock read/write skip the bad nand sector
Message-ID: <20131122015237.GB3509@localhost>
References: <1385024065-29965-1-git-send-email-zhanghonghui@innofidei.com>
 <CACQ1gAiLesYEWmHkivAF=t8ekCFM=yDDyzkJTtduavNjp1g6wA@mail.gmail.com>
 <528EB1E3.7030101@innofidei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <528EB1E3.7030101@innofidei.com>
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 zhouguangming@innofidei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 22, 2013 at 09:22:43AM +0800, Hans Zhang wrote:
> On 2013/11/21 18:59, Richard Genoud wrote:
> 
> Here's my scenario, I want to write nand through mtdblock by dd command

You could get some better support by explaining why do you want to write
to a NAND through mtdblock. It sounds a bit ackward to me, but I'm sure
you have a good reason for it!

Let's hear it :-)
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
