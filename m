Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIzyn-0001ad-KC
 for linux-mtd@lists.infradead.org; Fri, 01 Jul 2016 15:03:42 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8miBVQklGUzogRmlsZVN5c3RlbSBCYWNrZ3JvdW5k?=
 =?UTF-8?Q?_Thread?=
To: =?UTF-8?B?6L6J5bCR?= <wang502742203@qq.com>
References: <tencent_7C5FA3D5550624063EA45DF9@qq.com>
 <CAFLxGvzhnqB2peyJh4fcvCV8v7_3tTLdYhPTf4EY=dFeMNdYgg@mail.gmail.com>
 <tencent_0A4CA0E45DBD0DC1086D0099@qq.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57768630.4020308@nod.at>
Date: Fri, 1 Jul 2016 17:03:12 +0200
MIME-Version: 1.0
In-Reply-To: <tencent_0A4CA0E45DBD0DC1086D0099@qq.com>
Content-Type: text/plain; charset=gb18030
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 01.07.2016 um 16:55 schrieb »ÔÉÙ:
> 1. You mean in async mode file is written to flash by writeback mechanism? If so, background thread has nothing to do with writing file to flash? 

I'd not say nothing, it does the commit.

> 2. In sync mode, is writting finished by ubifs background thread or calling thread calling write()?

The calling thread.

Please start reading the UBIFS source code.

Thanks,
//richard
