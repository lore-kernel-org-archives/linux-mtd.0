Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta01.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172Bzh-00078j-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2002 15:19:09 +0100
Received: from sitemail.everyone.net (dsnat [216.200.145.62])
	by omta01.mta.everyone.net (Postfix) with ESMTP id 318001C3D0B
	for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2002 07:19:08 -0700 (PDT)
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Mon, 29 Apr 2002 07:19:07 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Reply-To: zeusj@firstlinux.net
Message-Id: <20020429141907.000033ED3@sitemail.everyone.net>
Subject: (no subject)
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

Hi ,folks 
 
I am reading MTD code now , and I meet some problem

in the /drivers/mtd/chips/cfi_probe.c 

	/* Check each previous chip to see if it's an alias */
	for (i=0; i<cfi->numchips; i++) {
		/* This chip should be in read mode if it's one
		   we've already touched. */
		if (qry_present(map,chips[i].start,cfi)) {
			/* Eep. This chip also had the QRY marker. 
			 * Is it an alias for the new one? */
			cfi_send_gen_cmd(0xF0, 0, chips[i].start, map, cfi, cfi->device_type, NULL);

			/* If the QRY marker goes away, it's an alias */
			if (!qry_present(map, chips[i].start, cfi)) {
				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
				       map->name, base, chips[i].start);
				return 0;

/*******I have no idea that the following query command for*******/
/**********I think it will never happen*******************/}
			/* Yes, it's actually got QRY for data. Most 
			 * unfortunate. Stick the new chip in read mode
			 * too and if it's the same, assume it's an alias. */
			/* FIXME: Use other modes to do a proper check */
			cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
			
			if (qry_present(map, base, cfi)) {
				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
				       map->name, base, chips[i].start);
				return 0;
			} 
		}
	}
	


from the code I deduce that 
1. if send the query command twice , the "QRY" will disappear.
2. if send the query command onec, the "QRY" will always be there even you read it many times.
Is my conclusion right?
I know its a stupid question to hardware engineer, but I am a software engineer:<

Any help will be appreciated.


_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Run a small business? Then you need professional email like you@yourbiz.com from Everyone.net  http://www.everyone.net?tag
