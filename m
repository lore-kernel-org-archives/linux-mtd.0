Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbZdX-0002FS-LQ
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 14:51:36 +0000
Message-ID: <4E09EA52.8090006@parrot.com>
Date: Tue, 28 Jun 2011 16:50:58 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: new module ubiblk: block layer on top of UBI
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>	<1308922482-14967-2-git-send-email-david.wagner@free-electrons.com>
	<1309202771.24805.11.camel@koala>
In-Reply-To: <1309202771.24805.11.camel@koala>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"david.wagner@free-electrons.com" <david.wagner@free-electrons.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Artem Bityutskiy a écrit :
> On Fri, 2011-06-24 at 15:34 +0200, david.wagner@free-electrons.com
> wrote:
>> +	/* Stolen from mtd_blkdevs.c */
>> +	/* Create processing thread */
>> +	dev->thread = kthread_run(ubi_ubiblk_thread, dev, "%s%d_%d",
>> +				  "kubiblkd", dev->ubi_num, dev->vol_id);
>> +	if (IS_ERR(dev->thread)) {
>> +		ret = PTR_ERR(dev->thread);
>> +		goto out_thread;
>> +	}
> 
> Why we need a kernel thread? Could you please describe when exactly it
> is needed and why we cannot avoid having it?
Also what are the advantage against gluebi + mtdblock_ro ?
