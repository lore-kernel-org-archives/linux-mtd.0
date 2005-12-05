Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ej9B8-0005uT-Fc
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2005 00:46:26 -0500
Message-ID: <4393D42C.9040303@ru.mvista.com>
Date: Mon, 05 Dec 2005 08:46:20 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Todd Poynor <tpoynor@mvista.com>
References: <438FF22A.2060203@ru.mvista.com> <4390C552.60907@mvista.com>
In-Reply-To: <4390C552.60907@mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd/utils: sync with MTD ioctl interface rework to get
 rid of MEMGETOOBSEL/MEMSETOOBSEL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Todd,

Todd Poynor wrote:

> Hi Vitaly, my comments...
>
>> +++ util/nanddump.c    2 Dec 2005 06:54:11 -0000
>> @@ -163,6 +163,7 @@
>>      struct mtd_oob_buf oob = {0, 16, oobbuf};
>>      mtd_info_t meminfo;
>>      char pretty_buf[80];
>> +    uint32_t oobavail;
>>  
>>       process_options(argc, argv);
>>  
>> @@ -179,6 +180,13 @@
>>          exit (1);
>>      }
>>  
>> +    if (ioctl(fd, MEMGETOOBAVAIL, &oobavail) != 0) {
>> +        perror("unable to get NAND oobavail");
>> +        close(fd);
>> +        exit(1);
>> +    }
>
>
> How about fall back to all 16/64/etc. avail?
>
> For debugging purposes it can be nice to see the raw OOB, in case that 
> can be shoehorned in here somehow.

Well, the main idea of what I'm implementing is to hide the internal 
structure of the OOB data from user. Therefore it's no guaranteed way in 
this implementation to read the raw OOB.
On the other hand, not being able to get oobavail means a problem so I 
wouldn't try to read OOB in this situation.
However I can a) add a flag to both read_oob/write_oob whether to read 
oobavail or raw OOB and implement corresponding functionality/flag in 
nanddump, or) fall back to considering oobavail being equal to oobsize 
if getting oobavail fails but neither variant seems good to me...

>
>> +++ util/nandwrite.c    2 Dec 2005 06:54:11 -0000
>
>
>> -           "  -j, --jffs2           force jffs2 oob layout (legacy 
>> support)\n"
>> -           "  -y, --yaffs           force yaffs oob layout (legacy 
>> support)\n"
>
>
> Again, it may be good to keep a legacy mode around during the 
> transition period.

I'm afraid it's not possible. And this legacy support has been sheduled 
to go away long ago, I hope now is a good time :)

>
>>          if (writeoob) {
>>              /* Read OOB data from input file, exit on failure */
>> -            if ((cnt = read(ifd, oobreadbuf, meminfo.oobsize)) != 
>> meminfo.oobsize) {
>> +            if ((cnt = read(ifd, oobreadbuf, oobavail)) != oobavail) {
>
>
> This requires the input file to be tailored to the oobavail of a 
> specific destination device, reducing the benefit of autoplacement.  
> It may be best to continue to pad input files oob data to the full 
> oobsize, much like the data portion is handled.

Well, padding doesn't work in nandwrite if the image to be written 
contains OOB data. The idea as I see it is if you are trying to write 
the image with OOB data, you should know what you're doing, and that 
implies knowledge of the oobavail size.
On the other hand, it might be useful to implement an option for 
nandwrite which specifies what OOB data length user supposes (default 
will be the oobavail).

>
>> +                memcpy(oobbuf, oobreadbuf, oobavail);
>
>
> No need for oobreadbuf and copy if no OOB layout processing done anymore?
>
Yeah, thanks.
And 'noecc' parameter should also go away. An update of the patch will 
follow...

Vitaly
