Received: from [203.197.255.76] (helo=mail.navayuga.co.in)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CdqjJ-0002RS-P4
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2004 08:59:15 -0500
Message-ID: <004101c4e11c$3dc21540$8500a8c0@nit37>
From: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
To: <linux-mtd@lists.infradead.org>
References: <001c01c4dda0$839c4920$8500a8c0@nit37>
	<1102586664.3306.26.camel@tglx.tec.linutronix.de>
Date: Mon, 13 Dec 2004 19:31:18 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Subject: Re: MTD driver
Reply-To: Subrahmanyam <subrahmanyam@navayuga.co.in>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

Can you suggest an approach to write into the flash either by using a file 
system or by using mtd drivers.
Yes, I am aware of writing data to a normal file but, but how is it possible 
to do in a jffs2 file system which is read only.

Please do suggest an approach.

Thanks,
Subrahmanyam.


----- Original Message ----- 
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, December 09, 2004 03:34 PM
Subject: Re: MTD driver


> On Thu, 2004-12-09 at 09:08 +0530, Subrahmanyam wrote:
>>  Yes, Thomas has suggested that i indeed use a filesystem, but how can I
>> best
>>  achieve it! I mean the procedure to store data in a file.
>
> # echo "KEYSTRING" >/path/to/your/file
>
> All programming languages provide functions to write to files.
>
> # man 2 write
>
> might be a good start. If this does not help you might try
>
> http://www.amazon.com/exec/obidos/ASIN/0764570684/dangookin/104-4933924-3663106?creative=327641&camp=14573&link_code=as1
>
> for further assistance.
>
> tglx
>
> 
