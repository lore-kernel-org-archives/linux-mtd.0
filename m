Received: from mail-ew0-f222.google.com ([209.85.219.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MdGFO-00037j-IM
	for linux-mtd@lists.infradead.org; Tue, 18 Aug 2009 04:24:39 +0000
Received: by ewy22 with SMTP id 22so3365730ewy.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Aug 2009 21:24:31 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 18 Aug 2009 01:24:31 -0300
Message-ID: <600adaf50908172124w1196be37u3a409cbcad0fad65@mail.gmail.com>
Subject: mtdram max size
From: Tiago Maluta <tiago.maluta@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm searching a way to create a mtdram block device with large sizes
(> 150MB). Ranging some values to 'total_size' parameter I found a
boundary of approx. 110MB. I tried to fix looking at __vmalloc_node()
putting some "poor" debug  printk() in order to see something:


# modprobe mtdram total_size=120000

[  161.664200] -- tm -- __vmalloc_node() num_physpages: 784080 size:
8192 PAGE_SHIFT: 12
[  161.664733] -- tm -- mtdram.c init_mtdram(void)
[  161.664737] -- tm -- __vmalloc_node() num_physpages: 784080 size:
122880000 PAGE_SHIFT: 12
[  161.664751] vmap allocation for size 122884096 failed: use
vmalloc=<size> to increase size.

If I pass vmalloc size on

# modprobe mtdram total_size=110000

[  166.026400] -- tm -- __vmalloc_node() num_physpages: 784080 size:
8192 PAGE_SHIFT: 12
[  166.026748] -- tm -- mtdram.c init_mtdram(void)
[  166.026752] -- tm -- __vmalloc_node() num_physpages: 784080 size:
112640000 PAGE_SHIFT: 12
[  166.026764] -- tm -- __vmalloc_node() num_physpages: 784080 size:
110592 PAGE_SHIFT: 12

# rmmod mtdram

[  172.218498] -- tm -- mtdram.c cleanup_mtdram(void)

Other information:

$ uname -r
2.6.31-rc6-maluta-00043-g894ef82-dirty

# cat /proc/meminfo | grep Vmalloc
MemTotal:        3104428 kB
(...)
VmallocTotal:        122880 kB
VmallocUsed:       11692 kB
VmallocChunk:      77884 kB

>From meminfo I think I need to expand vmalloc size, but I didn't
figure how to do or if it's the correct way. So I decided ask here.


Kind regards,

--tm
