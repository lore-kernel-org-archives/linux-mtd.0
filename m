Received: from outbound-mail.lax.untd.com ([64.136.28.164])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwQWd-00043L-DM
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 14:50:56 -0500
Received: from outbound29-sr.lax.untd.com (webmail03.lax.untd.com
	[10.131.27.143])
	by smtpout06.lax.untd.com with SMTP id AABBACM2PAKLX5UA
	for <linux-mtd@lists.infradead.org> (sender <pevnev@juno.com>);
	Wed,  2 Feb 2005 11:50:37 -0800 (PST)
Mime-Version: 1.0
From: "Alex" <pevnev@juno.com>
Date: Wed, 2 Feb 2005 19:49:54 GMT
To: tglx@linutronix.de
Content-Type: text/plain
Message-Id: <20050202.115006.19684.4589@webmail03.lax.untd.com>
Cc: linux-mtd@lists.infradead.org
Subject: CONFIG_MTD_PHYSMAP_START
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Also (in addition to my previous post, where I am questioning the correctness of the output, stating that address belongs to RAM while it clearly does not !), Thomas wrote:

>> The initial boot provides the following:
>> Memory map:
>> /* Chip Select FLASH Normal */
>> #define BR0_VAL 0x04000801 /* Offset=0x04000000 PS=16 GPCM Valid=1 */
>> #define OR0_VAL     0xFFC00160  /* OK */

>The value you are using is the value, which is programmed into the BR0
>register of the CPU. 
>BRx = Bank Register for chipselect x
>ORx = Option Register for chipselect x
>The values in those registers define the start address, buswitdh, size,
>timings for the chipselects. So using those values is definitely not a
>good idea. Of course you can decode the values in the registers to get
>your real address values. 

- it looks that I am in the "chicken" and the "egg" problem ...
According to Thomas (see above), I can not rely on the flash phys start address, given to me "verbotum" - so I can not set the value in .config 
for CONFIG_MTD_PHYSMAP_START ... 
Thomas - in what software you advise me to "decode the values in the registers to get real address values" ? 

Thanks,
Best Regards,
Alex


___________________________________________________________________
Speed up your surfing with Juno SpeedBand.
Now includes pop-up blocker!
Only $14.95/month -visit http://www.juno.com/surf to sign up today!
