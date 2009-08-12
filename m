Received: from smtp-01.datacomm.ch ([212.40.2.26])
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MbIXx-0006UK-6d
	for linux-mtd@lists.infradead.org; Wed, 12 Aug 2009 18:27:41 +0000
Received: from [192.168.1.41] (142-186.77-83.cust.bluewin.ch [83.77.186.142])
	(Authenticated sender: Neukomm@vtxmail.ch)
	by smtp-01.datacomm.ch (VTX Datacomm AG) with ESMTPA id 45EAF1DC217
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Aug 2009 20:27:04 +0200 (CEST)
Message-ID: <4A83097B.3060509@vtxmail.ch>
Date: Wed, 12 Aug 2009 20:27:07 +0200
From: Daniel Neukomm <Neukomm@vtxmail.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: patch for mkfs.ubifs devtable.c increment in dev_table is wrongly
	interpreted
References: <4A759CF3.2010908@vtxmail.ch> <1249973154.19638.30.camel@localhost>
	<4A815420.1060802@gmail.com>
In-Reply-To: <4A815420.1060802@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy schrieb:
> On 08/11/2009 09:45 AM, Artem Bityutskiy wrote:
>> On Sun, 2009-08-02 at 16:04 +0200, Daniel Neukomm wrote:
>>> patch for mkfs.ubifs devtable.c increment in dev_table is wrongly
>>> interpreted
>>>
>>> with the device table one can add /dev entries to the root file system
>>> image.
>>> The device table file contains among others the fields minor, start,
>>> increment and count.
>>> If there is an entry with minor=0 start=0 increment =32 and count=4 the
>>> mkfs.ubifs makes
>>> 128 device entries, with minor numbers from 0 to 127
>>> The correct version makes 4 entries with minor number 0,32,64,96.
>>>
>>> /dev/mtd c 640 0 0 90 0 0  2 7
>>> This gives 14 devices /dev/mtdXX instead of  7 devices.
>>> Due to this error mtd_debug info /dev/mtd3 delivers the information of
>>> /dev/mtd1 instead of.
>>
>> Ok, below is how you was supposed to send the patch (without my
>> Signed-off-by, of course). I just applied your patch manually (usually
>> we use git am for this) and tweaked it.
>>
>> Please, check that I did not do any mistake. After you have confirmed
>> this, I'll push this to the mtd-utils repository.
>
> I've pushed it actually to mtd-utils.git. But please, check it anyway.
>
The new patch (without line-wrapping) works.
The actual trunk version from mtd-utils repository contains the intented 
corrections.
