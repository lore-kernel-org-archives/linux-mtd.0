Received: from cerga.lunarpages.com ([67.210.123.115])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rzr8k-0002Db-5Y
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2012 14:56:30 +0000
Received: from [189.136.20.204] (helo=[10.25.3.10])
 by cerga.lunarpages.com with esmtpa (Exim 4.69)
 (envelope-from <elopez@softel.net.mx>) id 1Rzr8S-00019B-Bf
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2012 06:56:08 -0800
Message-ID: <4F435C55.9000402@softel.net.mx>
Date: Tue, 21 Feb 2012 08:56:53 +0000
From: Esteban Lopez <elopez@softel.net.mx>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: df -h, du -ahx and flash size not match
References: <4F4285AF.30300@softel.net.mx>
 <CAN8TOE_dF1ri7cxMVBzZ9Mwqv-XCyo+mZJi1Nwhb7-OkBErU_A@mail.gmail.com>
In-Reply-To: <CAN8TOE_dF1ri7cxMVBzZ9Mwqv-XCyo+mZJi1Nwhb7-OkBErU_A@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I read the UBIFS FAQ and UBIFS documentation but all the explanation is about free space. I don't understand why df -h reports 236M of total space if I have 469762048 bytes in this partition.

rootfs                236M  138M   98M  59% /

cat /proc/mtd

dev:    size   erasesize  name

mtd0: 04000000 00020000 "Partition 1"

mtd1: 1c000000 00020000 "Partition 2"

Sorry if this is a obvious answer but I will apreciate your help to understand


El 02/20/2012 11:47 PM, Brian Norris escribió:
> On Mon, Feb 20, 2012 at 9:41 AM, Esteban Lopez<elopez@softel.net.mx>  wrote:
>> If I create big files and I run du -ahx command over / I get a  total of
>> 593M
>>   of info
>> Why the size not match ? why I can have 593M in my ROOTFS if I only have
>> 469762048 bytes?? Why df -h report 161M used in rootfs if du report 593M?
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_df_report
>
