Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MsEza-0005jH-5n
	for linux-mtd@lists.infradead.org; Mon, 28 Sep 2009 12:06:14 +0000
Message-ID: <4AC0A5D4.2060609@gmail.com>
Date: Mon, 28 Sep 2009 15:02:28 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] UBIFS: Add /dev/ubiX_Y naming scheme in open_ubi
References: <71cd59b00909241541y645c40farac56a7eadb84c02b@mail.gmail.com>	
	<1253832477-29064-1-git-send-email-corentincj@iksaif.net>	
	<1254137943.3778.60.camel@localhost>
	<71cd59b00909280453w31fcd22co4c41167e125b9188@mail.gmail.com>
In-Reply-To: <71cd59b00909280453w31fcd22co4c41167e125b9188@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: util-linux-ng@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/28/2009 02:53 PM, Corentin Chary wrote:
>>> +     if (!strncmp("/dev/", name, 5))
>>> +             name = name + 5;
>>> +
>>>        if (name[0] != 'u' || name[1] != 'b' || name[2] != 'i')
>>>                return ERR_PTR(-EINVAL);
>>
>> But UBI volume may have arbitrary names. Could we invent something
>> better?
>
>
> Using name and kern_path we can find the corresponding inode (and
> major/minor informations).
> ubi_open_volume use ubi_num and vol_id.
> vol_id is minor()-1, but major is not related to ubi_num.
>
> UBI have a "ubi_major2num" internally, is it ok to export this symbol ?
>
> Then we could do something like
> ubi_open_volume(ubi_major2num(major()), minor()-1)

Sounds good.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
