From: guo_zl9@hotmail.com (guo_zhenglin)
Date: Mon, 24 Mar 2003 11:04:01 +0800
Subject: help: network cannot startup from FLASH
References: <Pine.LNX.4.33.0303211739400.23519-100000@hex.linuxgrrls.org>
Message-ID: <OE64jukJ1zkc6g9wHRQ0000134f@hotmail.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I modify file: arch/ppc/8xx_io/enet.c:
------original text ------------------------------------
   int __init scc_enet_init(void)
 {
  ......
#ifndef CONFIG_MBX
        for (i=5; i>=0; i--)
                *eap++ = dev->dev_addr[i] = bd->bi_enetaddr[i];
#else
        for (i=5; i>=0; i--)
             dev->dev_addr[i] = *eap++;
#endif

------after modified  ------------------------------------
   int __init scc_enet_init(void)
 {
  ......
#ifndef CONFIG_MBX
        for (i=5; i>=0; i--)
                *eap++ = dev->dev_addr[i] = bd->bi_enetaddr[i];
#else
        for (i=5; i>=0; i--)
                *eap++ = dev->dev_addr[i] = bd->bi_enetaddr[i];
             /*      dev->dev_addr[i] = *eap++; */
#endif


then network MAC can be recognised correctly ,and BOOTP can  get  IP
address.
but I don't know that reason.
