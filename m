Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eJJN2-0001Sw-EB
 for linux-mtd@lists.infradead.org; Mon, 27 Nov 2017 13:22:51 +0000
From: Richard Weinberger <richard@nod.at>
To: andrea.adami@gmail.com
Cc: linux-mtd@lists.infradead.org
Subject: Fwd: New Defects reported by Coverity Scan for Linux
Date: Mon, 27 Nov 2017 14:22:47 +0100
Message-ID: <2572889.U5NfXx5rJG@blindfold>
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

Andrea,

please check. The same pattern seems to be used more than once in this driver.

Thanks,
//richard

----------  Weitergeleitete Nachricht  ----------

Betreff: New Defects reported by Coverity Scan for Linux
Datum: Montag, 27. November 2017, 08:49:21 CET
Von: scan-admin@coverity.com
An: richard@nod.at



Hi,

Please find the latest report on new defect(s) introduced to Linux, under 
component 'Drivers-MTD',  found with Coverity Scan.

1 new defect(s) introduced to Linux, under component 'Drivers-MTD',  found 
with Coverity Scan.
344 defect(s), reported by Coverity Scan earlier, were marked fixed in the 
recent build analyzed by Coverity Scan.

New defect(s) Reported-by: Coverity Scan
Showing 1 of 1 defect(s)


** CID 1424016:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
/drivers/mtd/parsers/sharpslpart.c: 195 in sharpsl_nand_init_ftl()


________________________________________________________________________________________________________
*** CID 1424016:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
/drivers/mtd/parsers/sharpslpart.c: 195 in sharpsl_nand_init_ftl()
189     	/* initialize ftl->log2phy */
190     	for (i = 0; i < ftl->logmax; i++)
191     		ftl->log2phy[i] = UINT_MAX;
192     
193     	/* create physical-logical table */
194     	for (block_num = 0; block_num < phymax; block_num++) {
>>>     CID 1424016:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
>>>     Potentially overflowing expression "block_num * mtd->erasesize" with 
type "unsigned int" (32 bits, unsigned) is evaluated using 32-bit arithmetic, 
and then used in a context that expects an expression of type "loff_t" (64 
bits, signed).
195     		block_adr = block_num * mtd->erasesize;
196     
197     		if (mtd_block_isbad(mtd, block_adr))
198     			continue;
199     
200     		if (sharpsl_nand_read_oob(mtd, block_adr, oob))


________________________________________________________________________________________________________
To view the defects in Coverity Scan visit, https://u2389337.ct.sendgrid.net/
wf/click?
upn=08onrYu34A-2BWcWUl-2F-2BfV0V05UPxvVjWch-2Bd2MGckcRZILrCyVW9WQLwr7wR5iGubla-2BOU6Se2Euumsa1bPpOJg-3D-3D_p9c2Pq5BRWXelYclnUuZY8l3SYc-2FPJtx2STX-2BpF5A6td-2FPvSZFHfZnIH7Pkuotsj40dgSYlEHnY3fa8hwUfXcZx2zIMi9ygf9fvrncbz9LZ035WDZixEDGKJm-2BkA-2FlNNw4vjG8qChO-2Fsn3KGwsVc2B46OlL-2BawwYWOieMWWWlm44I8px-2BoB-2BuIPoEApB2C1WKE6DZ0qI9OL3nk2Lf6cdMA-3D-3D

To manage Coverity Scan email notifications for "richard@nod.at", click 
https://u2389337.ct.sendgrid.net/wf/click?
upn=08onrYu34A-2BWcWUl-2F-2BfV0V05UPxvVjWch-2Bd2MGckcRbVDbis712qZDP-2FA8y06Nq4PW1q5HE7hT0R7FQopI50uMi-2FXxBV9hqQbIHwUk8i5vtfR-2BsAt7Vmc5VhhK-2BFpW3LXtshV-2BNRMG6fEVAWxE0JubBijVgPqNmrGAZeWjyxZKc-3D_p9c2Pq5BRWXelYclnUuZY8l3SYc-2FPJtx2STX-2BpF5A6td-2FPvSZFHfZnIH7PkuotsjtjhWtoA3IVRL5bV1R9qiwG4cqA-2FKu4HHy-2FY11gvyLcPSbxHkMq75abGzuiZVVK-2BoMEddCyVJkKCXyuwR33GIGAu-2F-2BxMohkiXZLfEkTEF4Cq4rSxCKccF8nqIWYFGjwP7kzyOHAH5cWC2z4YWNyegGg-3D-3D


-------------------------------------------------------------
