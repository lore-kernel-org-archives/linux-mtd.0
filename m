Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CcL0u-00068v-Ar
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 04:55:09 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: zhang jingxin <zhangjingxin@sict.ac.cn>
In-Reply-To: <1102555735.2526.40.camel@z21921>
References: <1102555735.2526.40.camel@z21921>
Content-Type: text/plain
Date: Thu, 09 Dec 2004 10:55:02 +0100
Message-Id: <1102586103.3306.18.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: list <linux-mtd@lists.infradead.org>
Subject: Re: doc2000 problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-12-09 at 09:28 +0800, zhang jingxin wrote:
> flash_eraseall -j /dev/mtd1
> it doesn't recongize the device.
> it return no such device.

Provide the output of

# ls -l /dev/mtd*

tglx
