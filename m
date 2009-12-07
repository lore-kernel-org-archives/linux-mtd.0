Received: from mail-bw0-f173.google.com ([209.85.218.173])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NHXUK-000568-Om
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 06:54:33 +0000
Received: by bwz21 with SMTP id 21so797190bwz.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Dec 2009 22:54:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1259916105.8673.10.camel@localhost>
References: <ce9ab5790912020628n5e91f811haa56b6380a71ab32@mail.gmail.com>
	<1259916105.8673.10.camel@localhost>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Mon, 7 Dec 2009 12:24:07 +0530
Message-ID: <ce9ab5790912062254q1fd80e3ev26c6e71cf24aab66@mail.gmail.com>
Subject: Re: [RFC] [PATCH] [MTD-UTILS]: flash_lock: fix length being passed
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 4, 2009 at 2:11 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Wed, 2009-12-02 at 19:58 +0530, Vimal Singh wrote:
>> This patch fixes the 'length' calculation.
>> Making it:
>> + =A0 =A0 =A0 mtdLockInfo.length =3D (num_sectors - 1) * mtdInfo.erasesi=
ze;
>> Rather:
>> - =A0 =A0 =A0 mtdLockInfo.length =3D num_sectors * mtdInfo.erasesize;
>>
>> Say there are 240 blocks present in the device. Then:
>> offset starts from: 0x0
>> and full size of device: 0x1E00000
>>
>> doing: 240 * 0x20000 gives -> 0x1E00000
>> But last block address should be 0x1DE0000 (which spans for 0x20000
>> bytes, adding upto size of 0x1E00000)
>>
>> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> ---
>>
>> --- flash_lock.c.org =A02009-11-24 19:33:18.000000000 +0530
>> +++ flash_lock.c =A0 =A0 =A02009-11-24 19:33:13.000000000 +0530
>> @@ -71,7 +71,7 @@ int main(int argc, char *argv[])
>> =A0 =A0 =A0 }
>>
>> =A0 =A0 =A0 mtdLockInfo.start =3D ofs;
>> - =A0 =A0 mtdLockInfo.length =3D num_sectors * mtdInfo.erasesize;
>> + =A0 =A0 mtdLockInfo.length =3D (num_sectors - 1) * mtdInfo.erasesize;
>> =A0 =A0 =A0 if(ioctl(fd, MEMLOCK, &mtdLockInfo))
>> =A0 =A0 =A0 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 fprintf(stderr, "Could not lock MTD device: =
%s\n", argv[1]);
>> @@ -81,4 +81,3 @@ int main(int argc, char *argv[])
>
> So if num_sectors is 1, mtdLockInfo.length is 0 - is it expected?

I think so. Suppose you want to lock 1st block: 'start' will be '0x0' and
if you pass 'length' as one block size then boundaries will be:

start: 0x0 ('0'th block)
end: 0x20000 (1st block)        if 0x20000 is the block size

so you will lock 2 blocks here.

While passing 'length' as '0' for this case will lock only 1st block
(0th block).

--=20
Regards,
Vimal Singh
