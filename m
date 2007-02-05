From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45B0F546.8030406@nokia.com> <45C341FC.50805@nokia.com>
Subject: RE: [RFC PATCH] [MTD] OneNAND: Error message printing and bad
	blockscan	errors
Date: Mon, 5 Feb 2007 16:36:30 +0900
Message-ID: <003c01c748f8$5ded23a0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45C341FC.50805@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> 
> What is the status of this?
> 

I'm not determine how to handle this one.
As your opinion, It is one approach which separate the wait function for
normal and bbt.
Basically, you want to see what is happen when error occurs. however it's
not useless for normal users

Another approaches are adding new ioctl as "ERRORGETSTATS" or sysfs
interface.
The former is more simple and latter needs more works.

Please give your opinions

Thank you,
Kyungmin Park.
