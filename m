Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkxpz-0001mH-Pk
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 15:12:36 +0000
Received: by mail-wg0-f41.google.com with SMTP id y10so1284478wgg.0
 for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2013 07:12:10 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] Make the mtdblock read/write skip the bad nand sector
References: <528EB1E3.7030101@innofidei.com> <20131122015237.GB3509@localhost>
 <528EBD0B.5010006@innofidei.com> <20131122114509.GB2414@localhost>
 <5292A7E7.5060003@innofidei.com> <20131125101147.GA2408@localhost>
 <CACQ1gAi26WeiopptcZmBp6h0a5TacLo5mvVCOm6-H_1HtnwvXg@mail.gmail.com>
 <529334D9.2030204@innofidei.com> <20131125115238.GC2408@localhost>
 <1385381770.24518.18.camel@shinybook.infradead.org>
 <20131125123012.GE2408@localhost>
Date: Mon, 25 Nov 2013 16:12:06 +0100
In-Reply-To: <20131125123012.GE2408@localhost> (Ezequiel Garcia's message of
 "Mon, 25 Nov 2013 09:30:13 -0300")
Message-ID: <87fvqkldmh.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Richard Genoud <richard.genoud@gmail.com>, zhouguangming@innofidei.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Hans Zhang <zhanghonghui@innofidei.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel.garcia@free-electrons.com> writes:

Hi,

 > Thanks a lot for the insight. After reading this, I'm wondering what's
 > preventing us from killing MTD block support altogether. Artem, already
 > suggested it a while back...

People using squashfs/cramfs/readonly ext2/.. on a NOR flash?

-- 
Bye, Peter Korsgaard
