Received: from t111.niisi.ras.ru ([193.232.173.111] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ISlJ-00065O-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2001 11:23:03 +0100
Message-ID: <3B460280.9060805@niisi.msk.ru>
Date: Fri, 06 Jul 2001 14:25:04 -0400
From: Alexandr Andreev <andreev@niisi.msk.ru>
MIME-Version: 1.0
To: dwmw2@infradead.org,
        "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: FTL and Endianity
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

Hi,
It is about FTL again.
I have got a MIPS big endian machine with CFI flash. And i obliged to 
hack ftl.c
to provide correct endianity working. I mean, i must undef all 
cpu_to_le32 and the
others macros. For little endian machines these macros do nothing, but 
for my big
endian MIPS these macros are unusable too. Did anybody test FTL with big 
endian CPU?
If no, we need to throw these macros out. In any case, we have to be 
able to
configure this behaviour.
