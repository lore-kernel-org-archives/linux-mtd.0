Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QGojP-0004Sf-MV
	for linux-mtd@lists.infradead.org; Mon, 02 May 2011 08:43:52 +0000
Received: by wwb39 with SMTP id 39so4335777wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 02 May 2011 01:43:49 -0700 (PDT)
Message-ID: <4DBE6EC2.5020008@gmail.com>
Date: Mon, 02 May 2011 10:43:46 +0200
From: angelo <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: help request, jffs2 fs files get lost
References: <4DBD4572.5040508@gmail.com>
	<Pine.LNX.4.64.1105020853440.15966@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1105020853440.15966@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/05/2011 08:55, Ricard Wanderlof wrote:
>
> On Sun, 1 May 2011, Angelo Dureghello wrote:
>
>> So from uClinux, i try to prepare the jffs2 fs:
>>
>> # eraseall /dev/mtd2
>> erased 1024 Kibyte @ 0 -- 100% complete.
>>
>> cat /dev/mtd2    i see the flash has been cleared
>>
>> then i create a folder "backup" in /var with some files and try to 
>> crete the jffs2 fs:
>>
>> mkfs.jffs2 -d backup -o jffs2.img
>>
>> cp /deV/mtd2 jffs2.img
>
> If this is in fact what you're doing, you're overwriting your 
> jffs2.img file with the all-ff's contents of the newly erased 
> /dev/mtd2. Swap the two arguments instead.
>
> /Ricard

Hi Ricard,
sorry, was late and just appended a bad had-written text,

i generally do "cp jffs2.img /dev/mtd2", and after mounting mtdblock2 i 
see correctly the root tree.

I did some other tests:
if i mount the new created jffs2 and unmount it, nothing is lost.
If i mount it, open a file, append some text, close it and unmount, then 
at the next mount everything is disapperaed (checking mtd2, all is set 
to 0xff).

Saving modified files i notice a warning:
Writing files is also notice some MTD debug trace, maybe an error:
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000074)


many thanks,
angelo


-- 

  .:.:.SYSAM.:.:.

   di Angelo Dureghello
     via San Nazario 149
       34151, Trieste, Italy
     ++39 340 7631990
   www.sysam.it  <http://www.sysam.it>
