Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FY2f5-0004KT-VF
	for linux-mtd@lists.infradead.org; Mon, 24 Apr 2006 11:08:39 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IY800D4OFCQAQV1@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 24 Apr 2006 11:07:38 -0400 (EDT)
Date: Mon, 24 Apr 2006 11:07:38 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <cda58cb80604240740j62e51ecctb3ad75673b98445a@mail.gmail.com>
To: Franck Bui-Huu <vagabon.xyz@gmail.com>
Message-id: <Pine.LNX.4.64.0604241104570.18520@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <cda58cb80604240740j62e51ecctb3ad75673b98445a@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Reduce the size of a probed flash for broken HW
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 24 Apr 2006, Franck Bui-Huu wrote:

> [discussed with Vitaly Wool on IRC]
> 
> My hardware has some problem to access my onboard flashes specially
> the last 64Ko of them. So I need a way to restrict access to these areas.
> 
> Several solutions comes in mind:
> 
>   - In the mapping driver, try to modify the mtd_info and cfi_info
>     setup by the MTD probing functions to reduce the detected
>     size. This solution is really hackish since it modifies internal
>     structures of the MTD layer that the mapping driver is not
>     supposed to be aware of. I just did this in my driver:
> 
> 	*mtd = do_map_probe("xxx_probe", map);
> 	while ((*mtd)->size > 32Mo - 64Ko)
> 		(*mtd)->size -= (*mtd)->erasesize;
> 
>     and it seems to work fine...

I think that is indeed the easiest solution.  Just keep it to your map 
driver and clearly label it with a big comment explaining why you do so.

I don't think you need to modify the cfi_info at all.


Nicolas
