Received: from [203.197.255.76] (helo=mail.navayuga.co.in)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CdqKU-0002CV-Gw
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2004 08:33:37 -0500
Message-ID: <003301c4e118$a892bc70$8500a8c0@nit37>
From: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
To: <linux-mtd@lists.infradead.org>
References: <NGENJJFPMHGLPILEKKAMCEBICFAA.Stephan.Linke@epygi.de>
Date: Mon, 13 Dec 2004 19:05:39 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Subject: Re: Writing data to Flash
Reply-To: Subrahmanyam <subrahmanyam@navayuga.co.in>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stephan,

Your bootloader doesn't access flash using MTD !
In such case how do you access the contents of the flash!

I'll start looking at physmap.c, If you don't mind can I ask you a question, 
are you also working on storing data in the flash?

I'll look into other possiblities also,

Thanks,
Subrahmanyam.


----- Original Message ----- 
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Subrahmanyam" <subrahmanyam@navayuga.co.in>; 
<linux-mtd@lists.infradead.org>
Sent: Monday, December 13, 2004 06:23 PM
Subject: RE: Writing data to Flash


> Hi Subrahmanyam,
>
> I can't tell you anything about tools sources or environment of your 
> bootloader.
> I don't even know if it actualy uses MTD to access the flash (our 
> bootloader
> doesn't).
> So everything I can tell you is related to MTD drivers in linux 
> environment. To
> have a first start in the mtd/maps directories I suggest locking at 
> physmap.c
> which is a simple mapping that can be configured using the linux kernel
> configuration scripts ("make menuconfig" etc.).
>
> About the C progam: well this program is located in the /bin directory of 
> my
> linux root filesystem.
> About the /dev directory: this directory belongs to the linux root 
> directory
> too. you can find out a lot about this directory by reading
> Documentation/devices.txt
> Most likely you can't use any of this in the bootloader. So you have to 
> ask
> someone who knows you bootloader for more specific assistance.
>
> Regards, Stephan Linke
>
>> -----Original Message-----
>> From: linux-mtd-bounces@lists.infradead.org
>> [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Subrahmanyam
>> Sent: Montag, 13. Dezember 2004 13:24
>> To: linux-mtd@lists.infradead.org
>> Subject: Re: Writing data to Flash
>>
>>
>> Hi Stephan,
>>
>> Our target board consists of a IOP80321 processor with 16mb of flash and
>> 512mb ram which basically consists of RedHat ecos, but the basic build
>> environment in the host side is a Monta Vista Linux OS. When we connect 
>> to
>> the target through "minicom" tool and when red boot is in the process of
>> booting, we basically stop the booting process by which red boot prompt
>> appears. It is here that fis-meaning flash image system comes into 
>> effect,
>> wherein one can create partitions. It is in this context that I have 
>> thought
>> of to load the key into the flash. Is this approach correct or not!
>>
>> You have said that you create a new flash mapping file in mtd/maps
>> directory, can you please suggest a method by which I can proceed. I have
>> looked into the mtd/maps directory in which there are number of files,
>> please suggest which file is the one I have to start with, for acheiving
>> writing data (key) to the flash, dynamically, after the target has been
>> identified by the host.
>>
>>
>> You have said you write a C program that uses normal file access 
>> functions
>> to read/write the data, do you load this program/file into the flash or 
>> does
>> it reside in the target. Where exactly does the flash partition inode has 
>> to
>> be set up in the /dev directory. How to use this mknod tool.
>>
>> Kindly suggest an approach.
>>
>> Thanks,
>> Subrahmanyam.
>>
>>
>>
>>
>>
>> ----- Original Message -----
>> From: "Stephan Linke" <Stephan.Linke@epygi.de>
>> To: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
>> Sent: Monday, December 13, 2004 05:25 PM
>> Subject: RE: Writing data to Flash
>>
>>
>> > Hi Subrahmanyam,
>> >
>> > what kind of operating system do you use? Unfortunately I don't know 
>> > this
>> > "fis"
>> > tool.
>> > It sounds like you are not working in a linux kernel environment.
>> > The way I do it I am writing a "new" flash mapping file for mtd/maps 
>> > that
>> > supports the flash layout for my target system. I do run the new linux
>> > kernel
>> > which provides the new partition layout for the flash. And then I write 
>> > a
>> > new C
>> > program that uses normal file access functions to read/write the data. 
>> > The
>> > flash
>> > partition inode. has to be set up in the /dev directory using the mknod
>> > tool. In
>> > the Documentation directory of the linux kernel you can find the 
>> > correct
>> > device
>> > mappings for this.
>> > How to load the data into RAM depends verry much on you operating 
>> > system.
>> > If you
>> > run linux you can simply use the ftp tool to place a copy of the file 
>> > in
>> > your
>> > filesystem. If you are runing some kind of bootloader you actualy have 
>> > to
>> > read
>> > the bootloader documentation. In that case I can be of verry little 
>> > help.
>> > But
>> > most likely there is some tftp download support you can use.
>> >
>> > Regards, Stephan
>> >
>> >> -----Original Message-----
>> >> From: linux-mtd-bounces@lists.infradead.org
>> >> [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of 
>> >> Subrahmanyam
>> >> Sent: Montag, 13. Dezember 2004 11:25
>> >> To: linux-mtd@lists.infradead.org
>> >> Subject: Writing data to Flash
>> >>
>> >>
>> >> Hi Stephan,
>> >>
>> >> In my target there is a Redhat ecos wherein basically I can find out 
>> >> the
>> >> usnused & used partiitions. To store data (ex: string) in the flash
>> >> firstly
>> >> I need to load the file into the RAM using the "fis load" command,
>> >> thereafter I need to create a partition in the flash based on the data 
>> >> in
>> >> the RAM using the command "fis create".
>> >>
>> >> To acheive it, the first step is how exaclty should I load data into 
>> >> the
>> >> (target's) RAM. After the data is available in the target's RAM then 
>> >> only
>> >> I
>> >> can create a partition and store data into the flash.
>> >>
>> >> Kindly suggest a suitable approach.
>> >>
>> >> Thanks,
>> >> Subrahmanyam.
>> >>
>> >>
>> >> ______________________________________________________
>> >> Linux MTD discussion mailing list
>> >> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>> >>
>> >
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
> 
