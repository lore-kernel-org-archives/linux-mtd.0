Received: from smtpin1.mailsecure.in ([121.241.224.1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mm41A-00056j-5P
	for linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 11:10:20 +0000
Message-ID: <4AAA3088.5000905@tataelxsi.co.in>
Date: Fri, 11 Sep 2009 16:42:08 +0530
From: Rahanesh <rahanesh@tataelxsi.co.in>
MIME-Version: 1.0
To: Tadimarri Sarath Babu <sarath.babu@samsung.com>
Subject: Re: Problem with flash _info
References: <4AAA230D.80603@tataelxsi.co.in>
	<E8452F60DE9D4083A95641BE3B38EDA2@sisodomain.com>
In-Reply-To: <E8452F60DE9D4083A95641BE3B38EDA2@sisodomain.com>
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

Hai Sarath

Thank you so much


Rahanesh

Tadimarri Sarath Babu wrote:
> ----- Original Message -----=20
> From: "Rahanesh" <rahanesh@tataelxsi.co.in>
> To: <linux-mtd@lists.infradead.org>
> Sent: Friday, September 11, 2009 3:44 PM
> Subject: Problem with flash _info
>
>
>  =20
>> Hi all,
>>
>> I am using flash_info command on board. i have 4 mtd devices. /dev/mtd0,=
 /dev/mtd1, /dev/mtd2,=20
>> /dev/mtd3.
>>
>> how do i find the size of each mtd device.? I used flash_info.
>>    =20
>
>   flash_info has some problem in mtd-utils. I also observed the same.
>   You can try "mtd_debug" to get the size of the mtd device.
>   $mtd_debug info /dev/mtd2
>
>  =20
>> But when i used that i got the following message. "Device /dev/mtd2 has =
0 erase regions". It is=20
>> same for all the mtd devices.
>>
>> What might be the problem?
>>
>> Please help
>>
>> Rahanesh
>> .
>>
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/=20
>>    =20
>
>
>
>  =20
