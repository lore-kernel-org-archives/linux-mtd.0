Received: from t111.niisi.ras.ru ([193.232.173.111] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ITha-00069n-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2001 12:23:15 +0100
Message-ID: <3B4610D7.8040501@niisi.msk.ru>
Date: Fri, 06 Jul 2001 15:26:15 -0400
From: Alexandr Andreev <andreev@niisi.msk.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: FTL and Endianity
References: <3B460280.9060805@niisi.msk.ru> <31888.994415407@redhat.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse wrote:

>
>I didn't test - I think others did though. FTL is defined to be 
>little-endian. Why do you say the macros are unusable?
>
As i can see, cpu_to_le32 and others macros, are usable only when FTL
reading the FTL header. But when the ftl_fromat utility creates an ftl
partition, it doesn't swap any field of the header.
So, it doesn't matter on which endianity the FTL driver and ftl_format
works, it must be the same only.
Am i wrong?
