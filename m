Subject: Re: JFFS2 what file is a given node in?
From: David Woodhouse <dwmw2@infradead.org>
To: Shane Volpe <shanevolpe@gmail.com>
In-Reply-To: <AANLkTikWFqbH-s2Uo8TjW-fX2jkYdGH=9oKp17yVqZ7F@mail.gmail.com>
References: <AANLkTikWFqbH-s2Uo8TjW-fX2jkYdGH=9oKp17yVqZ7F@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 18:53:48 +0100
Message-ID: <1282672428.31430.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-24 at 08:52 -0400, Shane Volpe wrote:
> I get the following message:
> <4>Data CRC 0550f35b != calculated CRC 81fbb81c for node at 02aedb74
> I want to find out what file this node is in so I can further
> investigate the corruption, how do I do that? 

It's the Data CRC which is failing, so the node header should be fine,
and should happily identify the inode to which it belongs. At 0x2aedb74
on the flash, you'll find a struct jffs2_raw_inode (see
include/linux/jffs2.h for its definition).

It's almost certainly harmless though -- just a poweroff which happened
while the node was being written and before it was even *expected* to
have hit the medium.

-- 
dwmw2
