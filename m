Received: from [203.197.255.76] (helo=mail.navayuga.co.in)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CcF5r-0003qT-N9
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2004 22:35:53 -0500
Message-ID: <001c01c4dda0$839c4920$8500a8c0@nit37>
From: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 9 Dec 2004 09:08:04 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
Subject: MTD driver
Reply-To: Subrahmanyam <subrahmanyam@navayuga.co.in>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Hi Stephen,

 Yes as you have said I shall setup a dedicated partition to give access a
 particular location in flash. We, have an Intel starta NOR flash which uses
 cfi command set driver, which basically i guess takes care of the erase
 operation too.  I have accessed the target through minicom tool, is this
 where i have to set up an additional partition?, can you suggest any site 
or
 procedure by which I can acheive setting up an additional partition.

 Yes, Thomas has suggested that i indeed use a filesystem, but how can I 
best
 achieve it! I mean the procedure to store data in a file.

 Thanks,
 Subrahmanyam.

>
> ----- Original Message ----- 
> From: "Stephan Linke" <Stephan.Linke@epygi.de>
> To: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
> Cc: <linux-mtd@lists.infradead.org>
> Sent: Wednesday, December 08, 2004 03:33 PM
> Subject: RE: MTD driver
>
>
>> Hi,
>>
>> you may setup a dedicated partition that gives you access to the 
>> particular
>> location in the flash where you whant to place this data. Then you can 
>> use
>> normal open() read() write() and seek() functions to access what ever 
>> byte in
>> this partition. How to erass a block you can look up in one of the MTD 
>> tools.
>> (Only if you are using NAND flash you should not do it like this since 
>> bad block
>> handling whould be missing.)
>> But I aggree with Thomas. Best whould be to put it into a filesystem...
>>
>> Stephan
>>
>>
>>> -----Original Message-----
>>> From: linux-mtd-bounces@lists.infradead.org
>>> [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Thomas
>>> Gleixner
>>> Sent: Mittwoch, 8. Dezember 2004 07:37
>>> To: Subrahmanyam
>>> Cc: linux-mtd@lists.infradead.org
>>> Subject: Re: MTD driver
>>>
>>>
>>> On Tue, 2004-12-07 at 09:16 +0530, Subrahmanyam wrote:
>>> >  Hi,
>>> >
>>> >  I need to provide an user interface/GUI wherein when a certain data
>>> > (string/key) is entered, it should basically store the key in the 
>>> > flash
>>> > (this basically happens during run time after the target has been
>>> identified
>>> > by the host).
>>> >
>>> > In the target we have a flash in which there is jffs2 file system and 
>>> > also
>>> > mtd drivers, since i need to store block oriented data, i am looking 
>>> > at the
>>> > possiblity of using mtd driver and storing data(key) in a particular
>>> > location in flash. How should i proceed in acheiving the same.
>>>
>>> Is there any good reason, why the key cannot be stored on the already
>>> available jffs2 filesystem ?
>>>
>>> tglx
>>>
>>>
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>
>>
> 
