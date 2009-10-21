Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0YHS-00055e-6B
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 10:19:02 +0000
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KRV00EF60NJ1J@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 19:18:55 +0900 (KST)
Received: from Sarathbabu ([107.108.214.67])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KRV00B3F0NH3U@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 19:18:55 +0900 (KST)
Date: Wed, 21 Oct 2009 15:46:12 +0530
From: Tadimarri Sarath Babu <sarath.babu@samsung.com>
Subject: Re: giving room for Linux filesystems on MLC/SLC
To: dedekind1@gmail.com, Emmanuel Michon <emmanuel.michon@polytechnique.org>
Message-id: <AB300970FA23440CAB303425CA9D9A58@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <81859150910200356i1e80bb4er1b97046f43415938@mail.gmail.com>
	<1256042365.29856.260.camel@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


----- Original Message ----- 
From: "Artem Bityutskiy" <dedekind1@gmail.com>
To: "Emmanuel Michon" <emmanuel.michon@polytechnique.org>
Cc: <linux-mtd@lists.infradead.org>
Sent: Tuesday, October 20, 2009 6:09 PM
Subject: Re: giving room for Linux filesystems on MLC/SLC


> On Tue, 2009-10-20 at 12:56 +0200, Emmanuel Michon wrote:
>> Hello,
>>
>> we're preparing in my company the software for a general purpose (.5K,
>> 2K, 4KB page)
>> hardware MLC/SLC controller, especially how we're going to
>> choose the byte offsets of a page+spare for `metadata' and `bad
>> blocks' (those are excluded by our ECC check hardware).
>>
>> 0                                               4096+epsilon
>> | metadata | data | bb info | data
>>
>> Our primary goal is to be compatible with our proprietary filesystem,
>> but if we can enable Linux family of MTD FS with little effort, let's
>> prepare it
>>
>> `bad block' information is a hardware stuff (unconsistently, poorly)
>> documented to be near the start of spare area.
>>
>> For some reason we have this 4 byte metadata at the start of each
>> page. Does this software concept apply to ubifs and friends and should
>> it be sized differently?
>
> We work with an abstract flash mode: it consists of eraseblock, each
> eraseblock has several min. I/O units. So if in your cases the driver
> hides these meta-data bytes, it should be fine.
>
> However, current UBIFS is hard-coded with an assumption that min. I/O
> size is power of 2. This would probably have to change. There was no
> fundamental reason why we did it like this, we just wanted to save some
> CPU cycles and avoid divisions. But this can be changed.
>
>> Btw, any success stories about UBIFS+MLC since the FAQ report on this topic?
>
> I have not heard them.

I have recently tested UBI/UBIFS using "fsstress" command with linux-2.6.28 kernel on FlexOneNAND
over 256 MB MLC partition.
The test has run fine for 4 days continuosly.

I used the following command line parameters for the fsstress.
fsstress -p 3 -n 10000 -d /tmp -l 0

I have a plan to test the UBI/UBIFS on latest linux-2.6.31 kernel . Will let you know the results
once it is done.

Regards,
Sarath.
