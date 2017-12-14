Received: from smtp4.nedap.com ([213.160.213.85])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePNxB-0000ZO-7s
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 07:29:15 +0000
Subject: Re: Mounting issue with old uboot and new rootfs
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <d868125b-638e-4007-7a90-22937ffca9c6@nedap.com>
 <5001344.Umix9c0TK6@blindfold>
 <548ecb18-722c-f919-b245-d1b1c15c1697@nedap.com>
 <1850520.5cNxzxR8i7@blindfold>
From: Jaap de Jong <jaap.dejong@nedap.com>
Message-ID: <6db62c4b-653d-e224-283f-288a765899c5@nedap.com>
Date: Thu, 14 Dec 2017 08:28:48 +0100
MIME-Version: 1.0
In-Reply-To: <1850520.5cNxzxR8i7@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 13-12-17 17:42, Richard Weinberger wrote:
> Am Mittwoch, 13. Dezember 2017, 11:18:02 CET schrieb Jaap de Jong:
>>> Does everything work as expected if you don't set the resize flag in
>>> ubinize? Maybe this is the culprit.
>>
>> Yes, that was my last experiment and that works. It turns off the code
>> in the old uboot that modifies the volume in such a way that the new
>> kernel is not able to deal with it.
>> The strange thing is, that an old kernel doesn't mind.
> 
> Can you please rule out U-Boot first?
> IOW don't attach UBI from U-Boot and load the kernel via TFTP/NFS, etc...
> I'm still not sure whether this is a regression in Linux or U-Boot.
Sure. Did that and then there is no corruption. The old version uboot 
modifies the volume in a way that the new kernel can't handle. The old 
kernel on the other hand is able to mount that 'mangled' volume.

Jaap.
