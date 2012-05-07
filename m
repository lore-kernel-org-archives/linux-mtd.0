Received: from mail.grid-net.com ([97.65.115.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRSJR-0001al-Ev
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 18:05:35 +0000
Message-ID: <4FA80EEB.8040501@grid-net.com>
Date: Mon, 7 May 2012 11:05:31 -0700
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: What would cause large block of NAND to be marked as bad?
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am working with some prototype hardware and I have seen some weird 
behaviour when testing power cut.

On my board I have Micron MT29F2G08ABAEAH4 part and now have three 
boards on which close to 20-30 blocks have been marked as bad.

We mainly run UBIFS on these boards, if there was flash data corruption 
we expected to see errors at UBIFS level i.e. not able to mount UBIFS 
file system but we didn't expect NAND blocks themselves to be marked as 
bad, due to power cut.

What would cause large number of NAND blocks to be marked as bad, due to 
power cut?

-Subodh
