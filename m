Received: from mx00.ca.mci.com ([142.77.1.58])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDygo-0006DA-Rj
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 05:41:26 +0100
Received: from roadie.xiphos.ca (unknown [216.95.199.148])
	by mx00.ca.mci.com (Postfix) with ESMTP id EE9003CD88
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Apr 2004 00:41:24 -0400 (EDT)
From: Joshua Lamorie <jpl@xiphos.ca>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1081995604.30866.20.camel@roadie.xiphos.ca>
References: <1081995604.30866.20.camel@roadie.xiphos.ca>
Content-Type: text/plain
Message-Id: <1082004106.32004.47.camel@roadie.xiphos.ca>
Mime-Version: 1.0
Date: Thu, 15 Apr 2004 00:41:46 -0400
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 on big-endian system, 8-bit wide flash on 32-bit bus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Well, I've found a fix, but it's a bit of a kludge, and I don't know if
there is a more proper way.  I kinda think that changing something in
the kernel is rather drastic, but anyway...  

The block device makes all of the access through cfi_amdstd_read which
will then call the map->copy_from function.  This gets mapped through to
a straight memcpy, with no respect paid to the buswidth of the flash
device.  So, I added a little switch.  Here is the code I'm now using in
drivers/mtd/maps/physmap.c

void physmap_copy_from(struct map_info *map, void *to, unsigned long
from, ssize_t len)
{
        int i;
        if(map->buswidth == 1){
                for(i=0;i<len;i++){
                        ((__u8 *)to)[i] = physmap_read8(map,from+i);
                }
        }else
                memcpy_fromio(to, map->map_priv_1 + from, len);

}

Is this a gross hack?  Should I be paying attention to endianness?

Anyway.. it seems to be working so far.  It's just soooo slow! (my
fault).

Now if I can get the root-filesystem there.

Joshua



-- 
Joshua Lamorie				jpl@xiphos.ca
Space Systems				514-848-9640 ext. 277
Xiphos Technologies Inc.		514-848-9644 (fax)
