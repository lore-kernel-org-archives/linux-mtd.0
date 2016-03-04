From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: avoid stack overflow in MTD CFI code
Date: Sat, 05 Mar 2016 00:25:24 +0100
Message-ID: <2259988.Lj3BC6sPv6@wuerfel>
In-Reply-To: <20160304212159.GA55664@google.com>
References: <1456748436-522413-1-git-send-email-arnd@arndb.de>
 <20160304212159.GA55664@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 04 March 2016 13:21:59 Brian Norris wrote:
> 
> Looking a little closer at this... why do we need the changes to
> include/linux/mtd/map.h again? It should be fine to leave these
> definitions as-is, right? They don't contribute to the large stack
> usage, do they?
> 
> Maybe I'm just missing something obvious, so please do enlighten 
> 

It's been a while since I created the patch, and the originally
failing configuration currently doesn't produce this (probably
because something else changed). I remember that it was something
rather subtle, but don't exactly remember what happened.

I've reverted the patch now, trying to reproduce it on my
randconfig setup, but I might not be able to get back to you
in the next week while I'm traveling.

	Arnd
