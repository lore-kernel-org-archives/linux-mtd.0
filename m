Received: from ns1.nougen.com ([216.185.81.251] helo=mail.nougen.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dG28-0000dU-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 19:34:36 +0000
Message-ID: <01b401c1b97e$04d09180$f801a8c0@minibm>
From: "Chung Ming" <min@hello.org>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <00de01c1b8ac$928d8b40$f801a8c0@minibm>  <Pine.LNX.4.44.0202112157400.1558-100000@lapdancer.baythorne.internal>  <17136.1014059667@redhat.com>
Subject: Re: "No Flash Chips Recognized." error. 
Date: Wed, 20 Feb 2002 03:45:40 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Yes, I have this:
_______________________________________________________________

                     doc->id = id;
                        doc->chipshift = nand_flash_ids[i].chipshift;
                        break;
                }
        }

        if (nand_flash_ids[i].name == NULL)
                {
                printk("Chip with mfr %02x, id %02x unknown. Tell dwmw2\n");
                return 0;
                }
        else
                return 1;
}

_________________________________________________________________
still shows the same :(


----- Original Message -----
From: David Woodhouse
To: Chung Ming
Cc: linux-mtd@lists.infradead.org
Sent: Tuesday, February 19, 2002 3:14 AM
Subject: Re: "No Flash Chips Recognized." error.



+ printk("Chip with mfr %02x, id %02x unknown. Tell dwmw2\n");

Oops. Try it with the numbers in :)

--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
