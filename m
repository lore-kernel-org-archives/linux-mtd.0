Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MERKX-0001sq-Ic
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 17:11:24 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MERKU-0006Cp-QS
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 17:11:14 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2009 17:11:14 +0000
Received: from jehan by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2009 17:11:14 +0000
To: linux-mtd@lists.infradead.org
From: Jehan Bing <jehan@orb.com>
Subject: Re: [PATCH 1/3] [MTD-UTILS] Unified reading from standard input
	and from file
Date: Wed, 10 Jun 2009 10:11:03 -0700
Message-ID: <4A2FE927.3020309@orb.com>
References: <h0k3il$ij6$1@ger.gmane.org>	<1244551983.5847.388.camel@localhost.localdomain>	<4A2E98BD.30704@orb.com>
	<h0mppp$7v2$1@ger.gmane.org>
	<1244649814.5847.404.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1244649814.5847.404.camel@localhost.localdomain>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Tue, 2009-06-09 at 16:04 -0700, Jehan Bing wrote:
>   
>> -		readlen = meminfo.writesize;
>>  
>> -		if (ifd != STDIN_FILENO) {
>> -			int tinycnt = 0;
>> -
>> -			if (pad && (imglen < readlen))
>> -			{
>> -				readlen = imglen;
>> -				erase_buffer(writebuf + readlen, meminfo.writesize - readlen);
>> -			}
>> +		{
>> +			readlen = meminfo.writesize;
>>  
>>     
>
> Err, why do you need these spare { } ?
>   

Right, I wanted to comment on that but forgot by the time I started the 
email.
My idea was to make the patches clearer. Patch 3/3 puts that code inside 
a condition. So to avoid extra changes just because of the indentation, 
I added the extra { } in this patch instead since I was already heavily 
modifying it anyway.
Do you prefer me to remove them?


>> -			/* Read Page Data from input file */
>> -			while(tinycnt < readlen) {
>> -				cnt = read(ifd, writebuf + tinycnt, readlen - tinycnt);
>> -				if (cnt == 0) { // EOF
>> -					break;
>> -				} else if (cnt < 0) {
>> -					perror ("File I/O error on input file");
>> -					goto closeall;
>> -				}
>> -				tinycnt += cnt;
>> -			}
>> -		} else {
>>  			int tinycnt = 0;
>>     
>
> Err, is it normal C do do stuff like
> {
> 	readlen = meminfo.writesize;
> 	int tinycnt += cnt;
>
> ? I think this is C++.
>   

gcc didn't complain. Easy to fix.
