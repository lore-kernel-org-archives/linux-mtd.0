Received: from moutng.kundenserver.de ([212.227.126.187])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgRAF-0007Sh-8F
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 16:13:11 +0000
Received: from [212.227.126.208] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1AgR8B-0008LQ-00
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 17:11:03 +0100
Received: from [10.100.100.154] by server5.adwin.de (GMS
	9.01.3158/LG0047.00.c59c3165) with ESMTP id ryvibaaa for
	linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 17:10:55 +0100
Date: Tue, 13 Jan 2004 17:10:54 +0100
To: linux-mtd@lists.infradead.org
References: <opr1py4bes8jdzbh@10.100.100.100>
	<20040113154724.GA23333@wohnheim.fh-wedel.de>
	<1074009621.17620.70.camel@hades.cambridge.redhat.com>
From: Markus Borchers <MBorchers@ADwin.de>
Content-Type: text/plain; format=flowed; charset=utf-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <opr1p1wgi48jdzbh@10.100.100.100>
In-Reply-To: <1074009621.17620.70.camel@hades.cambridge.redhat.com>
Subject: Re: overwrite complete flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Jan 2004 16:00:21 +0000, David Woodhouse <dwmw2@infradead.org> 
wrote:

> On Tue, 2004-01-13 at 16:47 +0100, Jörn Engel wrote:
>> > I miss a device-file (like /dev/hda) to have access independent of any
>> > partitions.
>>
>> Should be just like /dev/hda - look for the device with minor number 0
>> or create it, if you don't have it.
>
> That's not normally the case. It's _possible_ for the map driver to
> register the whole device first, and then the partitions -- but most
> don't.
>

/dev/mtdblock0 (minor 0) is partition 0 (RedBoot).
If it _is_ possible to register the whole device first, what do I have to 
do?
