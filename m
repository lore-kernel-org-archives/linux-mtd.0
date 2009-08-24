Received: from smtpin1.mailsecure.in ([121.241.224.1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfWA7-0004q8-CY
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 09:48:31 +0000
Message-ID: <4A92624A.9030801@tataelxsi.co.in>
Date: Mon, 24 Aug 2009 15:20:02 +0530
From: Rahanesh <rahanesh@tataelxsi.co.in>
MIME-Version: 1.0
To: Radha Mohan <radhamohan_ch@yahoo.com>
Subject: Re: Unale to  get MTD device info
References: <4A9223BA.4020201@tataelxsi.co.in>	<136203.4177.qm@web94808.mail.in2.yahoo.com>	<4A923BC6.3000806@tataelxsi.co.in>
	<323485.33669.qm@web94802.mail.in2.yahoo.com>
In-Reply-To: <323485.33669.qm@web94802.mail.in2.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mohan,

That was really very helpful..

After doing this i am nw able to erase flash.

Few doubts:

I thought Flashes are block devices. How come we treat this as char=20
devices? Why should we treat as char device?

why minor mumber should be incremented by  2?

What happens when we do a mknod /dev/mtd0 c 90 0?

Do we need to do anything with the /dev/mtdblock0 while erasing and=20
reflashing ?

Thanks
Rahanesh


Radha Mohan wrote:
> Hi,
>
> Create char mtd devices
>
> mknod /dev/mtd0 c 90 0
> mknod /dev/mtd1 c 90 2
> ..
> ..
> Note that the minor number increments by 2.
> Before that you will need to confirm whether CONFIG_MTD_CHAR is set in yo=
ur kernel or not. This will enable char device access
> to your mtdblock device. Or else you will not be able to write to mtd0 ch=
ar device.
>
> You can erase and copy anything to the mtd devices. You can use "flashcp"=
 from the mtd-utils. Else you can write your own code to write to
> the flash. You can take help of the flashcp code in mtd-utils.=20
>
> -- Mohan
>
> ________________________________
> From: Rahanesh <rahanesh@tataelxsi.co.in>
> To: Radha Mohan <radhamohan_ch@yahoo.com>
> Cc: linux-mtd@lists.infradead.org
> Sent: Monday, 24 August, 2009 12:35:42 PM
> Subject: Re: Unale to  get MTD device info
>
> Hi Radha Mohan ,
>
> Thanks a lot for responding.
>
> I have few doubts regarding your reply.
>
> In the /dev/ partition of Linux i cannot see any mtd char device. Only=20
> mtdblock is there.
>
> Can i convert the block devices to character devices? if so how?
>
> Is it possible for me to erase mtdblock0 and copy to mtdblock0 using any=20
> other utilities?
>
> I am a newbie to all this. Please give your valuable suggestions
>
> Thanks
> Rahanesh
>
>
> Radha Mohan wrote:
>  =20
>> hi rahanesh,
>>
>> The mtd-utils do not work on block devices like mtdblock0. Use mtd0=20
>> instead. The mtd0 is char device of mtdblock0.
>>
>> -- Mohan
>>
>> ------------------------------------------------------------------------
>> *From:* Rahanesh <rahanesh@tataelxsi.co.in>
>> *To:* linux-mtd@lists.infradead.org
>> *Sent:* Monday, 24 August, 2009 10:53:06 AM
>> *Subject:* Unale to get MTD device info
>>
>> Hi all,
>>
>> I have four mtdblocks in my flash .
>> mtdblock0 -> Primary bootloader
>> mtdblock1 -> uboot
>> mtdblock2 -> JFFS
>> mtdbloack3-> config
>>
>> During Linux booting , it mounts mtdblock2 to a temp folder which can=20
>> be seen as a part of ramdisk(root file system of linux)
>>
>> Now from Linux i need to flash a new jffs image to mtdblock2 itself.
>>
>> With the support from this mailing list i have copied mtd-utilities=20
>> package into Linux. Now i have flash_eraseall and flash_cp commands.
>>
>> But when i run flash_eraseall  i gett the following error
>>
>>
>> flash_eraseall: /dev/mtdblock1: *unable to get MTD device info
>>
>> *Please help on this!!!!!!!
>>
>> Thanks
>> Rahanesh
>>
>>
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>> ------------------------------------------------------------------------
>> Looking for local information? Find it on Yahoo! Local=20
>> <http://in.rd.yahoo.com/tagline_local_1/*http://in.local.yahoo.com/>
>>    =20
>
>
>       See the Web&#39;s breaking stories, chosen by people like you. Chec=
k out Yahoo! Buzz. http://in.buzz.yahoo.com/
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>  =20
