Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LjaHr-0002KV-Ix
	for linux-mtd@lists.infradead.org; Tue, 17 Mar 2009 14:29:06 +0000
Message-ID: <49BFB351.6020301@nokia.com>
Date: Tue, 17 Mar 2009 16:27:29 +0200
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH v2 06/15] NULL noise: drivers/mtd/tests/mtd_*test.c
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
	<20090305191457.30062.43881.stgit@f10box.hanneseder.net>
	<49B0BE07.5080803@nokia.com>
	<alpine.LNX.2.00.0903171421200.11733@jikos.suse.cz>
In-Reply-To: <alpine.LNX.2.00.0903171421200.11733@jikos.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	Hannes Eder <hannes@hanneseder.net>,
	"trivial@kernel.org" <trivial@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jiri Kosina wrote:
>>>   drivers/mtd/tests/mtd_oobtest.c:673:41: warning: Using plain integer as
>>> NULL pointer
>>>   drivers/mtd/tests/mtd_oobtest.c:701:33: warning: Using plain integer as
>>> NULL pointer
>>>   drivers/mtd/tests/mtd_readtest.c:74:41: warning: Using plain integer as
>>> NULL pointer
>>>
>>> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
>>> Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>> Yes, please, take this patch.
> 
> Doesn't seem to be present in current -next/-mmotim, applied to trivial
> tree.

Fine with me. (CCed linux-mtd).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
