Received: from mail-ig0-f172.google.com ([209.85.213.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8rja-0008SJ-Ib
 for linux-mtd@lists.infradead.org; Sat, 27 Jun 2015 15:09:35 +0000
Received: by igblr2 with SMTP id lr2so29829567igb.0
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jun 2015 08:09:11 -0700 (PDT)
Received: from [192.168.1.153] (75-161-48-96.albq.qwest.net. [75.161.48.96])
 by mx.google.com with ESMTPSA id 69sm23626226ioz.10.2015.06.27.08.09.09
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Jun 2015 08:09:10 -0700 (PDT)
From: Brian Hill <brian@houston-radar.com>
Message-ID: <558EBC94.1090102@houston-radar.com>
Date: Sat, 27 Jun 2015 09:09:08 -0600
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: ubifs_scan: corrupt empty space
References: <558D6251.1070603@houston-radar.com> <558E6CD5.70201@huawei.com>
In-Reply-To: <558E6CD5.70201@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 6/27/2015 3:28 AM, Sheng Yong wrote:
> On 6/26/2015 10:31 PM, Brian Hill wrote:
>> I thought I might try and answer "what would happen?" myself with the nandsim kernel module, but I find it can't provide bitflips in erased data - they are always simulated as "perfect".
> Nandsim can generate bitflips by setting bitflips=n. Then read will set a random
> bitflip in the read buffer. But this does not always happen. You can read do_bit_flips()
> in drivers/mtd/nand/nandsim.c and you will see that only if (bitflips && prandom_u32() < (1<<22)),
> (but "prandom_u32() < (1 << 22)" seems unlikely happen) bitflip is generated. So if you
> would like to make bitflip likely happen, you could change the condition.
>
> thanks,
> Sheng

Sheng,
Bit flips are never simulated on erased pages, they are always 0xFFs.

static void read_page(struct nandsim *ns, int num)
{
	union ns_mem *mypage;

	if (ns->cfile) {
		if (!test_bit(ns->regs.row, ns->pages_written)) {
			NS_DBG("read_page: page %d not written\n", ns->regs.row);
			memset(ns->buf.byte, 0xFF, num);           <----- perfect 0xFFs
		} else {
			loff_t pos;
			ssize_t tx;

			NS_DBG("read_page: page %d written, reading from %d\n",
				ns->regs.row, ns->regs.column + ns->regs.off);
			if (do_read_error(ns, num))
				return;
			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
			tx = read_file(ns, ns->cfile, ns->buf.byte, num, pos);
			if (tx != num) {
				NS_ERR("read_page: read error for page %d ret %ld\n", ns->regs.row, (long)tx);
				return;
			}
			do_bit_flips(ns, num);        <----- not reached for erased pages
		}
		return;
	}


Thanks,
-Brian Hill
