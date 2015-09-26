Received: from r00tworld.com ([212.85.137.150])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfpQK-0003zT-UE
 for linux-mtd@lists.infradead.org; Sat, 26 Sep 2015 13:21:57 +0000
From: "PaX Team" <pageexec@freemail.hu>
To: linux-mtd@lists.infradead.org
Date: Sat, 26 Sep 2015 15:18:08 +0200
MIME-Version: 1.0
Subject: question about potential integer truncation in default_erasesize
Reply-to: pageexec@freemail.hu
CC: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, re.emese@gmail.com,
 spender@grsecurity.net
Message-ID: <56069B10.450.51AFEC35@pageexec.freemail.hu>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi all,

drivers/mtd/chips/map_rom.c:default_erasesize can truncate map_info.size
from unsigned long to unsigned int on 64 bit archs and i'm wondering if
this is intentional or should/could map_info.size be turned into an unsigned
int field? FTR, this issue was detected with the upcoming version of the
size overflow plugin we have in PaX/grsecurity and there're a handful of
similar cases in the tree where potentially unwanted or unnecessary integer
truncations occur, this being one of these. any opinion/help is welcome!

cheers,
  PaX Team
