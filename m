From: ohmura@co-nss.co.jp (OHMURA Yutaka)
Date: Thu, 27 Feb 2003 23:02:33 +0900
Subject: How to use EP8260 MTD device?
In-Reply-To: <016701c2de11$40b9e490$e600a8c0@udtech.net>
References: <016701c2de11$40b9e490$e600a8c0@udtech.net>
Message-ID: <20030227230233up0yC4@co-nss.co.jp>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Ouch!

It was my careless miss.
Surely &physmap_map ==map.

"Shen Rong" <rshen@udtech.com.cn> wrote:

> > physmap_map by address to do_map_probe.(do_map_probe(*type,
> &physmap_map);)
> > At this point , &physmap_map == 0xC022E82C.
> > But in do_map_probe(driver/mtd/chips/chipreg.c:do_map_probe(struct
> mtd_info
> > *do_map_probe(const char *name, struct map_info *map)), *map ==
> 0xC02D7EA8.
> What do you want it to be? The &physmap_map == map, not *map!
> *map will be the first element in the map_info struct, which is the 'name'.
