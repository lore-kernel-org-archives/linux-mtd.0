From: Arnd Bergmann <arnd@arndb.de>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] MTD: cfi: reduce stack size
Date: Mon, 09 Mar 2015 20:33:17 +0100
Message-ID: <10197110.03snLubgYs@wuerfel>
In-Reply-To: <54FDC33E.2060004@vanguardiasur.com.ar>
References: <2161999.Fy9EjgoTPm@wuerfel>
 <54FDC33E.2060004@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 09 March 2015 12:58:54 Ezequiel Garcia wrote:
> On 03/09/2015 10:58 AM, Arnd Bergmann wrote:
> > The cfi_staa_write_buffers function uses a large amount of ernel stack
> 
> Typo: "ernel"

ok

> > whenever CONFIG_MTD_MAP_BANK_WIDTH_32 is set, and that results in a
> > warning on ARM allmodconfig builds:
> > 
> > drivers/mtd/chips/cfi_cmdset_0020.c: In function 'cfi_staa_write_buffers':
> > drivers/mtd/chips/cfi_cmdset_0020.c:651:1: warning: the frame size of 1208 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> > 
> > It turns out that this is largely a result of a suboptimal implementation
> > of map_word_andequal(). Replacing this function with a straightforward
> > one reduces the stack size in this function by exactly 200 bytes,
> > shrinks the .text segment for this file from 27648 bytes to 26608 bytes,
> > and makes the warning go away.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > 
> > diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
> > index 5f487d776411..2d2457bee50c 100644
> > --- a/include/linux/mtd/map.h
> > +++ b/include/linux/mtd/map.h
> > @@ -314,7 +314,15 @@ static inline map_word map_word_or(struct map_info *map, map_word val1, map_word
> >  	return r;
> >  }
> >  
> > -#define map_word_andequal(m, a, b, z) map_word_equal(m, z, map_word_and(m, a, b))
> > +static inline int map_word_andequal(struct map_info *map, map_word val1, map_word val2, map_word val3)
> > +{
> > +	int i;
> > +	for (i=0; i<map_words(map); i++) {
> 
> Nit:
> 
> for (i = 0; i < map_words(map); i++)

It's the same as five other copies of the same loop in this file, but I've
changed this one now.

Thanks,

	Arnd
