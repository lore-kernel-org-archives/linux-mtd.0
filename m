Received: from nf-out-0910.google.com ([64.233.182.186])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GPcgF-0007JE-9U
	for linux-mtd@lists.infradead.org; Tue, 19 Sep 2006 11:18:19 +0100
Received: by nf-out-0910.google.com with SMTP id l37so119322nfc
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Sep 2006 03:17:12 -0700 (PDT)
Message-ID: <450FC3A4.9020402@gmail.com>
Date: Tue, 19 Sep 2006 12:17:08 +0200
From: Jiri Slaby <jirislaby@gmail.com>
MIME-Version: 1.0
To: Josh Boyer <jdub@us.ibm.com>
Subject: Re: [PATCH 2/4] pmc551 remove unnecessary braces
References: <91292912129122wcf1@karneval.cz>
	<1158624979.3600.31.camel@zod.rchland.ibm.com>
In-Reply-To: <1158624979.3600.31.camel@zod.rchland.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, Mark Ferrell <mferrell@mvista.com>,
	linux-mtd@lists.infradead.org, Jiri Slaby <jirislaby@gmail.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On Tue, 2006-09-19 at 00:47 +0200, Jiri Slaby wrote:
>> diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
>> index 6d4d5a4..0ee22ca 100644
>> --- a/drivers/mtd/devices/pmc551.c
>> +++ b/drivers/mtd/devices/pmc551.c
>> @@ -137,11 +137,11 @@ #endif
>>  
>>  	pmc551_point(mtd, instr->addr, instr->len, &retlen, &ptr);
>>  
>> -	if (soff_hi == eoff_hi || mtd->size == priv->asize) {
>> +	if (soff_hi == eoff_hi || mtd->size == priv->asize)
>>  		/* The whole thing fits within one access, so just one shot
>>  		   will do it. */
>>  		memset(ptr, 0xff, instr->len);
>> -	} else {
>> +	else {
>>  		/* We have to do multiple writes to get all the data
>>  		   written. */
>>  		while (soff_hi != eoff_hi) {
> 
> I actually find this change to make the code less readable.  Yes, the
> braces aren't technically necessary, but the else requires them, and the
> comment block before the memset makes this multi-line.
> 
> This whole patch is highly user preference, but I'd rather these braces
> stay.

Yes, I agree. This was one of my old patches stored on other PC, that I find 
now. The patch definitely makes it ugly.

>> @@ -700,9 +695,8 @@ static int __init init_pmc551(void)
>>  
>>  		if ((PCI_Device = pci_find_device(PCI_VENDOR_ID_V3_SEMI,
>>  						  PCI_DEVICE_ID_V3_SEMI_V370PDC,
>> -						  PCI_Device)) == NULL) {
>> +						  PCI_Device)) == NULL)
>>  			break;
>> -		}
> 
> 1) If you're going for coding style, the assignment within the if
> condition needs to be moved outside of it.
> 
> 2) If you're not going to fix 1, then leave the braces.

1) is fine, I will do it, thanks for comments.

-- 
http://www.fi.muni.cz/~xslaby/            Jiri Slaby
faculty of informatics, masaryk university, brno, cz
e-mail: jirislaby gmail com, gpg pubkey fingerprint:
B674 9967 0407 CE62 ACC8  22A0 32CC 55C3 39D4 7A7E
